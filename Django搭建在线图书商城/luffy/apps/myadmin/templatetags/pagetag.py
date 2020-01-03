from django import template
from django.utils.html import format_html

register = template.Library()

# 自定义过滤器
@register.filter
def kong_upper(val):
    # print ('val from template:',val)
    return val.upper()

# 自定义标签
@register.simple_tag
def jia(a,b):
    res = int(a) + int(b)
    return res

# 自定义标签
@register.simple_tag
def jia(a,b):
    res = int(a) + int(b)
    return res

@register.simple_tag
def cheng(a,b):
    res = a * b
    # return res
    return '%.2f'%res

# 自定义 分页优化 标签
@register.simple_tag
def showpage(num,request):
    '''
        num 总页数
        p   当前页
    '''
    # 获取当前页码数
    p = int(request.GET.get('page',1))

    # h获取当前页面的请求参数,get方式
    data = request.GET.dict()
    # &selecttype=phone&keywords=3017
    args = ''
    for k,v in data.items():
        if k != 'page':
            args += f'&{k}={v}'
    # print(args)


    start = p-5
    end = p+4

    # 判断 当前页如果小于5
    if p <= 5:
        start = 1
        end = 10

    # 判断 当前页如果 大于 总页数-5
    if p > num-4:
        start = num-9
        end = num

    # 总页数 小于等于10
    if num <= 10:
        start = 1
        end = num

    s = ''
    s += f'<li><a href="?page=1{args}">首页</a></li>'
    #判断上一页的page，不能超出范围
    if p-1 <= 1:
        s += f'<li class="am-disabled" ><a href="?page=1{args}">上一页</a></li>'
    else:
        s += f'<li><a href="?page={p-1}{args}">上一页</a></li>'


    for x in range(start,end+1):
        #进行判断，如果是当前页则加上高亮效果，如果不是则不加
        if x == p:
            s += f'<li class="am-active"><a href="?page={x}{args}">{x}</a></li>'
        else:
            s += f'<li ><a href="?page={x}{args}">{x}</a></li>'
    #判断下一页page不能超过页数
    if p+1 >= num:
        s += f'<li class="am-disabled"><a href="?page={num}{args}">下一页</a></li>'
    else:
        s += f'<li><a href="?page={p+1}{args}">下一页</a></li>'

    s += f'<li><a href="?page={num}{args}">尾页</a></li>'

    return format_html(s)
