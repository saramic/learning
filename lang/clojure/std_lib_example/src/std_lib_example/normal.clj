(ns std-lib-example.normal)
(require '[clojure.java.io :as io])
(require '[clojure.xml :as xml])

(defn- to-double [k m]
  (update-in m [k] #(Double/valueOf %)))

(defn parse [xml]
  (let [xml-in (java.io.ByteArrayInputStream. (.getBytes xml))
        results (to-double
                   :currentBalance
                   (apply merge
                          (map #(hash-map (:tag %) (first (:content %)))
                               (:content (xml/parse xml-in)))))]
    (.close xml-in)
    results))

(defn clean-key [k]
  (let [kstr (str k)]
    (if (= \: (first kstr))
      (apply str (rest kstr))
      kstr)))

(defn- up-first [[head & others]]
  (apply str (conj others (.toUpperCase (str head)))))

(defn separate-words [k]
  (let [letters (map str k)]
    (up-first (reduce #(str %1 (if (= %2 (.toLowerCase %2)) %2 (str " " %2))) " " letters ))))

(defn format-decimals [v]
  (if (float? v)
    (let [[_ nat dec] (re-find #"(\d+)\.(\d+)" (str v))]
      (cond
        (= (count dec) 1) (str v "0")
        (> (count dec) 2) (apply str nat "." (take 2 dec))
        :default (str v)))
    v))

(defn print-balance [xml]
  (let [balance (parse xml)]
    (letfn [(transform [acc item]
              (assoc acc
                     (separate-words (clean-key item))
                     (format-decimals (item balance))))]
      (reduce transform {} (keys balance)))))

