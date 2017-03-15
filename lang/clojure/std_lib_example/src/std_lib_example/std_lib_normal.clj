(ns std-lib-example.std-lib-normal)

(require '[clojure.java.io :as io])
(require '[clojure.xml :as xml])

(defn- to-double [k m]
  (update-in m [k] #(Double/valueOf %)))

(defn parse [xml]
  (let [xml-in (java.io.ByteArrayInputStream. (.getBytes xml))]
        (->> (xml/parse xml-in)
             :content
             (map #(hash-map (:tag %) (first (:content %))))
             (apply merge)
             (to-double :currentBalance))))

(defn separate-words [s]
  (-> (str (.toUpperCase (subs s 0 1)) (subs s 1))
      (clojure.string/replace #"([A-Z][a-z]*)" "$1 ")
      clojure.string/trim))

(defn format-decimals [v]
  (if (float? v)
    (clojure.pprint/cl-format nil "~$" v)
    v))

(defn print-balance [xml]
  (let [balance (parse xml)
        ks (map (comp separate-words name) (keys balance))
        vs (map format-decimals (vals balance))]
    (zipmap ks vs)))

