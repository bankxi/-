import numpy as np
from keras.models import Sequential
from keras.layers import Dense
from sklearn.model_selection import train_test_split
import os
os.environ['KERAS_BACKEND']='tensorflow'

dataset=np.loadtxt('telecom_data.csv',delimiter=',',encoding='utf-8')
x=dataset[:,:17]
y=dataset[:,17]
X_train,X_test,y_train,y_test=train_test_split(x,y,test_size=0.2,random_state=True)
model=Sequential()
model.add(Dense(17,input_dim=17,activation='relu'))
model.add(Dense(17,activation='softmax'))
model.add(Dense(1,activation='sigmoid'))
model.compile(loss='binary_crossentropy',optimizer='adam',metrics=['accuracy'])
model.fit(x,y,epochs=1000,validation_split=0.2,batch_size=20,validation_data=(X_test,y_test))
score=model.evaluate(x,y)
print('%s:%f%%'%(model.metrics_names[1],score[1]*100))
print('%s:%f'%(model.metrics_names[0],score[0]))
res=model.predict(x[0:10])
print(np.round(res).reshape(10,),'\n',y[0:10])
'''
accuracy:86.959612%
loss:0.309488
[0. 0. 1. 0. 1. 1. 0. 0. 1. 0.] 
 [0. 0. 1. 0. 1. 1. 0. 0. 1. 0.]
'''