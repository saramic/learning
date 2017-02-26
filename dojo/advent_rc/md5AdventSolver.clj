(ns md5-advent
  (:gen-class))

(import 'java.security.MessageDigest
  'java.math.BigInteger)

(defn md5 [s]
  (let [algorithm (MessageDigest/getInstance "MD5")
  raw (.digest algorithm (.getBytes s))]
  (format "%032x" (BigInteger. 1 raw))))

(filter
	(fn [md5Str] (= "00000" (clojure.string/join "" (take 5 md5Str))))
	(map
		(fn [num] (md5 (clojure.string/join "" ["abbhdwsy" num])))
		(range 2000000)))
		;[1739529, 1910966, 1997199, 2854555, 2963716, 3237361, 4063427, 7777889]))

(defn -main [& args]
  (println "filter"))

