from django.shortcuts import render
import requests
from ...myadmin import models
from django.http import HttpResponse,JsonResponse,Http404


# 前台首页
def index(request):
	# 获取首页中所有的图书列表
	bs = models.Books.objects.all()
	#获取热销图书列表
	rx1=models.Books.objects.all()[:3]
	#获取精品图书
	jp = models.Books.objects.all ()[6:12]
	#获取新品图书
	xs = models.Books.objects.all ()[12:18]
	# 分配数据
	context = {'booktypes':gettypes(),'books':bs,'rx1':rx1,'jp':jp,'xs':xs}
	# 加载模板
	return render(request,'myhome/index.html',context)


# 前台列表页
def booklist(request,tid):
	# 获取当前分类对象
	t = models.Booktype.objects.get(id=tid)
	#判断是否为顶级分类
	if t.pid == 0:
		t.sub = models.Booktype.objects.filter(pid=t.id)
		t.parent = t.name
	else:
		t.sub = models.Booktype.objects.filter(pid=t.pid)
		parent = models.Booktype.objects.get(id=t.pid)
		t.parent = parent.name

	'''
	{'id':13,'name':'小说',parent:'小说',sub:[t,t,t]}
	{'id':17,'name':'现代小说',parent:'小说',sub:[t,t,t]}

	'''

	# 分配数据
	context = {'booktypes':gettypes(),'data':t}
	# 加载模板
	return render(request,'myhome/list.html',context)


# 前台详情页
def detail(request,bid):
	try:
		# 根据传递的id获取书籍信息
		book = models.Books.objects.get(id=bid)
		bs = models.Books.objects.all ()

		# 分配数据
		context = {'booktypes':gettypes(),'book':book,'bs':bs}
		# 加载模板
		return render(request,'myhome/detail.html',context)
	except:
		# 抛出404
		# return HttpResponseNotFound()
		raise Http404("找不到你想要的商品哦...")


def gettypes():
	# 获取首页的分类列表
	ts = models.Booktype.objects.filter(pid=0)
	for x in ts:
		x.sub = models.Booktype.objects.filter(pid=x.id)
	return ts