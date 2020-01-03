from django.shortcuts import render
import requests
from ...myadmin import models
from django.http import HttpResponse,JsonResponse
from django.contrib.auth.hashers import make_password, check_password
import random


# 登录页面
def login(request):
    return render (request,'myhome/login/login.html')


def dologin(request):
    data = request.POST.dict ()
    data.pop ('csrfmiddlewaretoken')

    nextpath = request.GET.get('nextpath','/')
    if nextpath == '':
        nextpath = '/'

    # 通过手机号获取用户对象
    # 检测账户和密码
    obj = models.Users.objects.get (phone=data['phone'])
    print(obj)
    if not obj:
        return HttpResponse ('<script>alert("账户不存在");history.go(-1);</script>')

    # 验证密码
    from django.contrib.auth.hashers import make_password,check_password
    if check_password (data['password'],obj.password):
        # 完成登录操作
        request.session['VipUser'] = {'id': obj.id,'phone': obj.phone}
        return HttpResponse (f'<script>alert("欢迎登录");location.href="{nextpath}";</script>')
    else:
        return HttpResponse ('<script>alert("密码不正确");history.go(-1);</script>')


def logout(request):
    # request.session['VipUser'] = ''
    # del request.sessionp['VipUser']
    request.session.flush ()
    return HttpResponse (f'<script>alert("退出成功");location.href="/login"</script>')


# 注册页面
def register(request):
    return render (request,'myhome/login/register.html')


# 执行注册操作
def doregister(request):
    data = {}
    data['phone'] = request.POST.get ('phone')
    data['password'] = request.POST.get ('password')

    # 验证手机验证码是否正确

    # 密码加密,
    data['password'] = make_password (data['password'],None,'pbkdf2_sha256')

    # 存入数据库
    obj = models.Users (**data)
    obj.save ()

    return HttpResponse (f'<script>alert("注册成功,欢迎登录");location.href="/login"</script>')


# 手机号注册时的验证
def checkphone(request):
    # 接收
    phone = request.GET.get ('phone')
    # 验证
    n = models.Users.objects.filter (phone=phone).count ()
    if n:
        return JsonResponse ({'code': 1,'msg': '手机号码已存在'})
    else:
        return JsonResponse ({'code': 0,'msg': '手机号码可用'})


# 给手机号码发送短信验证
def sendphone(request):
    # 接收手机号码
    phone = request.GET.get ('phone')
    # 发送短信验证码的api地址
    vcode = random.randint (10000,99999)
    request.session['vcode'] = {'phone': phone,'vcode': vcode}
    if SendCode (phone,vcode):
        return JsonResponse ({'code': 0,'msg': '短信验证码已经发送,请查收','vcode': 123456})
    else:
        return JsonResponse ({'code': 1,'msg': '短信验证码发送失败','vcode': vcode})


def SendCode(phone,vcode):
    # url = 'https://open.ucpaas.com/ol/sms/sendsms'
    # # 请求时的post数据
    # data = {
    #     "sid": "4c0064b5f77af9da37fb74145594092e",
    #     "token": "1db32087f3b4111610f753a4ded823c1",
    #     "appid": "328129a7423b4bf595bc4435e80f8e1c",
    #     "templateid": "510851",
    #     "param": vcode,
    #     "mobile": phone
    # }
    # headers = {
    #     'Content-Type': 'application/json'
    # }
    # # print(data)
    # # 发送请求
    # response = requests.post (url,json=data,headers=headers)
    # # 接收响应结果
    # res = response.json ()
    # # 判断当前短信是否发送成功
    # # {'code': '000000', 'count': '1', 'create_date': '2019-10-23 11:23:54', 'mobile': '17610195211', 'msg': 'OK', 'smsid': '206a1c3f1beff23bafdc71e063a3dbad', 'uid': ''}
    # if res['code'] == '000000' and res['msg'] == 'OK':
    #     return True
    # else:
    #     return False
    return True