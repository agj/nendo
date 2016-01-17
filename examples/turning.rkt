#lang racket
(require "../src/nendo/main.rkt")


(define my-circle (filled-circle 40))

(superimpose (adjust-center-up 20 (colorize "blue" my-circle))
             (adjust-center-right 20 (colorize "red" my-circle))
             (adjust-center-down 20 (colorize "pink" my-circle))
             (adjust-center-left 20 (colorize "orange" my-circle)))


(define (my-circle2 angle)
  (define this-circle
    (adjust-center-angle (degrees->radians angle) 100
                         (colorize (color-rgb (/ angle 360) 0 1)
                                  my-circle)))
  (if (> angle 0)
      (superimpose this-circle (my-circle2 (- angle 10)))
      this-circle))

(my-circle2 360)

