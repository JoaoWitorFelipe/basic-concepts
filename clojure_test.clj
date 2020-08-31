;; Simple tests

(ns clojure.test (:use [clojure.test]))

(deftest test-sum
  (is (= 4 (+ 2 2))))

(deftest throwArithmeticException
  (is 
    (thrown? ArithmeticException (/ 1 0))))

(deftest throwArithmeticExceptionWithMessage
  (is 
    (thrown-with-msg? ArithmeticException #"Divide by zero" 
                          (/ 1 0))))

(with-test 
  (defn test-sum-2 [x y] (+ x y))
  (is (= 4 (test-sum-2 2 2)))
  (is (= 10 (test-sum-2 8 2))))


(run-tests 'clojure.test)


