from multiprocessing import Pool
from threading import Thread
import requests,re,time
from fake_useragent import UserAgent
from lxml import html
import pymysql

ua=UserAgent()
headers={'User-Agent':ua.random}
proxy={
    'http':'119.147.137.79:8008',
    'https':'119.147.137.79:8008'
}
'''
浦东:https://sh.lianjia.com/ershoufang/pudong/pg2/
闵行:https://sh.lianjia.com/ershoufang/minhang/
'''
def pos_to(pos):
    if pos=='pudong':
        area_name='浦东'
        return area_name
    elif pos=='minhang':
        area_name='闵行'
        return area_name
    elif pos == 'baoshan':
        area_name = '宝山'
        return area_name
    elif pos == 'xuhui':
        area_name = '徐汇'
        return area_name
    elif pos == 'putuo':
        area_name = '普陀'
        return area_name
    elif pos == 'yangpu':
        area_name = '杨浦'
        return area_name
    elif pos == 'changning':
        area_name = '长宁'
        return area_name
    elif pos == 'songjiang':
        area_name = '松江'
        return area_name
    elif pos == 'jiading':
        area_name = '嘉定'
        return area_name
    elif pos == 'huangpu':
        area_name = '黄浦'
        return area_name
    elif pos == 'jingan':
        area_name = '静安'
        return area_name
    elif pos == 'hongkou':
        area_name = '虹口'
        return area_name
    elif pos == 'qingpu':
        area_name = '青浦'
        return area_name
    elif pos == 'fengxian':
        area_name = '奉贤'
        return area_name
    elif pos == 'jinshan':
        area_name = '金山'
        return area_name
def get_content(pos,g):
    # try:
    num=g
    while True:
        url=f'https://sh.lianjia.com/ershoufang/{pos}/pg{g}/'
        res=requests.get(url,headers=headers,proxies=proxy,timeout=20)
        res.encoding='utf-8'
        if res.status_code==200:
            rush_code(res,url,pos)
            time.sleep(5)
            print(f'{g}页爬取成功!')
            if g<num+20:
                g+=1
            else:
                break
        else:
            print(f'{g}页爬取失败')
    # except:
    #     print(f'无法爬取{url[-15:-1]}')

def rush_code(res,url,pos):
    print(f'开始爬取{url}')
    etree=html.etree
    content=etree.HTML(res.text)
    title=content.xpath('//*[@id="content"]/div[1]/ul/li/div[1]/div[1]/a/text()')
    area_na=pos_to(pos)
    area=[area_na]*len(title)
    price=content.xpath('//*[@id="content"]/div[1]/ul/li/div[1]/div[6]/div[2]/span/text()')
    totalprice=content.xpath('//*[@id="content"]/div[1]/ul/li/div[1]/div[6]/div[1]/span/text()')
    arr = list(zip(title, area, price, totalprice))
    # id title area price type1 type2
    py=pymysql.connect('127.0.0.1','root','123456','lianjia',charset='utf8')
    cursor=py.cursor()
    sql="insert into hand_home_copy1 values (null,%s,%s,%s,%s)"
# try:

    cursor.executemany(sql,arr)
    py.commit()
    py.close()
    print(f'{url}添加数据库成功!')
# except:
#     py.rollback()
#     print(f'{url[-15:-1]}添加数据库失败')
    print(f'结束爬取{url[-5:-2]}')
#11个线程
def work():
    p_list=[]
    for g in range(1,100,20):
        p=Thread(target=get_content,args=(pos,g,))
        p.start()
        time.sleep(1)
        p_list.append(p)
    [i.join() for i in p_list]


#7个进程
if __name__=="__main__":
    url_list = [
        'pudong', 'minhang', 'baoshan', 'xuhui', 'putuo', 'yangpu',
        'changning', 'songjiang', 'jiading', 'huangpu', 'jingan',
        'hongkou', 'qingpu', 'fengxian', 'jinshan'
    ]
    for pos in url_list:
        print(f'开始爬取{pos}')
        work()



