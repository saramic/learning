(ns std-lib-example.core)

(def balance
  "<balance>
    <accountId>3764882</accountId>
    <lastAccess>20120121</lastAccess>
    <currentBalance>80.12389</currentBalance>
  </balance>")

(require '[std-lib-example.normal :as normal])
(require '[std-lib-example.std-lib-normal :as std-lib-normal])

(defn -main [& args]
  (println balance)
  (println (normal/print-balance balance))
  (println (std-lib-normal/print-balance balance)))

