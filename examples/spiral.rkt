#lang racket
(require "../src/nendo/main.rkt")


(define (spiral length)
  (when (> length 0)
    (draw-turtle
     (forward 10)
     (right (* length (degrees->radians 0.5)))
     (spiral (- length 1)))))

(spiral 1000)
