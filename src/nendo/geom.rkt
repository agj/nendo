#lang racket

(provide (all-defined-out))


(define tau (* 2 pi))


; Rect

(struct rect (top right bottom left) #:transparent)

(define (rect-size r)
  (point (abs (- (rect-right r) (rect-left r)))
         (abs (- (rect-bottom r) (rect-top r)))))


; Point

(struct point (x y) #:transparent)

(define (point-polar distance angle)
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
