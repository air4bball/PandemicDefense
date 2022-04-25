import csv
import matplotlib.pyplot as plt 
import pandas as pd 
import seaborn as sns
import numpy as np 
from pandas import read_csv

from sklearn.preprocessing import PolynomialFeatures
from sklearn.metrics import r2_score
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_absolute_error, mean_squared_error


f = open('/Users/SrikarP 1/PandemicDefense/2022countryICUData.csv', 'w')
writer = csv.writer(f)

with open('covid-hospitalizations.csv', 'r') as csvfile: 
    datareader = csv.reader(csvfile, delimiter = ',')
    time = 0
    for row in datareader:
        if row[4] == "value":
            writer.writerow(row)
        if row[3] == "Daily ICU occupancy per million":
            if "2022" in row[2]:
                row[2] = time
                writer.writerow(row)
                time = time + 1
            else :
                time = 0
f.close()
data = pd.read_csv('2022countryICUData.csv')

countriesdf = data['entity'].unique()

rawIndices = []
def model(df):
    #X is time
    X = df['date'].array
    #y is value
    y = df['value'].array

    #Linear Regression

    # X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.25, train_size = 0.75, random_state = 101)
    # X_train= X_train.reshape(-1, 1)
    # y_train= y_train.reshape(-1, 1)
    # X_test = X_test.reshape(-1, 1)
    # y_test = y_test.reshape(-1, 1)

    # #create Linear Regression model
    # lr = LinearRegression()
    # #train model
    # lr.fit(X_train, y_train) #creating best fit line
    # #test model
    # pred = lr.predict(X_test) #gives out what the best fit line predicts y_test should be

    # plt.scatter(X_test, y_test)
    # plt.plot(X_test, pred)
    # plt.xticks(())
    # plt.yticks(())
    # plt.show()

    #evaluating if predictions were accurate (error closer to 0 is accurate)
    # print('prediction: ', pred)
    # print('Mean Absolute error:', mean_absolute_error(y_test, pred))
    # print('Mean Squared error:', mean_squared_error(y_test, pred))
    # print('Mean Root Squared error:', np.sqrt(mean_squared_error(y_test, pred)))


    poly = np.poly1d(np.polyfit(X, y, 3))
    line = np.linspace(0, df.shape[0], 10)
    #plt.scatter(X, y)
    #plt.plot(line, poly(line))
    #plt.show()

    #print("r^2: ", r2_score(y, poly(X)))
    pred = poly(120)

    rawIndices.append(pred)

for country in countriesdf:
    countrydf = data[data['entity'] == country]
    model(countrydf)

min = -24.737765403902586
max = 40.16100795669615
rawRange = max - min

indices = []
for i in range(0, len(rawIndices)):
    if rawIndices[i] <= -24.737765403902586:
        indices.append(0)
    elif rawIndices[i] >= 40.16100795669615:
        indices.append(10)
    else: 
        indices.append(((rawIndices[i] - min) / rawRange) * 10)

for i in range(0, len(indices)):
    print(countriesdf[i] + " " + str(indices[i]))

