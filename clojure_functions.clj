(require '[clojure.repl :refer :all])

;1)
;(defn greet [] (prn "Hello"))
;(greet)

;2)
;(def greet (fn [] (prn "Hello")))
;(greet)
;(def greet #(prn "Hello"))
;(greet)

;3)
;(defn greeting
;  ([] (prn "Hello World"))
;   ([x] (prn (str "Hello" " " x)))
;   ([x, y] (prn (str x " " y)))
;  )
;(greeting)
;(greeting "World")
;(greeting "Hello" "World")

;4)
;(defn do-nothing [x] x)
;(do-nothing "")

;5)
;(defn always-thing [& x] 100)
;(prn (always-thing "Hello" "World" "Param" "Param2"))

;6)
;(defn make-thingy [x] 
;  (constantly x))
;(def make-thingy2 (make-thingy "Hello World"))
;(prn (make-thingy2 "any" "any1" "any2"))

;7)
;(defn triplicate [f] (f) (f) (f))
;(defn fnParam [] (prn "triplicate"))
;(triplicate fnParam)

;8)
;(defn opposite [f] 
;  (fn [& args] (apply f args)))
;(def opposite-closure (opposite not))
;(prn (opposite-closure false))

;9)
;(defn triplicate2 [f & args] (triplicate f))
;(triplicate2 #(prn "triplicate2"))

;10)
;(prn (Math/cos Math/PI))
;(defn math [x] (+ (Math/pow (Math/sin x) 2) (Math/pow (Math/cos x) 2)))
;(prn (math 10))

;11)
;(defn http-get [url]
;    (slurp url)
;  )
;(prn (http-get "https://clojure.org/"))

;12)
;(defn one-less-arg [f x]
;  (fn [& args] (apply f x args)))
;(def one-less-arg-closure (one-less-arg + 1))
;(prn (one-less-arg-closure 2))

;13)
;(defn two-fns [f g]
;  (fn [x] (f (g x))))




