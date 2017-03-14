import numpy as np

def split_dataset(x_dataset, y_dataset, ratio):
    arr = np.arange(x_dataset.size)
    np.random.shuffle(arr)
    num_train = ratio * x_dataset.size
    x_train = x_dataset[arr[0:int(num_train)]]
    y_train = y_dataset[arr[0:int(num_train)]]
    x_test = x_dataset[arr[int(num_train):x_dataset.size]]
    y_test = y_dataset[arr[int(num_train):y_dataset.size]]
    return x_train, x_test, y_train, y_test
