from django.contrib import admin
from django.urls import path,include
from .views import *
urlpatterns = [
    # path('admin/', admin.site.urls),
    #前台首页
    path('', indexviews.index,name='myhome_index'),
	#列表
    path ('list/<int:tid>',indexviews.booklist,name="myhome_list"),
	#详情
    path ('detail/<int:bid>',indexviews.detail,name="myhome_detail"),

	# 购物车列表
	path ('cart/index',CartViews.index,name="myhome_cart_index"),
	# 加入购物车
	path ('cart/add',CartViews.add,name="myhome_cart_add"),
	# 更新购物车数量
	path ('cart/edit',CartViews.edit,name="myhome_cart_edit"),
	# 删除购物车商品
	path ('cart/delete',CartViews.delete,name="myhome_cart_delete"),

	# 订单结算页
	path ('order/confirm',OrderViews.confirm,name="myhome_order_confirm"),
    #订单创建
	path ('order/create',OrderViews.create,name="myhome_order_create"),
	# 发起支付请求
	path ('order/pay/<int:orderid>',OrderViews.buypay,name="myhome_order_pay"),
	path ('order/dele/<int:orderid>',OrderViews.delepay,name="myhome_order_dele"),

    # 支付成功后跳转的地址 个人中心 我的订单
    path ('order/mylist',OrderViews.mylist,name="myhome_order_mylist"),
    # 回调地址
    path ('order/pay_result',PayViews.pay_result,name="myhome_pay_result"),
    path ('order/pay_getresult',PayViews.pay_getresult,name="myhome_pay_getresult"),

    #前台登录注册表单验证相关路由
    path ('login',loginviews.login,name="myhome_login"),
    path ('dologin',loginviews.dologin,name="myhome_dologin"),
    path ('logout',loginviews.logout,name="myhome_logout"),
    path ('register',loginviews.register,name="myhome_register"),
    path ('doregister',loginviews.doregister,name="myhome_doregister"),
    path ('checkphone',loginviews.checkphone,name="myhome_checkphone"),
    path ('sendphone',loginviews.sendphone,name="myhome_sendphone"),

    # path('admin/', admin.site.urls),
]
