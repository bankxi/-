from django.contrib import admin
from django.urls import path,include,re_path
# from .views import index,users,types,books,orders
from .views import *


urlpatterns = [
    #权限管理
    #管理员管理
    path('auth/user/index', index.authuser_index,name='myadmin_authuser_index'),
    path('auth/user/add', index.authuser_add,name='myadmin_authuser_add'),
    path('auth/user/insert', index.authuser_insert,name='myadmin_authuser_insert'),
    path('auth/user/edit/<int:id>', index.authuser_edit,name='myadmin_authuser_edit'),
    path('auth/user/doedit', index.authuser_doedit,name='myadmin_authuser_doedit'),
    path('auth/user/dele', index.authuser_dele,name='myadmin_authuser_dele'),
    # 组管理
    path ('auth/group/index',index.authgroup_index,name='myadmin_authgroup_index'),
    path ('auth/group/add',index.authgroup_add,name='myadmin_authgroup_add'),
    path ('auth/group/insert',index.authgroup_insert,name='myadmin_authgroup_insert'),
    
    #会员管理
    path('', index.index,name='myadmin_index'),
    path('login/', index.mylogin,name='myadmin_login'),
    path('dologin/', index.mydologin,name='myadmin_dologin'),
    path('yzm/', index.verifycode,name='myadmin_yzm'),
    path('myexit/', index.myexit,name='myadmin_exit'),

    path('user/', users.index,name='myadmin_users'),
    path('user/add/', users.add,name='myadmin_useradd'),
    path('user/insert/', users.insert,name='myadmin_userinsert'),
    # path('user/dele/<int:id>/', users.dele,name='myadmin_userdele'),#django
    path('user/dele/', users.dele,name='myadmin_userdele'), #ajax
    path('user/edit/<int:id>', users.edit,name='myadmin_useredit'),
    path('user/edituser/', users.edituser,name='myadmin_useredituser'),
    # path('user/so/', users.search,name='myadmin_souser'),

    #图书室类型管理
    path('type/', types.index,name='myadmin_type'),
    path('type/add', types.add,name='myadmin_typeadd'),
    path('type/insert', types.insert,name='myadmin_typeinsert'),
    path('type/dele', types.dele,name='myadmin_typedele'),
    path('type/search', types.search,name='myadmin_sotype'),
    path('type/edit', types.edit,name='myadmin_typeedit'),



    path('books/', books.index,name='myadmin_books'),
    path('books/add/', books.add,name='myadmin_booksadd'),
    path('books/insert/', books.insert,name='myadmin_booksinsert'),
    path('books/dele/', books.dele,name='myadmin_bookdele'),
    path('books/edit<int:id>/', books.edit,name='myadmin_bookedit'),
    path('books/editbook/', books.bookedit,name='myadmin_bookeditbook'),
    # path('books/editbookpic/', books.bookeditpic,name='myadmin_bookeditpic'),

    path('books/editimg/', books.editimg,name='myadmin_bookeditimg'),
    path('books/editimgdel/', books.editimgdel,name='myadmin_editimgdel'),



    path('orders/', orders.index,name='myadmin_orders'),
    path('orders/search', orders.search,name='myadmin_orderssearch'),

]
