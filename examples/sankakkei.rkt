#lang racket
(require "../src/ale/intl/ja/main.rkt")


(totteoku sankakkei
  (draw-turtle
   (kurikaesu 3
              (migi (* 360 1/3))
              (susumu 80))))

(draw-turtle
 (kurikaesu 10
            (migi (* 360 1/10))
            sankakkei))
