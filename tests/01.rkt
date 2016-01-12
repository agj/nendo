#lang racket
(require "../src/ale/main.rkt")

(define (vertical x y) (< (abs x) 10))
(define (horizontal x y) (< (abs y) 10))


(superimpose
 (draw-function horizontal (rect 100 100 -100 -100))
 (colorize "red" (draw-function vertical (rect 100 100 -100 -100))))

