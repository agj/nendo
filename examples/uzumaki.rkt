#lang racket
(require "../src/ale/intl/ja/main.rkt")


(totteoku (uzumaki nagasa)
  (moshi (> nagasa 0)
    (draw-turtle
     (susumu 10)
     (migi (* 0.5 nagasa))
     (uzumaki (- nagasa 1)))))

(uzumaki 1000)
