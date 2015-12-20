#lang racket
(require "../src/ale/intl/ja/main.rkt")

;; Contribution by Tetsuji Satou.


(define my-circle (filled-circle 2))

(define (my-circle2 angle)
  (define this-circle (adjust-center-angle angle 200
                        (adjust-center-angle (* 12 angle) 60 my-circle)))
  (if (> angle 0)
      (superimpose this-circle (my-circle2 (- angle 0.2)))
      this-circle))


(my-circle2 360)
