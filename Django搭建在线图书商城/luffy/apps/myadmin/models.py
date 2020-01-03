from django.db import models

# Create your models here.
# 会员模型
class Users(models.Model):
	# id,手机号,密码,头像
	phone = models.CharField(max_length=11)
	password = models.CharField(max_length=80)
	face = models.CharField(max_length=100,default="/static/myadmin/assets/img/timg.jpg")
	# 昵称,居住地址,性别,身份类型
	nikename = models.CharField(max_length=20,null=True)
	homeaddress = models.CharField(max_length=100,null=True)
	sex = models.CharField(max_length=10,null=True)
	# 0 狼人 1预言家 2平民
	usertype = models.CharField(max_length=10,null=True)
	registerdate = models.DateTimeField(auto_now_add=True)

	class Meta:
		permissions={
		    ("show_Users","查看用户列表权限"),
		    ("create_Users","添加用户信息权限"),
		    ("edit_Users","修改用户信息权限"),
		    ("remove_Users","删除用户信息权限"),
		}


# 图书分类模型
class Booktype(models.Model):
	name = models.CharField(max_length=20)
	pid = models.IntegerField()
	path = models.CharField(max_length=50)

	class Meta:
		permissions={
		    ("show_Booktype","查看图书类别列表权限"),
		    ("create_Booktype","添加图书类别信息权限"),
		    ("edit_Booktype","修改图书类别信息权限"),
		    ("remove_Booktype","删除图书类别信息权限"),
		}

# 图书商品模型
class Books(models.Model):
	typeid = models.ManyToManyField(to="Booktype")
	title = models.CharField(max_length=50)
	tuijian = models.CharField(max_length=255)
	author = models.CharField(max_length=50)
	publisher = models.CharField(max_length=100)
	pub_date = models.DateField()
	price = models.FloatField()
	num = models.IntegerField()
	ISBN = models.CharField(max_length=30)
	context = models.TextField()
	
	class Meta:
		permissions={
		    ("show_Books","查看图书列表权限"),
		    ("create_Books","添加图书信息权限"),
		    ("edit_Books","修改图书信息权限"),
		    ("remove_Books","删除图书信息权限"),
		}

# 图书封面图集
class BookImgs(models.Model):
	bookid = models.ForeignKey('Books', on_delete=models.CASCADE,)
	img_url = models.ImageField(upload_to='static/uploads/')

# 购物车模型
class Cart(models.Model):
	# id 用户id,商品id,数量,select
	uid = models.ForeignKey('Users', on_delete=models.CASCADE,)
	bid = models.ForeignKey('Books', on_delete=models.CASCADE,)
	num = models.IntegerField()
	# 是否选中  0 未选中  1选中
	select = models.IntegerField(default=0)


# 订单模型
class Order(models.Model):
	'''
		id,uid,收获信息,总价,状态 0 1 2 3,订单创建时间,订单支付时间,
		10001 1024 s.p.a,  999.99 0
	'''
	uid = models.ForeignKey('Users', on_delete=models.CASCADE,)
	name =  models.CharField(max_length=10)
	phone =  models.CharField(max_length=11)
	address =  models.CharField(max_length=100)
	totalprice = models.FloatField()
	# 0未支付 1已支付 2已发货 3 已收货 4 已取消
	status = models.IntegerField(default=0)
	ordertime = models.DateTimeField(auto_now_add=True)
	paytime = models.DateTimeField(null=True)
	
	class Meta:
		permissions={
		    ("show_Order","查看订单列表权限"),
		    ("create_Order","添加订单信息权限"),
		    ("edit_Order","修改订单信息权限"),
		    ("remove_Order","删除订单信息权限"),
		}



# 订单详情
class OrderDetail(models.Model):
	'''
		id,订单号,商品id,商品数量,商品价格
			10001 10    2       10
			10001 8     1       10
	'''
	orderid = models.ForeignKey('Order', on_delete=models.CASCADE,)
	bid = models.ForeignKey('Books', on_delete=models.CASCADE,)
	num = models.IntegerField()
	price = models.FloatField()

