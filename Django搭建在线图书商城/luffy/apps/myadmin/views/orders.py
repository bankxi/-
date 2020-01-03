from django.shortcuts import render
from django.http import  HttpResponse
from .. import models
# Create your views here.
def index(request):
    data=models.Order.objects.all()
    content={'data':data}
    return render(request,'myadmin/orders.html',content)

def search(request):
    phone=request.POST.get('search')
    try:
        data=models.Order.objects.filter(phone__startswith=phone)
        content={'data':data}
        return render (request,'myadmin/orders.html',content)
    except:
        return HttpResponse('<script>alert("未查询到该订单");history.back();</script>')