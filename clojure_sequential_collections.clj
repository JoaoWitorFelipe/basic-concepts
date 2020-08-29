;; Vectors

;; Retrived by index
(defn get-value-by-index [index] (get ["abc" false 99], index))
(prn (get-value-by-index 0)) ;; abc 
(prn (get-value-by-index 1)) ;; false
(prn (get-value-by-index 2)) ;; 99
(prn (get-value-by-index 3)) ;; nil 

;; Count vector
;; I can create a vector with function "vector" or literal syntax "[]"
(defn count-vector [vect] (prn (count vect)))
(count-vector (vector 1 2 3)) ;; 3
(count-vector (vector 1 2)) ;; 2
(count-vector [1]) ;; 1

;; Adding elements in vector 
(defn conjoin-elements-in-vector [vect & args] (prn (apply conj vect args)))
(conjoin-elements-in-vector [1 2 3] 4 5 6)

;; Lists

;; Constructing 

(def cards '(10 :ace :jack 9))
(prn (first cards))
(prn (rest cards))
;; Okay, in vectors the function "conj" to places items in the last positions
;; And in lists is at the beginning 
(prn (conj cards :queen))

;; Stack access

(def stack '(:a :b :c))
(prn stack)
(prn (peek stack))
(prn (pop stack))

