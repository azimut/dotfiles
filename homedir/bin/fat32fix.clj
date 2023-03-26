#!/usr/bin/env bb

;; https://en.wikipedia.org/wiki/Comparison_of_file_systems
;; https://stackoverflow.com/questions/4814040/allowed-characters-in-filename
;;
;; - No more than 255 chars per path
;; - and you can't have files/folders call . or ..
;; - and no control characters (of course).
;; - Any Unicode except NUL, \, /, :, *, ?, ", <, >, |.
;; - Also, no space character at the start or end, and no period at the end.

(require '[clojure.java.io :as io])
(require '[clojure.string :as str])
(require '[babashka.fs :as fs])

(def SPECIAL_CHARS #{\\, \:, \*, \?, \", \<, \>, \|})

(defn char-special? [c] (contains? SPECIAL_CHARS c))
(defn is-special?   [s] (some char-special? s))
(defn to-fat32      [s] (str/join (map #(if (char-special? %1) \_ %1) s)))

(defn char-unicode? [c] (or (< (int c) 32) (> (int c) 255)))
(defn is-unicode?   [s] (some char-unicode? s))
(defn to-ascii      [s] (str/join (map #(if (char-unicode? %1) \_ %1) s)))

(defn rename-file [filename]
  (let [new-filename (to-ascii (to-fat32 filename))]
    (print (format "renaming file:\n -> %s\n -> %s\n\n" filename new-filename))
    (fs/move filename new-filename)))

(doseq [filename
        (->> (io/file (.getCanonicalPath (io/file ".")))
             (file-seq)
             (filter #(not (.isHidden %)))
             (map #(.getAbsolutePath %))
             (filter #(or (is-unicode? %1) (is-special? %1))))]
  (rename-file filename))

(println "Done!")
