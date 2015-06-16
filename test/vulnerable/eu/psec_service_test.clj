(ns vulnerable.eu.psec-service-test
  (:require [clojure.test :refer :all]
            [puppetlabs.trapperkeeper.app :as app]
            [puppetlabs.trapperkeeper.testutils.bootstrap :refer [with-app-with-empty-config]]
            [vulnerable.eu.psec-service :as svc]))

(deftest hello-service-test
  (testing "says hello to caller"
    (with-app-with-empty-config app [svc/hello-service]
      (let [hello-service (app/get-service app :HelloService)]
        (is (= "Hello, foo!" (svc/hello hello-service "foo")))))))
