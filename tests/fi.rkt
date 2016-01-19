#lang racket
(require "../src/nendo/main.rkt")


(define (half pt) (> (point-x pt) 0))
(define box (make-rect -100 -100 200 200))
(draw-fi box half)

(define slant (rotate/fi (degrees->radians 45) half))
(draw-fi box slant)

(define (circle pt) (<= (point-distance pt) 1))
(draw-fi box circle)
(define big-circle (uscale/fi 75 circle))
(draw-fi box big-circle)
(define circle-left (translate/fi (point -25 0) big-circle))
(define circle-right (translate/fi (point 25 0) big-circle))
(draw-fi box circle-left)
(draw-fi box circle-right)
(define dfi (draw-fi box))
(dfi (or/region circle-left circle-right))
(dfi (and/region circle-left circle-right))
(dfi (xor/region circle-left circle-right))

(define (checker pt) (even? (+ (floor (point-x pt))
                               (floor (point-y pt)))))
(dfi checker)
(define big-checker (uscale/fi 20 checker))
(dfi big-checker)
(define (swirl n fi)
  (compose fi
           (polar-transform (λ (ptp)
                              (define distance (point/polar-distance ptp))
                              (define angle (point/polar-angle ptp))
                              (point/polar distance
                                           (+ angle
                                              (* n distance)))))))
(dfi (swirl 0.04 big-checker))
(dfi (swirl 1 half))
(colorize (color-hsv 170 1 1) (rotate (degrees->radians 45) (dfi (swirl 1 half))))
