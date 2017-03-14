import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

learning_rate = 0.01
training_epochs = 40

trX = np.linspace(-1, 1, 101)

num_coeffs = 6
trY_coeffs = [1, 2, 3, 4, 5, 6]
trY = 0
for i in range(num_coeffs):
    trY += trY_coeffs[i] * np.power(trX, i)

trY += np.random.randn(*trX.shape) * 1.5

plt.scatter(trX, trY)
#plt.show() # no need to show graph first off

X = tf.placeholder("float")
Y = tf.placeholder("float")

linear = False # to run the simple linear fit, or use 2 for fit_coeffs below
fit_coeffs = 6 # can change this to change the number of coefficients to fit
# 2 is equivalent of linear
# 6 is what the input is
if linear:
    def model(X, w):
        return tf.mul(X, w)
    w = tf.Variable(0.0, name="weights")
else:
    def model(X, w):
        terms = []
        for i in range(fit_coeffs):
            term = tf.mul(w[i], tf.pow(X, i))
            terms.append(term)
        return tf.add_n(terms)
    w = tf.Variable([0.] * fit_coeffs, name="parameters")

y_model = model(X, w)

if linear:
    cost = tf.square(Y-y_model)
else:
    cost = (tf.pow(Y-y_model, 2))

train_op = tf.train.GradientDescentOptimizer(learning_rate).minimize(cost)

sess = tf.Session()
init = tf.initialize_all_variables()
sess.run(init)

for epoch in range(training_epochs):
    for (x, y) in zip(trX, trY):
        sess.run(train_op, feed_dict={X: x, Y: y})

w_val = sess.run(w)
print(w_val)

sess.close()

plt.scatter(trX, trY)
trY2 = 0
if linear:
    trY2 = trX*w_val
else:
    for i in range(fit_coeffs):
        trY2 += w_val[i] * np.power(trX, i)

plt.plot(trX, trY2, 'r')
plt.show()
