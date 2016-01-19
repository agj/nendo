#lang racket

(provide (all-defined-out))


(define tau (* 2 pi))


; Rect

(struct rect (top right bottom left) #:transparent)

(define make-rect (case-lambda [(w h) (rect h w 0 0)]
                               [(x y w h) (rect (+ y h) (+ x w) y x)]))

(define (rect-width r) (abs (- (rect-right r) (rect-left r))))

(define (rect-height r) (abs (- (rect-bottom r) (rect-top r))))

(define (rect-size r)
  (point (rect-width r)
         (rect-height r)))


; Point

(struct point (x y) #:transparent)
(define point/cartesian point)
(define point/c point)

(define (point-from-polar distance angle)
  (point (* distance (cos angle))
         (* distance (sin angle))))

(define (point-diff a b)
  (point (- (point-x a) (point-x b))
         (- (point-y a) (point-y b))))

(define (point-sum a b)
  (point (+ (point-x a) (point-x b))
         (+ (point-y a) (point-y b))))

(define (point-eq? a b)
  (and (= (point-x a) (point-x b))
       (= (point-y a) (point-y b))))

(define (point-distance pt)
  (sqrt (+ (expt (point-x pt) 2)
           (expt (point-y pt) 2))))

(define (point-angle pt)
  (if (and (= 0 (point-x pt)) (= 0 (point-y pt)))
      0
      (atan (point-y pt) (point-x pt))))


; Point polar

(struct point/polar (distance angle) #:transparent)
(define point/p point/polar)

(define (cartesian->polar pt) (point/polar (point-distance pt)
                                           (point-angle pt)))
(define (polar->cartesian ptp)
  (define distance (point/polar-distance ptp))
  (define angle (point/polar-angle ptp))
  (point (* distance (cos angle))
         (* distance (sin angle))))

