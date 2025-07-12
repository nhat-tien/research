import numpy as np

class LogisticRegression:

    def __init__(self):
        self.w = []
        self.cost_list = []


    def sigmoid(self, x):
        x = np.clip(x, -10, 10)
        return 1/(1 + np.exp(-x))

    def cost(self, y_truth, y_proba):
        loss = - y_truth*np.log(y_proba) - (1- y_truth)*np.log(1 - y_proba)
        return loss

    def gradient_compute(self, X, y, y_proba):
        '''
        X: Input Feature Array of NxD shape
        y: ground truth output of N shape
        y_proba: probability of N shape
        '''
        assert y.ndim == 1, "y should be one dimensional"
        return np.dot((y_proba - y), X)

    def probability(self,w, X):
        y_proba = np.array([])
        for i in range(len(X)):
            proba = self.sigmoid(np.dot(w, X[i]))
            y_proba = np.append(y_proba, proba)
        return y_proba

    def prediction(self, x_test):
        y_pred = np.array([], dtype=np.int16)

        y_proba = self.probability(self.w, x_test)

        for i in range(len(y_proba)):
            if y_proba[i] > 0.5:
                pred = 1
            else:
                pred = 0
            y_pred =np.append(y_pred, pred)

        return y_pred

    def fit(self, X, y, epochs=10, learning_rate=0.01):
        N = X.shape[0] # number of training samples
        print(N)
        self.w = np.ones((1, X.shape[1])) # initialize the weights
        # old_cost = 100
        for _ in range(epochs):
            y_proba = self.probability(self.w, X)
            self.w = self.w - learning_rate* self.gradient_compute(X, y, y_proba) # update the weights after one epoch

            loss = 0
            total_cost = 0
            for i in range(N):
                loss += self.cost(y[i], y_proba[i])
            total_cost = loss / N
            self.cost_list.append(total_cost)


