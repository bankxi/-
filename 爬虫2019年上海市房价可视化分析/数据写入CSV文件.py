import pymysql
import pandas as pd
py=pymysql.connect('127.0.0.1','root','123456','lianjia',charset='utf8')
cursor=py.cursor()

sql='select * from new_home_copy1'
cursor.execute(sql)
data=cursor.fetchall()
fr1=pd.DataFrame(data)
print(fr1)
fr1.to_csv('new_house.csv',encoding='utf_8_sig')

sql2='select * from hand_home_copy1'
cursor.execute(sql2)
data2=cursor.fetchall()
fr2=pd.DataFrame(data2)
print(fr2)
fr2.to_csv('second_hand_house.csv',encoding='utf_8_sig')

py.close()