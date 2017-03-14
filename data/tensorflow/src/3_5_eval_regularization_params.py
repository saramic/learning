import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt
from util import split_dataset

learning_rate = 0.001
training_epochs = 1000
reg_lambda = 0.

x_dataset = np.linspace(-1, 1, 100)

# create fake dataset
num_coeffs = 9
y_dataset_params = [0.] * num_coeffs
y_dataset_params[2] = 1
y_dataset = 0

for i in range(num_coeffs):
    y_dataset += y_dataset_params[i] * np.power(x_dataset, i)
y_dataset += np.random.randn(*x_dataset.shape) * 0.3

(x_train, x_test, y_train, y_test) = split_dataset(x_dataset, y_dataset, 0.7)

X = tf.placeholder("float")
Y = tf.placeholder("float")

def model(X, w):
    terms = []
    for i in range(num_coeffs):
        term = tf.mul(w[i], tf.pow(X, i))
        terms.append(term)
    return tf.add_n(terms)

w = tf.Variable([0.] * num_coeffs, name="parameters")
y_model = model(X, w)
cost = tf.div(tf.add(tf.reduce_sum(tf.square(Y-y_model)),
    tf.mul(reg_lambda, tf.reduce_sum(tf.square(w)))),
    2*x_train.size)
train_op = tf.train.GradientDescentOptimizer(learning_rate).minimize(cost)

sess = tf.Session()
init = tf.initialize_all_variables()
sess.run(init)

plt.scatter(x_train, y_train)
plt.scatter(x_test, y_test)
plt.ion() # allow interactive plotting
x_train_sorted = list(x_train)
x_train_sorted.sort()
hl, = plt.plot(x_train_sorted, [0] * len(x_train_sorted), 'r')

for reg_lambda in np.linspace(0,1,100):
    for epoch in range(training_epochs):
        sess.run(train_op, feed_dict={X: x_train, Y: y_train})
    final_cost = sess.run(cost, feed_dict={X: x_test, Y: y_test})
    print('reg lambda', reg_lambda)
    print('final cost', final_cost)

    # now plot
    w_val = sess.run(w)
    trY = 0
    for i in range(num_coeffs):
        trY += w_val[i] * np.power(x_train_sorted, i)
    hl.set_ydata(trY)
    #plt.plot(x_train_sorted, trY, 'r')
    plt.draw()
    plt.pause(0.05)

sess.close()

plt.pause(2) # keep around for 2 seconds TODO how to keep open for ever?

