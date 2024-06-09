#!/usr/bin/env bb

(require '[babashka.process :refer [shell]]
         '[clojure.string :as str])

(defrecord Window
    [id width height])

(defn make-root []
  (let [[_ width height]
        (->> "xrandr"
             (shell {:out :string})
             :out
             str/split-lines
             first
             (re-find #"current (\d+) x (\d+)"))]
    (Window. 0 (Integer/parseInt width) (Integer/parseInt height))))

(defn search [name kind]
  (let [{:keys [exit out]}
        (->> (format "xdotool search --%s '%s'" kind name)
             (shell {:out :string :continue true}))]
    (when (zero? exit)
      (Integer/parseInt (str/trim out)))))

(defn search-class [name] (search name "class"))
(defn search-name  [name] (search name "name"))

(defn make-target []
  (when-let [target (or (search-name "picture-in-picture")
                        (search-class "mpv"))]
    (let [[_ width height]
          (->> (format "xdotool getwindowgeometry %d" target)
               (shell {:out :string})
               :out
               (re-find #"(\d+)x(\d+)"))]
      (Window. target (Integer/parseInt width) (Integer/parseInt height)))))

(defn move [{:keys [id]} x y]
  (shell (format "xdotool windowmove %d %d %d" id x y)))
