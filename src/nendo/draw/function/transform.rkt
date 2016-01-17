#lang racket
(require "../../function.rkt"
         "../../geom.rkt")

(provide (all-defined-out))


(struct point/polar (distance angle) #:transparent)

(define (cartesian->polar pt) (point/polar (point-distance pt)
                                           (if (and (= 0 (point-x pt)) (= 0 (point-y pt)))
                                               0
                                               (atan (point-y pt) (point-x pt)))))
(define (polar->cartesian ptp)
  (define distance (point/polar-distance ptp))
  (define angle (point/polar-angle ptp))
  (point (* distance (cos angle))
         (* distance (sin angle))))
(define/curry (polar-transform xf pt) ((compose polar->cartesian xf cartesian->polar) pt))

;; Point

(define/curry (scale/point spt pt) (point (* (point-x spt) (point-x pt))
                                          (* (point-y spt) (point-y pt))))
(define/curry (uscale/point n pt) (scale/point (point n n) pt))
(define/curry (translate/point dest pt) (point (+ (point-x pt) (point-x dest))
                                               (+ (point-y pt) (point-y dest))))
(define/curry (rotate/point angle pt)
  ((polar-transform (λ (ptp) (point/polar (point/polar-distance ptp)
                                         (+ angle (point/polar-angle ptp)))))
   pt))

;; Function

(define/curry (scale/function spt f) (compose f (scale/point (point (/ 1 (point-x spt))
                                                                    (/ 1 (point-y spt))))))
(define/curry (uscale/function n f) (compose f (uscale/point (/ 1 n))))
(define/curry (translate/function dest f)
  (compose f (translate/point (point (- (point-x dest))
                                     (- (point-y dest))))))
(define/curry (rotate/function angle f) (compose f (rotate/point (- angle))))
