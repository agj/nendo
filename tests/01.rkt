#lang racket
(require "../src/nendo/main.rkt")


(define (vstrip pt) (< (abs (point-x pt)) 1))
(define (checker pt) (even? (+ (floor (point-x pt)) (floor (point-y pt)))))
(define (rings pt) (even? (floor (point-distance pt))))
(define (waves pt) (/ (+ 1 (cos (* tau (point-distance pt)))) 2))

(define rect200 (rect 100 100 -100 -100))

(draw-function rect200 (translate/function (point 25 25) (uscale/function 50 checker)))
(colorize "red" (draw-function rect200 (uscale/function 30 waves)))
(scale 3 (draw-function rect200 (uscale/function 10 rings)))


