#lang racket
(require "../src/nendo/main.rkt")


(define (swirl n fim)
  (compose fim (polar-transform
                (λ (ptp)
                  (define distance (point/polar-distance ptp))
                  (define angle (point/polar-angle ptp))
                  (point/polar distance
                               (+ angle
                                  (* n distance)))))))

(define (checker pt) (even? (+ (floor (point-x pt))
                               (floor (point-y pt)))))
(define (vertical-line pt) (< (abs (point-x pt)) 1 ))

(define big-checker (uscale/function 15 checker))
(define slanted-checker (rotate/function (degrees->radians 5) big-checker))
(define combined-checkers (xor/region big-checker slanted-checker))


(draw-function (make-rect -100 -100 200 200) vertical-line)

