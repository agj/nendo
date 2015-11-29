#lang racket
(require "../../src/ale/intl/ja/main.rkt")

;; Contribution by Tetsuji Satou.


(totteoku boku-no-en (en-nuri 2))

(totteoku (boku-no-en2 kakudo)
  (totteoku kono-en (chuushin-chousei-kakudo kakudo 200
                      (chuushin-chousei-kakudo (* 12 kakudo) 60 boku-no-en)))
  (moshi (> kakudo 0)
         (kasane kono-en (boku-no-en2 (- kakudo 0.2)))
         kono-en))


(boku-no-en2 360)
