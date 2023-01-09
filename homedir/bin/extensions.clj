#!/usr/bin/env bb

(->> (fs/list-dir (fs/cwd))
     (filter fs/regular-file?)
     (remove fs/hidden?)
     (map fs/extension)
     frequencies
     (map #(zipmap [:extension :count] %))
     (sort-by :count)
     reverse
     clojure.pprint/print-table)
