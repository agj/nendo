#lang racket
(require "../../src/ale/intl/ja/main.rkt")

;; Contribution by Hiroshi Seo.


(totteoku tsumaranai-seihoukei (chouhoukei 10 16))

(totteoku (kakkoyoku-suru n mono)
  (waku-chousei 10
    (toumeido 0.5
      (irozuke "edomurasaki"
        (sen-futosa 3
          (kaiten (* n 10)
            (kakudai 2 mono)))))))

(totteoku ochiru-yatsu
  (tatenarabi (kakkoyoku-suru 0 tsumaranai-seihoukei)
              (kakkoyoku-suru 1 tsumaranai-seihoukei)
              (kakkoyoku-suru 2 tsumaranai-seihoukei)
              (kakkoyoku-suru 3 tsumaranai-seihoukei)
              (kakkoyoku-suru 5 tsumaranai-seihoukei)
              (kakkoyoku-suru 8 tsumaranai-seihoukei)
              (kakkoyoku-suru 13 tsumaranai-seihoukei)
              (kakkoyoku-suru 21 tsumaranai-seihoukei)))

(totteoku (bound n bokunonanigashi)
  (moshi (<= n 0)
         bokunonanigashi
         (yokonarabi-shita -10 (bound (- n 1) bokunonanigashi)
                           (tatenarabi bokunonanigashi
                                       (kara 1 (* 200 (abs (sin (* n 0.3)))))))))


(yokonarabi-shita -30
                  ochiru-yatsu
                  (bound 40 (kakkoyoku-suru 0 tsumaranai-seihoukei)))
