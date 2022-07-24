import h5py
import matplotlib.pyplot as plt
import numpy as np
from sklearn.linear_model import LogisticRegression

test_f = h5py.File('test_catvnoncat.h5', 'r')
train_f = h5py.File('train_catvnoncat.h5','r')

for key in test_f.keys():
    Xtrain = train_f['train_set_x'][()]
    Ytrain = train_f['train_set_y'][()]
    Xtrain = Xtrain/255.0
    Ytrain = Ytrain/255.0

print(Xtrain.shape)

clf = LogisticRegression(random_state=0).fit(Xtrain, Ytrain.flatten())

x0 = min(Xtrain)-10
x1 = max(Xtrain)+10
xx = np.linspace(x0, x1, 100)
ypred = clf.predict(xx)
ypred_proba = clf.predict_proba(xx)

print('Acurácia =',clf.score(Xtrain, Ytrain.flatten()))

plt.scatter(Xtrain, Ytrain,c='red')
plt.plot(xx,ypred,'-b')
plt.plot(xx,ypred_proba,'-.k')
plt.xlabel('Atributo')
plt.ylabel('Classe') 

