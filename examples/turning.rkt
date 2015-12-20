#lang racket
(require "../src/ale/intl/ja/main.rkt")


(define my-circle (en-nuri 40))

(superimpose (adjust-center-up 20 (irozuke "blue" my-circle))
             (adjust-center-right 20 (irozuke "red" my-circle))
             (adjust-center-down 20 (irozuke "pink" my-circle))
             (adjust-center-left 20 (irozuke "orange" my-circle)))


(define (my-circle2 angle)
  (define this-circle
    (adjust-center-angle angle 100
                         (irozuke (iro-rgb (/ angle 360) 0 1)
                                  my-circle)))
  (if (> angle 0)
      (superimpose this-circle (my-circle2 (- angle 10)))
      this-circle))

(my-circle2 360)

