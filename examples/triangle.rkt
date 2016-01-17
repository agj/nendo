#lang racket
(require "../src/nendo/main.rkt")


(define triangle
  (draw-turtle
   (repeat 3
           (right (* tau 1/3))
           (forward 80))))

(draw-turtle
 (repeat 10
         (right (* tau 1/10))
         triangle))
