#lang racket
(require "../../src/ale/intl/ja/main.rkt")


(totteoku boku-no-en (en-nuri 40))

(kasane (chuushin-chousei-ue 20 (irozuke "ao" boku-no-en))
        (chuushin-chousei-migi 20 (irozuke "aka" boku-no-en))
        (chuushin-chousei-shita 20 (irozuke "pink" boku-no-en))
        (chuushin-chousei-hidari 20 (irozuke "orange" boku-no-en)))


(totteoku (boku-no-en2 kakudo)
  (totteoku kono-en
    (chuushin-chousei-kakudo kakudo 100
                             (irozuke (iro-rgb (/ kakudo 360) 0 1)
                                      boku-no-en)))
  (if (> kakudo 0)
      (kasane kono-en (boku-no-en2 (- kakudo 10)))
      kono-en))

(boku-no-en2 360)

