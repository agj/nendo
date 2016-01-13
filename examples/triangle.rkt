#lang racket
(require "../src/nendo/main.rkt")


(define triangle
  (draw-turtle
   (repeat 3
           (right (* 360 1/3))
           (forward 80))))

(draw-turtle
 (repeat 10
         (right (* 360 1/10))
         triangle))
