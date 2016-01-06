#lang racket
(require "../src/ale/main.rkt")


(define (spiral length)
  (when (> length 0)
    (draw-turtle
     (forward 10)
     (right (* 0.5 length))
     (spiral (- length 1)))))

(spiral 1000)
