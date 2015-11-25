#lang racket
(require "../src/ale/intl/ja/main.rkt")


(totteoku (seitakakukei n ookisa)
  (totteoku kakudo (- 180 (/ 360 n)))
  (totteoku hen (* 2 ookisa (sin (degrees->radians (/ 360 n 2)))))
  (draw-turtle
   (kurikaesu n
              (kakanai)
              (susumu ookisa)
              (hidari (/ kakudo 2))
              (kaku)
              (back hen)
              (hidari (/ kakudo 2))
              (kakanai)
              (susumu ookisa)
              (migi 180))))

(totteoku (seitakakukei-ippai n)
  (totteoku kono-seitakakukei (seitakakukei n (* n 10)))
  (moshi (> n 3)
         (kasane kono-seitakakukei
                 (seitakakukei-ippai (- n 1)))
         kono-seitakakukei))



(waku-chousei -100 (seitakakukei-ippai 30))
