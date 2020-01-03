from django.shortcuts import render,reverse
from django.http import HttpResponse,JsonResponse,HttpResponseNotFound,Http404,HttpResponseRedirect
from ...myadmin import models
from .indexviews import gettypes
from django.views.decorators.csrf import csrf_exempt
from .PayViews import pay_request


# 订单结算页
def confirm(request):
	# 接收当前的购物车商品信息
	ids = request.GET.get ('ids','').split (',')
	# 获取对应的购物车商品对象
	data = models.Cart.objects.filter (id__in=ids)
	# 分配数据
	context = {'booktypes': gettypes (),'carts': data}
	return render (request,'myhome/order/confirm.html',context)


# 创建订单
def create(request):
	# 接收数据
	data = request.POST.dict ()
	data.pop ('csrfmiddlewaretoken')
	VipUser = request.session.get ('VipUser')

	# 计算总价
	totalprice = 0
	# 查询购物车商品
	ids = data['ids'].split (',')
	carts = models.Cart.objects.filter (id__in=ids)
	for x in carts:
		totalprice += x.num * x.bid.price

	# 准备订单数据
	orderdata = {
		'uid': models.Users.objects.get (id=VipUser['id']),
		'name': data['name'],
		'phone': data['phone'],
		'address': data['address'],
		'totalprice': float ('%.2f' % totalprice)
	}

	# 执行订单的创建
	orderobj = models.Order (**orderdata)
	orderobj.save ()

	# 准备订单详情数据
	for x in carts:
		detaildata = {
			'orderid': orderobj,
			'bid': x.bid,
			'price': x.bid.price,
			'num': x.num
		}
		# 执行订单详情的创建
		detailobj = models.OrderDetail (**detaildata)
		detailobj.save ()

		# 把下订单的购物车商品,在购物车中删除
		x.delete ()

	# 跳转到订单支付页面
	url = reverse ('myhome_order_pay',args=(orderobj.id,))
	return HttpResponseRedirect (url)


# 发起支付请求 buy+
def buypay(request,orderid):
    # 获取订单对象
    obj = models.Order.objects.get (id=orderid)

    return pay_request (obj)


# 个人中心,我的订单
def mylist(request):
    # 检测是否登录
    VipUser = request.session.get ('VipUser')
    if not VipUser['id']:
        return HttpResponse ('<script>alert("请先登录");location.href="/login?nextpath=/order/mylist/";</script>')

    # 根据用户id获取当前用户的所有订单
    user = models.Users.objects.filter (id=VipUser['id']).first()
    # 分配数据
    context = {'user': user,'booktypes': gettypes ()}

    # 加载模板
    return render (request,'myhome/order/myorderlist.html',context)

def delepay(request,orderid):
    obj=models.Order.objects.get(id=orderid)
    obj.delete()
    # return render(request,'myhome/order/myorderlist.html')
    return mylist(request)