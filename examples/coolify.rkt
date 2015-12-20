#lang racket
(require "../src/ale/main.rkt")


(define (coolify n thing)
  (frame-resize 10
    (transparency 0.5
      (colorize "pink"
        (line-width 10
          (rotate (* n 10)
            (scale 2 thing)))))))

(define boring-square (square 40))


boring-square

(hor-align -75
           (coolify 1 boring-square)
           (coolify 2 boring-square)
           (coolify 3 boring-square)
           (coolify 4 boring-square)
           (coolify 5 boring-square))

