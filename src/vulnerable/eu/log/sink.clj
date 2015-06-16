(ns vulnerable.eu.log.sink
  (:require [clojure.tools.logging :as log]
            [puppetlabs.trapperkeeper.core :as tk]
            [aleph.tcp :as tcp]
            [manifold.stream :as stream]))

;;
;; Log server
;;
;; A sink for arbitrary log messages
;;

(def syslog-port 514)

(defn- log-handler [socket info]
  (log/debug "New client socket")
  (stream/connect socket socket))

(tk/defservice log-service
  []
  (init [this context]
    (log/info "Starting log server")
    (tcp/start-server log-handler {:port syslog-port})
        context)

  (stop [this context]
    (log/info "Stopping log server")
        context))
