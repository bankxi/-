from django.shortcuts import render,reverse
from django.http import HttpResponse,JsonResponse
from django.contrib.auth.hashers import make_password,check_password
import random,time,os
from .. import models
from django.core.paginator import Paginator
from django.contrib.auth.decorators import permission_required

# Create your views here.
def selecttype():
    data = models.Booktype.objects.extra (select={'paths': 'concat(path,id)'}).order_by ('paths')
    for i in data:
        num = i.path.count (',') - 1
        i.cat = '|_____' * num
        if i.pid != 0:
            i.pname = models.Booktype.objects.get (id=i.pid).name
        else:
            i.pname = '顶级分类'
    return data

@permission_required('myadmin.show_Booktype',raise_exception=True)
def index(request):
    data = selecttype ()
    # 实例化分页对象,参数1,数据集,参数2 每页显示的条数
    p = Paginator (data,10)
    # 接收当前的页码数
    inx_p = request.GET.get ('page',1)
    # 获取当前页的数据
    userlist = p.get_page (inx_p)
    content = {'data': userlist}
    return render (request,'myadmin/types.html',content)

@permission_required('myadmin.create_Booktype',raise_exception=True)
def add(request):
    data = selecttype ()
    print(data)
    content = {"data": data}
    return render (request,'myadmin/typeadd.html',content)

@permission_required('myadmin.create_Booktype',raise_exception=True)
def insert(request):
    data = request.POST.dict ()
    data.pop ('csrfmiddlewaretoken')
    if data['pid'] != '0':
        path = models.Booktype.objects.get (id=data['pid'])
        data['path'] = path.path + str (path.id)+','
    else:
        data['path'] = '0,'
    obj = models.Booktype (**data)
    obj.save ()
    url = reverse ('myadmin_type')
    return HttpResponse (f'<script>alert("添加成功");location.href="{url}"</script>')

@permission_required('myadmin.remove_Booktype',raise_exception=True)
def dele(request):
    id = request.GET.get ('id')
    num = models.Booktype.objects.filter (pid=id).count ()
    if num:
        return JsonResponse ({"code": 1,"msg": "当前分类下有子类,不能删除"})
    else:
        obj = models.Booktype.objects.get (id=id)
        obj.delete ()
        return JsonResponse ({"code": 0,"msg": "删除成功"})

@permission_required('myadmin.show_Booktype',raise_exception=True)
def search(request):
    try:
        value = request.POST.get ('search')
        if value == '顶级分类':
            return index (request)
        else:
            pid = models.Booktype.objects.get (name=value).id
            data = models.Booktype.objects.filter (path__icontains=str (pid))
        for i in data:
            if i.pid != 0:
                i.pname = models.Booktype.objects.get (id=i.pid).name
            else:
                i.pname = '顶级分类'
        # 实例化分页对象,参数1,数据集,参数2 每页显示的条数
        p = Paginator (data,10)

        # 接收当前的页码数
        inx_p = request.GET.get ('page',1)

        # 获取当前页的数据
        userlist = p.get_page (inx_p)
        content = {"data": userlist}

        return render (request,'myadmin/types.html',content)
    except:
        url = reverse ('myadmin_type')
        return HttpResponse (f'<script>alert("没有该类别,请先添加");location.href="{url}"</script>')

@permission_required('myadmin.edit_Booktype',raise_exception=True)
def edit(request):
    try:
        id = request.GET.get ('id')
        name = request.GET.get ('name')
        obj = models.Booktype.objects.get (id=id)
        obj.name = name
        obj.save ()
        return JsonResponse ({'code': 0,'msg': "修改成功"})
    except:
        return JsonResponse ({'code': 1,'msg': "修改失败"})



