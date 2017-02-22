(ns tail-recursion
  (:gen-class))

(defn sum [n]
  (if (= n 0)
    0
    (+ n (sum (dec n)))))

(defn sum_tail_recursive [n]
  (loop [n n acc 0]
    (if (= n 0)
      acc
      (recur
        (dec n)
        (+ acc n)))))

(defn -main [& args]
  (println
    (map #(try
            (sum %)
            ;;(sum_tail_recursive %)
            (catch java.lang.StackOverflowError e
              (str "caught java.lang.StackOverflowError: " (.getMessage e))))
         (map #(read-string %)
              (into [] args)))))

