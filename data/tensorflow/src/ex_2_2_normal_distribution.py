import tensorflow as tf

mean = 1.0
sigma = 0.0

# TODO need to import pi
# TODO need to print this out over a range of x
(tf.exp(tf.neg(tf.pow(x - mean, 2.0) /
    (2.0 * tf.pow(sigma, 2.0) ))) *
    (1.0 / (sigma * tf.sqrt(2.0 * pi) )))

