#lang racket
(require "../src/nendo/main.rkt")


(define deg degrees->radians)

(draw-turtle
 (right (deg 45))
 (forward 100)
 (left (deg 90))
 (forward 100))

(draw-turtle
 (right (deg 90))
 (repeat 5
         (forward 200)
         (right (deg (/ 360 2.5)))))

(define (n-gram n)
  (draw-turtle
   (right (deg 90))
   (repeat n
           (forward 200)
           (right (deg (/ 360 (/ n 2)))))))
(n-gram 5)
(n-gram 7)
(n-gram 9)
(n-gram 11)
(n-gram 13)

(superimpose
 (n-gram 5)
 (n-gram 7)
 (n-gram 9)
 (n-gram 11)
 (n-gram 13))
