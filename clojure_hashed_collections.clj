
;; Hashed Collections

;; Sets
;; Constructing
(def players #{"Bob", "Kelly", "Alice"})
(prn players)

;; Adding to a set
(prn (conj players "Joao"))

;; Removing from a set
(prn (disj players "Joao" "Kelly"))

;; Check if constains 
(prn (contains? players "Bob"))
(prn (contains? players "Joao"))

;; Sorted sets
(prn (conj (sorted-set) "Bob" "Alice"))

;; Into function
(def new-players (vector "Christian" "Kabuto"))
(prn (into players new-players))

;; Maps or Hash Maps in other languages

;; Creating literal map  
(def scores {"Fred" 1400 "Joao" 200 "Goku" 9000 :t 10})
(prn scores)
;; Adding new key and value
(prn (assoc scores "Vegeta" 8999))

;; Replacing key case exist
(prn (assoc scores "Joao" 300))

;; Removing key-values pair
(prn (dissoc scores "Joao"))

;; Retrieve in map by key
(prn (get scores "Joao"))

;; Retrieve using constants
(prn (scores :t))

;; Bad cases in map
;;(def bad-lookup-map nil)
;;(prn (bad-lookup-map :foo))

;; Get default value when the key is not found
(def one {:a "a"})
(prn (one :a))
(prn (one :b "b"))

;; Checking and find in map
(def checking-and-find {"example" "example"})
(prn (contains? checking-and-find "example"))
(prn (find checking-and-find "example"))

;; Get keys or values 
(def key-or-values {"test-key" "test-value"})
(prn (keys key-or-values))
(prn (vals key-or-values))

