from django.shortcuts import render,reverse
from django.http import HttpResponse,JsonResponse
from django.contrib.auth.hashers import make_password,check_password
import random,time,os
from .. import models
from django.core.paginator import Paginator
from django.contrib.auth.decorators import permission_required

# Create your views here.
@permission_required('myadmin.show_Users',raise_exception=True)
def index(request):
    data = models.Users.objects.all ()
    value = request.GET.get ('search')
    if value:
        data = models.Users.objects.filter (nikename__icontains=value)
    # 实例化分页对象,参数1,数据集,参数2 每页显示的条数
    p = Paginator (data,10)

    # 接收当前的页码数
    inx_p = request.GET.get ('page',1)

    # 获取当前页的数据
    userlist = p.get_page (inx_p)

    content = {'data': userlist}
    return render (request,'myadmin/user.html',content)

@permission_required('myadmin.create_Users',raise_exception=True)
def add(request):
    return render (request,'myadmin/useradd.html')

@permission_required('myadmin.create_Users',raise_exception=True)
def insert(request):
    try:
        # 接受表单数据
        data = request.POST.dict ()
        data.pop ('csrfmiddlewaretoken')
        # 密码加密
        data['password'] = make_password (data['password'],None,'pbkdf2_sha256')
        # 检察是否上传头像
        file = request.FILES.get ('face',None)
        filename = imgload (file)
        if filename:
            data['face'] = filename
        else:
            data.pop ('face')
        # print(data)
        # 数据添加
        obj = models.Users (**data)
        obj.save ()
        url = reverse ('myadmin_users')
        return HttpResponse (f'<script>alert("添加成功");location.href="{url}"</script>')
    except:
        url = reverse ('myadmin_useradd')
        return HttpResponse (f'<script>alert("添加失败");location.href="{url}"</script>')


# django删除用户,需要将超链接改成a href="{% url 'myadmin_userdele i.id %}
# def dele(request,id):
#     obj=models.Users.objects.get(id=id)
#     if 'upload' in obj.face:
#         os.remove('.'+obj.face)
#     obj.delete()
#     url=reverse('myadmin_users')
#     return HttpResponse(f'<script>alert("删除成功");location.href="{url}"</script>')
# ajax删除用户,无需在参数中接受id
@permission_required('myadmin.remove_Users',raise_exception=True)
def dele(request):
    id = request.GET.get ('id')
    obj = models.Users.objects.get (id=id)
    try:
        if 'upload' in obj.face:
            os.remove ('.' + obj.face)
        obj.delete ()
        return JsonResponse ({'code': 0,'msg': '删除成功'})
    except:
        obj.delete ()
        return JsonResponse ({'code': 0,'msg': '删除成功'})


# django更改用户
@permission_required('myadmin.edit_Users',raise_exception=True)
def edit(request,id):
    data = models.Users.objects.get (id=id)
    content = {'data': data}
    return render (request,'myadmin/useredit.html',content)

@permission_required('myadmin.edit_Users',raise_exception=True)
def edituser(request):
    data = request.POST.dict ()

    data.pop ('csrfmiddlewaretoken')

    if data['password'] != data['old_password']:
        data['password'] = make_password (data['password'],None,'pbkdf2_sha256')
    data.pop ('old_password')
    file = request.FILES.get ('face')

    if file:
        os.remove ('.' + data['old_face'])
        filename = imgload (file)
        data['face'] = filename

    else:
        data['face'] = data['old_face']

    data.pop ('old_face')

    models.Users.objects.filter (id=data['id']).update (**data)

    url = reverse ('myadmin_users')
    return HttpResponse (f'<script>alert("修改成功");location.href="{url}"</script>')


# 搜索用户名
# def search(request):
#     value = request.POST.get ('search')
#     if value:
#         data = models.Users.objects.filter (nikename__icontains=value)
#         # 实例化分页对象,参数1,数据集,参数2 每页显示的条数
#         p = Paginator (data,10)
#
#         # 接收当前的页码数
#         inx_p = request.GET.get ('page',1)
#
#         # 获取当前页的数据
#         data = p.get_page (inx_p)
#     else:
#         data= models.Users.objects.all ()
#
#     # 分配数据
#     content = {'data': data }
#
#     return render (request,'myadmin/user.html',content)


# 封装上传头像
def imgload(file):
    try:
        filename = str (random.randint (10000,99999) + time.time ()) + file.name.split ('.').pop ()
        with open (f'./static/uploads/{filename}','wb+') as fp:
            fp.write (file.read ())

        return f'/static/uploads/{filename}'
    except:
        return False
