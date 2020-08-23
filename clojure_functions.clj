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



