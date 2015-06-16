(ns vulnerable.eu.psec-core-test
  (:require [clojure.test :refer :all]
            [vulnerable.eu.psec-core :refer :all]))

(deftest hello-test
  (testing "says hello to caller"
    (is (= "Hello, foo!" (hello "foo")))))
