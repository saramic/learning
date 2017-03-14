import tensorflow as tf
sess = tf.InteractiveSession()

x = tf.constant([[1., 2.]])
neg_x = tf.neg(x)

print(neg_x)

result = neg_x.eval()
print(result)

sess.clse()
