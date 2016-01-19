#lang racket
(require "../src/nendo/main.rkt")


(filled-circle 56)
(filled-square 50)
(define a-circle (filled-circle 56))
(define a-square (filled-square 50))
(define green-circle (colorize (color-hsv (degrees->radians 90) 1 1) a-circle))
green-circle
(define red-square (colorize (color-hsv (degrees->radians -10) 1 1) a-square))
red-square

(superimpose red-square green-circle)
(bottom-left-superimpose green-circle red-square)

(hor-align 5 green-circle red-square)

(define (spiral length p)
  (define angle (degrees->radians (* length 10)))
  (define modified-p (colorize (color-hsv (degrees->radians (+ 230 length)) 0.9 0.9)
                     (rotate angle p)))
  (define this (adjust-center-angle angle
                                    (* 2 length)
                                    modified-p))
  (if (<= length 0) this
      (superimpose this (spiral (- length 1) p))))
(spiral 200 a-square)

