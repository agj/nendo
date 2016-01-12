#lang racket
(require "../src/ale/main.rkt")

(define (reg x y) (< (abs x) 10))

(colorize "red" (draw-function reg (rect 100 100 -100 -100)))

