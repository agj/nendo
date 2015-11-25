#lang racket
(require "../src/ale/intl/ja/main.rkt")


(totteoku (kakkoyoku-suru n mono)
  (waku-chousei 10
    (toumeido 0.5
      (irozuke "azareapinku"
        (sen-futosa 10
          (kaiten (* n 10)
            (kakudai 2 mono)))))))

(totteoku tsumaranai-seihoukei (seihoukei 40))


tsumaranai-seihoukei

(yokonarabi -75
            (kakkoyoku-suru 1 tsumaranai-seihoukei)
            (kakkoyoku-suru 2 tsumaranai-seihoukei)
            (kakkoyoku-suru 3 tsumaranai-seihoukei)
            (kakkoyoku-suru 4 tsumaranai-seihoukei)
            (kakkoyoku-suru 5 tsumaranai-seihoukei))

