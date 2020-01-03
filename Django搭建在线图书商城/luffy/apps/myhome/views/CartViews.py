from django.shortcuts import render,reverse
from django.http import HttpResponse,JsonResponse,HttpResponseNotFound,Http404
from ...myadmin import models
from .indexviews import gettypes
from django.views.decorators.csrf import csrf_exempt


# 购物车列表页
def index(request):
	# 获取当前用户的购物车数据

	# 判断当前用户是否登录
	vipuser = request.session.get ('VipUser')
	if not vipuser:
		# return JsonResponse ({'code': 1,'msg': '当前用户没有登录'})
		url =reverse('myhome_login')
		return HttpResponse (f'<script>alert("请先登录");location.href="{url}"</script>')

	# 获取用户对象
	obj = models.Users.objects.get (id=vipuser['id'])

	# 分配数据
	context = {'booktypes': gettypes (),'user': obj}
	# 加载模板
	return render (request,'myhome/cart/index.html',context)


# 加入购物车
@csrf_exempt #屏蔽csrf,也可以使用$.ajaxSetup
def add(request):
	# 接收ajax提交的数据
	data = request.POST.dict ()
	vipuser = request.session.get ('VipUser')

	# 判断当前用户是否登录
	if not vipuser['id']:
		return JsonResponse ({'code': 1,'msg': '当前用户没有登录'})

	# 准备数据,
	data['uid'] = models.Users.objects.get (id=vipuser['id'])
	data['bid'] = models.Books.objects.get (id=data['bid'])

	try:
		# 判断当前加入购物车的商品是否已经存在
		cart = data['uid'].cart_set.filter (bid=data['bid'])
		if cart.count ():
			# 存在,就更新数量
			obj = cart[0]
			obj.num += int (data['num'])
			obj.save ()
		else:
			# 把数据	添加到购物车
			obj = models.Cart (**data)
			obj.save ()
		return JsonResponse ({'code': 0,'msg': '加入购物车成功'})
	except:
		return JsonResponse ({'code': 1,'msg': '加入购物车失败'})


# 更新购物车商品数量
def edit(request):
	cartid = request.GET.get ('cartid')
	num = request.GET.get ('n')
	try:
		obj = models.Cart.objects.get (id=cartid)
		obj.num = num
		obj.save ()
		return JsonResponse ({'code': 0,'msg': '商品数量更新成功'})
	except:
		return JsonResponse ({'code': 1,'msg': '商品数量更新失败'})


# 删除购物车商品
def delete(request):
	cartid = request.GET.get ('cartid')
	try:
		obj = models.Cart.objects.get (id=cartid)
		obj.delete ()
		return JsonResponse ({'code': 0,'msg': '商品删除成功'})
	except:
		return JsonResponse ({'code': 1,'msg': '商品删除失败'})

