import numpy as np
from keras.models import Sequential #模型
from keras.layers import Dense,Activation
#构造分类数据
dataset=np.loadtxt('telecom_data.csv',delimiter=',',encoding='utf-8')
x=dataset[:,:17]
y=dataset[:,17]

# model=Sequential()
# model.add(Dense(units=1,input_dim=17))
# model.add(Activation('sigmoid')) #激活函数
model=Sequential()
model.add(Dense(17,input_dim=17,activation='relu'))
model.add(Dense(17,activation='softmax'))
model.add(Dense(1,activation='sigmoid'))
#配置模型
model.compile(loss='binary_crossentropy',optimizer='sgd',metrics=['accuracy'])

for step in range(1000):
    cost=model.train_on_batch(x,y)
print('测试ing----------------------')
score=model.evaluate(x,y,batch_size=100)
print('%s:%f%%'%(model.metrics_names[1],score[1]*100))
print('%s:%f'%(model.metrics_names[0],score[0]))

Y_pred=model.predict(x[0:5])
print(Y_pred,'\n',y[0:5])


