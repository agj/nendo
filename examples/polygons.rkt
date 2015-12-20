#lang racket
(require "../src/ale/intl/ja/main.rkt")


(define (polygon n size)
  (draw-turtle
   (repeat n
           (right (/ 360 n))
           (forward size))))

(superimpose (polygon 3 80)
             (polygon 4 80)
             (polygon 5 80)
             (polygon 6 80))
