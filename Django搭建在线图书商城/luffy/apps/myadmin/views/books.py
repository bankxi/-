from django.shortcuts import render,reverse
from django.http import HttpResponse,JsonResponse
from django.contrib.auth.hashers import make_password,check_password
import random,time,os
from .. import models
from django.core.paginator import Paginator
from .types import selecttype
from django.contrib.auth.decorators import permission_required


# Create your views here.
@permission_required('myadmin.show_Books',raise_exception=True)
def index(request):
    data = models.Books.objects.all ()
    # text = models.Booktype.objects.all ()

    # 接收搜索条件
    selecttype = request.GET.get ('selecttype',None)
    keywords = request.GET.get ('keywords',None)
    if selecttype:
        # 有搜索条件
        if selecttype == 'all':
            # 按照多字段进行条件搜索
            from django.db.models import Q
            data = data.filter (
                Q (title__contains=keywords) | Q (author__contains=keywords) | Q (publisher__contains=keywords))
            # select * from users where name like '%a%' or phone like '%a%'
        else:
            serdata = {f'{selecttype}__contains': keywords}
            data = data.filter (**serdata)

    # 实例化分页对象,参数1,数据集,参数2 每页显示的条数
    p = Paginator (data,10)

    # 接收当前的页码数
    inx_p = request.GET.get ('page',1)

    # 获取当前页的数据
    userlist = p.get_page (inx_p)
    content = {'data': userlist}
    return render (request,'myadmin/books.html',content)

@permission_required('myadmin.create_Books',raise_exception=True)
def add(request):
    types = selecttype ()
    content = {'types': types}
    return render (request,'myadmin/bookadd.html',content)

@permission_required('myadmin.create_Books',raise_exception=True)
def insert(request):
    try:
        data = request.POST.dict ()
        data.pop ('csrfmiddlewaretoken')
        data.pop ('typeid')
        pic = request.FILES.getlist ('pics')
        if len(pic)!=4:
            data.pop ('pics')

        # 获取选择的分类id
        typeid = request.POST.getlist ('typeid')
        # 根据分类id获取分类对象
        typeobjs = models.Booktype.objects.filter (id__in=typeid)

        # 检测当期是否上传了图片
        if not request.FILES.getlist ('pics',None):
            return HttpResponse ('<script>alert("请为书籍添加一张封面图");location.href="history.back();"</script>')
        # 创建书籍对象,完成添加
        obj = models.Books (**data)
        obj.save ()
        # 给书籍和分类设置关系 ，set()替换相关对象集比add稳定
        obj.typeid.set (typeobjs)
        # 图书的图片处理
        file = request.FILES.getlist ('pics',None)
        for i in file:
            img = imgload (i)
            models.BookImgs.objects.create (img_url=img,bookid=obj)

            url = reverse ('myadmin_books')
        return HttpResponse (f'<script>alert("图书商品添加成功");location.href="{url}"</script>')
    except:
        url = reverse('myadmin_booksadd')
        return HttpResponse(f'<script>alert("图书商品添加失败");location.href="{url}"</script>')


# 删除book商品及清理数据库 数据
@permission_required('myadmin.remove_Books',raise_exception=True)
def dele(request):
    try:
        id = request.GET.get ('id')
        obj = models.Books.objects.get (id=id)

        img = models.BookImgs.objects.filter (bookid=obj.id)
        for i in img:
            print (i.img_url)
            os.remove ("." + str (i.img_url))

        obj.delete ()
        return JsonResponse ({'code': 0,'msg': '删除成功'})
    except:
        return JsonResponse ({'code': 1,'msg': '删除失败'})


# 更改商品信息
@permission_required('myadmin.edit_Books',raise_exception=True)
def edit(request,id):
    # 获取book信息及 图书类别名信息
    # 获取要更改的book的id
    obj = models.Books.objects.get (id=id)

    # 所有的分类名
    types = selecttype ()

    # 根据bookID获取类型名id
    typeid = obj.typeid.all ()
    ls = []
    for i in typeid:
        u = i.id
        ls.append (u)

    # 获取图片封面信息
    pic = models.BookImgs.objects.filter (bookid=id)
    img = []
    for i in pic:
        iu = i.img_url
        img.append (iu)
    content = {'data': obj,'types': types,'img': img,'ls': ls}

    return render (request,'myadmin/bookedit.html',content)


# 展示图片函数
def editimg(request):
    id = request.GET.get ('id')
    # 获取图片封面信息
    pic = models.BookImgs.objects.filter (bookid=id)
    img = []
    for i in pic:
        iu = str (i.img_url)
        img.append (iu)
    return JsonResponse ({'code': 0,'img': img})


# ajax修改时删除照片
def editimgdel(request):
    try:
        img_url = request.GET.get ('data')
        # url("/static/uploads/1571789162.2152119user02.png")
        imgurl = img_url.split ('"')
        obj = models.BookImgs.objects.get (img_url=imgurl[1])
        obj.delete ()
        return JsonResponse ({'code': 0,'msg': '删除成功'})
    except:
        return JsonResponse ({'code': 1,'msg': '删除失败'})

@permission_required('myadmin.edit_Booktype',raise_exception=True)
def bookedit(request):
    face = request.FILES.getlist ('face')
    type = request.POST.getlist ('typeid')
    typeobj = models.Booktype.objects.filter (id__in=type)
    data = request.POST.dict ()
    print (face)
    data.pop ('csrfmiddlewaretoken')
    data.pop ('typeid')
    # data.pop ('old_face')
    # if len (face) < 1:
    data.pop ('face')

    models.Books.objects.filter (id=data['id']).update (**data)

    obj = models.Books.objects.get (id=data['id'])
    if type:
        obj.typeid.set (typeobj)
    if face:
        for i in face:
            img = imgload (i)
            models.BookImgs.objects.create (img_url=img,bookid=obj)
    url = reverse ('myadmin_books')
    return HttpResponse (f'<script>alert("图书商品修改成功");location.href="{url}"</script>')


# def bookeditpic(request):
#     try:
#         img_url=request.GET.get('img_url')
#         os.remove('.'+str(img_url))
#         obj=models.BookImgs.objects.get(img_url=img_url)
#         obj.delete()
#         return JsonResponse({'code':0,'msg':'删除成功'})
#     except:
#         return JsonResponse ({'code': 1,'msg': '删除失败'})


def imgload(file):
    try:
        filename = str (random.randint (10000,99999) + time.time ()) + file.name
        # filename = str (random.randint (10000,99999) + time.time ()) + file.name.split ('.').pop ()
        with open (f'./static/uploads/{filename}','wb+') as fp:
            for chunk in file.chunks ():
                fp.write (chunk)

        return f'/static/uploads/{filename}'
    except:
        return False
