#lang racket
(require "../src/nendo/main.rkt")

(define boring-square (rectangle 10 16))

(define (coolify n thing)
  ((compose (frame-resize 10)
            (transparency 0.5)
            (colorize (color-rgb 1 0 1))
            (line-width 3)
            (rotate (* n 10))
            (scale 2))
   thing))

(coolify 10 boring-square)
