#!/usr/bin/env bb

(require '[clojure.string :as str])
(require '[babashka.fs :as fs])
(require '[babashka.process :refer [shell]])

(def QLDIR
  (format "%s/quicklisp/dists/quicklisp/software"
          (fs/home)))

(defn duh []
  (->> (shell {:out :string} "du -sh" QLDIR) :out str/split-lines last println))

(defn get-package-name [dirname]
  (last
   (re-find #"^([0-9a-zA-Z-.]+)[0-9]{8}-git?$"
            dirname)))

(duh)

(doseq [package (->> (fs/list-dir QLDIR)
                     (filter fs/directory?)
                     (map fs/file-name)
                     (filter get-package-name)
                     sort
                     (group-by get-package-name)
                     (filter #(> (count (second %)) 1))
                     (map (fn [[_ val]] (butlast val)))
                     flatten
                     sort)]

  (->> (format "%s/%s" QLDIR package)
       (shell {:out :string} "rm -vrf")
       :out
       str/split-lines
       last
       print))

(duh)
