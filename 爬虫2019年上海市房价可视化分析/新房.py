from multiprocessing import Pool
from threading import Thread
import requests,re,time
from fake_useragent import UserAgent
from lxml import html
import pymysql
# https://sh.fang.lianjia.com/loupan/jingan-xuhui-huangpu-changning-putuo-pudong-baoshan-hongkou-yangpu-minhang-jiading-songjiang-qingpu-fengxian-jinshan-chongming/pg1/#chongming
# https://sh.fang.lianjia.com/loupan/jingan-xuhui-huangpu-changning-putuo-pudong-baoshan-hongkou-yangpu-minhang-jiading-songjiang-qingpu-fengxian-jinshan-chongming/pg2/#chongming
# https://sh.fang.lianjia.com/loupan/jingan-xuhui-huangpu-changning-putuo-pudong-baoshan-hongkou-yangpu-minhang-jiading-songjiang-qingpu-fengxian-jinshan-chongming/pg77/#chongming
source_url=[f'https://sh.fang.lianjia.com/loupan/jingan-xuhui-huangpu-changning-putuo-pudong-baoshan-hongkou-yangpu-minhang-jiading-songjiang-qingpu-fengxian-jinshan-chongming/pg{i}/#chongming' for i in range(1,78)]
url1='https://sh.fang.lianjia.com/loupan/jingan-xuhui-huangpu-changning-putuo-pudong-baoshan-hongkou-yangpu-minhang-jiading-songjiang-qingpu-fengxian-jinshan-chongming/pg1/#chongming'

ua=UserAgent()
headers={'User-Agent':ua.random}
proxy={
    'http':'119.147.137.79:8008',
    'https':'119.147.137.79:8008'
}

def get_content(g):
    # try:
    num=g
    while True:
        url=f'https://sh.fang.lianjia.com/loupan/jingan-xuhui-huangpu-changning-putuo-pudong-baoshan-hongkou-yangpu-minhang-jiading-songjiang-qingpu-fengxian-jinshan-chongming/pg{g}/#chongming'
        res=requests.get(url,headers=headers,proxies=proxy,timeout=20)
        res.encoding='utf-8'
        if res.status_code==200:
            rush_code(res,url)
            time.sleep(5)
            print(f'{g}页爬取成功!')
            if g<num+11:
                g+=1
            else:
                break
        else:
            print(f'{g}页爬取失败')
    # except:
    #     print(f'无法爬取{url[-15:-1]}')

def rush_code(res,url):
    print(f'开始爬取{url[-15:-1]}')
    etree=html.etree
    content=etree.HTML(res.text)
    title=content.xpath('/html/body/div[4]/ul[2]/li/div/div[1]/a/text()')
    area=content.xpath('/html/body/div[4]/ul[2]/li/div/div[2]/span[1]/text()')
    price=content.xpath('/html/body/div[4]/ul[2]/li/div/div[6]/div/span[1]/text()')
    type1=content.xpath('/html/body/div[4]/ul[2]/li/div/div[1]/span[1]/text()')
    type2=content.xpath('/html/body/div[4]/ul[2]/li/div/div[1]/span[2]/text()')
    arr = list(zip(title, area, price, type1, type2))
    # id title area price type1 type2
    py=pymysql.connect('127.0.0.1','root','123456','lianjia',charset='utf8')
    cursor=py.cursor()
    sql="insert into new_home_copy1 values (null,%s,%s,%s,%s,%s)"
# try:
    cursor.executemany(sql,arr)
    py.commit()
    py.close()
    print(f'{url[-15:-1]}添加数据库成功!')
# except:
#     py.rollback()
#     print(f'{url[-15:-1]}添加数据库失败')
    print(f'结束爬取{url[-15:-1]}')
#11个线程
def work():
    p_list=[]
    for g in range(1,78,11):
        p=Thread(target=get_content,args=(g,))
        p.start()
        time.sleep(1)
        p_list.append(p)
    [i.join() for i in p_list]

#7个进程
if __name__=="__main__":
    # time1=time.time()
    work()
    # time2 = time.time()
    # print(time2 - time1)
    # pool=Pool(7)
    #     # for i in range(0,len(url)+1,11):
    #     #     pool.apply_async(func=work,args=(url[i:i+11],))
    #     # pool.close()
    #     # pool.join()
    # get_content(url1)


