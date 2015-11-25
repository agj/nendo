#lang racket
(require "../src/ale/intl/ja/main.rkt")


(totteoku (n-kakkei n ookisa)
  (draw-turtle
   (kurikaesu n
              (migi (/ 360 n))
              (susumu ookisa))))

(kasane (n-kakkei 3 80)
        (n-kakkei 4 80)
        (n-kakkei 5 80)
        (n-kakkei 6 80))
