from django.shortcuts import render,reverse
from django.http import  HttpResponse,JsonResponse
from .. import models
from django.contrib.auth.hashers import make_password, check_password
from django.contrib.auth.models import User,Permission,Group
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.decorators import permission_required

# Create your views here.
def index(request):
    return render(request,'myadmin/index.html')

#管理员查
@permission_required('auth.view_user',raise_exception=True)
def authuser_index(request):
    data=User.objects.all()
    context={'userdata':data}
    return render(request,'myadmin/authu_index.html',context)

#管理员add
@permission_required('auth.add_user',raise_exception=True)
def authuser_add(request):
    gs=Group.objects.all()
    context={'grouplist':gs}
    return render(request,'myadmin/authu_add.html',context)

#管理员insert
@permission_required('auth.add_user',raise_exception=True)
def authuser_insert(request):
    #接收数据
    data=request.POST.dict()
    data.pop('csrfmiddlewaretoken')
    gs = request.POST.getlist ('gs')
    if gs:
        data.pop('gs')
    if data['is_superuser']=='True':
        data['is_superuser'] = True
        ob = User.objects.create_superuser(**data)
    else:
        ob = User.objects.create_user (**data)
    
    #判断是否分配了组
    
    if gs:
        ob.groups.set(gs)
        ob.save()
    
    url=reverse('myadmin_authuser_index')
    return HttpResponse(f'<script>alert("创建管理员成功");location.href="{url}"</script>')
#管理员编辑
@permission_required('auth.change_user',raise_exception=True)
def authuser_edit(request,id):
    data=User.objects.get(id=id)
    grouplist=Group.objects.all()
    mygroup=data.groups.all()
    context={'data':data,'grouplist':grouplist,'mygroup':mygroup}
    return render(request,'myadmin/authu_edit.html',context)

@permission_required('auth.change_user',raise_exception=True)
def authuser_doedit(request):
    data=request.POST.dict()
    data.pop('csrfmiddlewaretoken')
    gs=request.POST.getlist('gs')
    #检测是否分配组
    if gs:
        data.pop ('gs')
    #查询User对象
    old_data=User.objects.filter(id=data['id'])
    #判断是否是超级管理员,更新数据
    if  data['is_superuser']=='true':
        data['is_superuser']=True
        old_data.change_superuser(**data)
    else:
        old_data.update(**data)
    #设置组关系
    obj = old_data[0]
    obj.groups.set(gs)
    obj.save()
    
    url=reverse('myadmin_authuser_index')
    return HttpResponse(f'<script>alert("编辑成功");location.href="{url}"</script>')

def authuser_dele(request):
    id=request.GET.get('id')
    obj=User.objects.get(id=id)
    if obj.is_superuser==1:
        return JsonResponse({'code':'1','msg':'超级管理员无法被删除'})
    else:
        obj.delete()
        return JsonResponse({'code':'0','msg':'删除成功'})
#组查
@permission_required('auth.view_group',raise_exception=True)
def authgroup_index(request):
    groupdata=Group.objects.all()
    context={'groupdata':groupdata}
    
    return render (request,'myadmin/group_index.html',context)

#组add
@permission_required('auth.add_group',raise_exception=True)
def authgroup_add(request):
    perms = Permission.objects.exclude (name__istartswith='Can')
    context = {'perms': perms}
    return render (request,'myadmin/group_add.html',context)

#组insert
@permission_required('auth.add_group',raise_exception=True)
def authgroup_insert(request):
    #获取组名和权限
    name=request.POST['name']
    print(name)
    obj = Group(name=request.POST['name'])
    obj.save()
    prms = request.POST.getlist ('prms',None)
    if prms:
        obj.permissions.set(prms)
        obj.save()

    url = reverse ('myadmin_authgroup_index')
    return HttpResponse (f'<script>alert("创建组成功");location.href="{url}"</script>')

#退出登录
def myexit(request):
    logout(request)
    #清除当前会话的session
    request.session.flush ()
    url=reverse('myadmin_login')
    return HttpResponse(f'<script>alert("退出成功");location.href="{url}";</script>')

#后台登录页面
def mylogin(request):
    return render(request,'myadmin/login.html')

#后台登录验证
# def mydologin(request):
#     try:
#         data=request.POST.dict()
#         data.pop('csrfmiddlewaretoken')
#         obj=models.Users.objects.filter(phone=data['phone'])
#
#         #检测验证码,手机号,密码
#         if request.session['verifycode'].lower()==data['code'].lower()  and check_password(data['password'],obj[0].password):
#             #完成登录操作,储存session信息
#             request.session['adminuser']={'id':obj[0].id,'name':obj[0].nikename,'phone':obj[0].phone}
#             url=reverse('myadmin_index')
#             return HttpResponse(f'<script>alert("登录成功");location.href="{url}";</script>')
#         else:
#             return HttpResponse('<script>alert("登录失败");history.back();</script>')
#     except:
#         return HttpResponse ('<script>alert("登录失败");history.back();</script>')

#权限验证登录
def mydologin(request):
    #检验验证码
    if request.session['verifycode'].upper()!=request.POST.get('code').upper():
        url=reverse('myadmin_login')
        return HttpResponse(f'<script>alert("验证码错误");location.href="{url}"</script>')
    # 检测用户和密码
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate (request,username=username,password=password)
    if user is not None:
        login (request,user)
        # 成功,把用户信息记录在session中
        request.session['adminuser'] = {'username': user.username,'uid': user.id}
        return HttpResponse ('<script>alert("欢迎登录");location.href="/myadmin/"</script>')
    url = reverse ('myadmin_login')
    return HttpResponse (f'<script>alert("账号或密码错误");location.href="{url}"</script>')


# 验证码
def verifycode(request):
    #引入绘图模块
    from PIL import Image, ImageDraw, ImageFont
    #引入随机函数模块
    import random
    #定义变量，用于画面的背景色、宽、高
    bgcolor = (random.randrange(20, 100), random.randrange(
        20, 100), 255)
    width = 100
    height = 25
    #创建画面对象
    im = Image.new('RGB', (width, height), bgcolor)
    #创建画笔对象
    draw = ImageDraw.Draw(im)
    #调用画笔的point()函数绘制噪点
    for i in range(0, 100):
        xy = (random.randrange(0, width), random.randrange(0, height))
        fill = (random.randrange(0, 255), 255, random.randrange(0, 255))
        draw.point(xy, fill=fill)
    #定义验证码的备选值
    str1 = 'ABCD123EFGHIJK456LMNOPQRS789TUVWXYZ0'
    # str1 = '123456789'
    #随机选取4个值作为验证码
    rand_str = ''
    for i in range(0, 4):
        rand_str += str1[random.randrange(0, len(str1))]
    #构造字体对象
    font = ImageFont.truetype('arial.ttf', 23)
    #构造字体颜色
    fontcolor = (random.randrange(100, 200), random.randrange(100, 200), random.randrange(100, 200))
    #绘制4个字
    draw.text((5, 2), rand_str[0], font=font, fill=fontcolor)
    draw.text((25, 2), rand_str[1], font=font, fill=fontcolor)
    draw.text((50, 2), rand_str[2], font=font, fill=fontcolor)
    draw.text((75, 2), rand_str[3], font=font, fill=fontcolor)
    #释放画笔
    del draw
    #存入session，用于做进一步验证
    request.session['verifycode'] = rand_str
    #内存文件操作
    import io
    buf = io.BytesIO()
    #将图片保存在内存中，文件类型为png
    im.save(buf, 'png')
    #将内存中的图片数据返回给客户端，MIME类型为图片png
    return HttpResponse(buf.getvalue(), 'image/png')