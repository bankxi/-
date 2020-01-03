# Generated by Django 2.2.6 on 2019-10-29 16:10

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('myadmin', '0006_auto_20191029_1148'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='books',
            options={'permissions': {('edit_Books', '修改图书信息权限'), ('create_Books', '添加图书信息权限'), ('show_Books', '查看图书列表权限'), ('remove_Books', '删除图书信息权限')}},
        ),
        migrations.AlterModelOptions(
            name='booktype',
            options={'permissions': {('create_Booktype', '添加图书类别信息权限'), ('show_Booktype', '查看图书类别列表权限'), ('edit_Booktype', '修改图书类别信息权限'), ('remove_Booktype', '删除图书类别信息权限')}},
        ),
        migrations.AlterModelOptions(
            name='order',
            options={'permissions': {('edit_Order', '修改订单信息权限'), ('remove_Order', '删除订单信息权限'), ('create_Order', '添加订单信息权限'), ('show_Order', '查看订单列表权限')}},
        ),
        migrations.AlterModelOptions(
            name='users',
            options={'permissions': {('show_Users', '查看用户列表权限'), ('edit_Users', '修改用户信息权限'), ('create_Users', '添加用户信息权限'), ('remove_Users', '删除用户信息权限')}},
        ),
    ]
