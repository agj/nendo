#lang racket
(require "../src/nendo/main.rkt")


(define (vstrip pt) (< (abs (point-x pt)) 1))
(define (checker pt) (even? (+ (floor (point-x pt)) (floor (point-y pt)))))
(define (rings pt) (even? (floor (point-distance pt))))
(define (waves pt) (/ (+ 1 (cos (* tau (point-distance pt)))) 2))

(define draw200 (draw-function (rect 100 100 -100 -100)))

#;(colorize "red" (draw200 (uscale/function 30 waves)))
#;(scale 3 (draw200 (uscale/function 10 rings)))

(define my-checker (uscale/function 10 (translate/function (point 0.5 0.5) checker)))

(draw200 (rotate/function (* 1/8 tau) my-checker))
(draw200 my-checker)
(draw200 (xor/region (rotate/function (* 1/8 tau) my-checker)
                     my-checker))


