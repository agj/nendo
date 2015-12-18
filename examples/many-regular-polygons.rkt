#lang racket
(require "../src/ale/main.rkt")


(define (regular-polygon n size)
  (define angle (- 180 (/ 360 n)))
  (define side (* 2 size (sin (degrees->radians (/ 360 n 2)))))
  (draw-turtle
   (repeat n
              (dont-paint)
              (forward size)
              (left (/ angle 2))
              (paint)
              (backward side)
              (left (/ angle 2))
              (dont-paint)
              (forward size)
              (right 180))))

(define (many-regular-polygons n)
  (define this-polygon (regular-polygon n (* n 10)))
  (if (> n 3)
         (superimpose this-polygon
                 (many-regular-polygons (- n 1)))
         this-polygon))



(frame-resize -100 (many-regular-polygons 30))
