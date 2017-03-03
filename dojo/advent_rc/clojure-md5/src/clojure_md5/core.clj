(ns clojure-md5.core
  (:gen-class))

(import
  'java.security.MessageDigest
  'java.math.BigInteger)

(defn md5 [s]
  (let [algorithm (MessageDigest/getInstance "MD5")
  raw (.digest algorithm (.getBytes s))]
  (format "%032x" (BigInteger. 1 raw))))

(defn is_00000? [md5-str]
  (= "00000" (clojure.string/join "" (take 5 md5-str))))

(defn md5_for_int [num]
  (md5 (clojure.string/join "" ["abbhdwsy" num])))

(defn char_5 [md5-str]
  (nth (char-array md5-str) 5))

(use '[clojure.string :only (join split)])

(defn do_md5 []
  (join
    (map char_5
         (take 8
               (filter is_00000?
                       (map md5_for_int
                            (range)))))))
        ;[1739529, 1910966, 1997199, 2854555, 2963716, 3237361, 4063427, 7777889]))))))

(defn -main [& args]
  (println (do_md5)))

