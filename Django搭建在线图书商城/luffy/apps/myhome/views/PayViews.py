from django.shortcuts import render,reverse
from django.http import HttpResponse,JsonResponse,HttpResponseNotFound,Http404,HttpResponseRedirect
from ...myadmin import models
from .indexviews import gettypes
from django.views.decorators.csrf import csrf_exempt

# 支付宝对象创建方法
from luffy import settings
from utils.pay import AliPay


# AliPay 对象实例化
def Get_AliPay_Object():
    alipay = AliPay (
        appid=settings.ALIPAY_APPID,  # APPID （沙箱应用）
        app_notify_url=settings.ALIPAY_NOTIFY_URL,  # 回调通知地址
        return_url=settings.ALIPAY_RETURN_URL,  # 支付完成后的跳转地址
        app_private_key_path=settings.APP_PRIVATE_KEY_PATH,  # 应用私钥
        alipay_public_key_path=settings.ALIPAY_PUBLIC_KEY_PATH,  # 支付宝公钥
        debug=True,  # 默认False,
    )
    return alipay


# 发起支付请求
def pay_request(orderobj):
    # 获取支付对象
    alipay = Get_AliPay_Object ()

    # 生成支付的url
    query_params = alipay.direct_pay (
        subject='天书商城_书籍购买',  # 商品简单描述
        out_trade_no=orderobj.id,  # 用户购买的商品订单号
        total_amount=orderobj.totalprice,  # 交易金额(单位: 元 保留俩位小数)
    )

    # 支付宝网关地址（沙箱应用）
    pay_url = settings.ALIPAY_URL + "?{0}".format (query_params)

    print ('正在发起支付请求...')

    # 页面重定向到支付页面
    return HttpResponseRedirect (pay_url)


# 支付宝回调地址 post
from django.views.decorators.csrf import csrf_exempt


@csrf_exempt
def pay_result(request):
    # 获取对象
    alipay = Get_AliPay_Object ()
    if request.method == "POST":
        # 检测是否支付成功
        # 去请求体中获取所有返回的数据：状态/订单号
        from urllib.parse import parse_qs
        # name&age=123....
        body_str = request.body.decode ('utf-8')
        post_data = parse_qs (body_str)

        post_dict = {}
        for k,v in post_data.items ():
            post_dict[k] = v[0]

        sign = post_dict.pop ('sign',None)
        status = alipay.verify (post_dict,sign)
        print ('------------------开始------------------')
        print ('POST验证',status)
        print (post_dict)
        out_trade_no = post_dict['out_trade_no']

        # 修改订单状态
        ass = {'status': 1,'paytime': post_dict['gmt_payment']}
        print (ass)
        models.Order.objects.filter (id=out_trade_no).update (**ass)
        print ('------------------结束------------------')
        # 修改订单状态：获取订单号
        return HttpResponse ('success')


# 回调地址 get
def pay_getresult(request):
    alipay = Get_AliPay_Object ()
    params = request.GET.dict ()
    sign = params.pop ('sign',None)
    status = alipay.verify (params,sign)
    print ('==================开始==================')
    print ('GET验证',status)
    print ('==================结束==================')
    return HttpResponse ('<script>alert("支付成功");location.href="/order/mylist"</script>')


