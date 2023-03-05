#!/usr/bin/env bb

(require '[clojure.string :as str])

(defn hidden-file? [s] (str/starts-with? s "."))
(defn has-extension? [s] (last (str/split s #"\.")))

(defn get-extension [filename]
  (cond
    (hidden-file? filename) "HIDDEN"
    (has-extension? filename) (last (str/split filename #"\."))
    :else "NOEXT"))

(->> (clojure.java.io/file ".")
     (file-seq)
     (filter #(.isFile %))
     (map #(.getName %))
     (map str/lower-case)
     (map get-extension)
     frequencies
     (map #(zipmap [:extension :count] %))
     (sort-by :count)
     reverse
     clojure.pprint/print-table)
