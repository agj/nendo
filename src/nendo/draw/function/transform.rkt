#lang racket
(require "../../function.rkt"
         "../../geom.rkt")

(provide (all-defined-out))


;; Point

(define/curry (polar-transform xf pt) ((compose polar->cartesian xf cartesian->polar) pt))

(define/curry (scale/point spt pt) (point (* (point-x spt) (point-x pt))
                                          (* (point-y spt) (point-y pt))))
(define/curry (uscale/point n pt) (scale/point (point n n) pt))
(define/curry (translate/point dest pt) (point (+ (point-x pt) (point-x dest))
                                               (+ (point-y pt) (point-y dest))))
(define/curry (rotate/point angle pt)
  ((polar-transform (λ (ptp) (point/polar (point/polar-distance ptp)
                                         (+ angle (point/polar-angle ptp)))))
   pt))

;; Region

(define (&& a b) (and a b))
(define (|| a b) (or a b))

(define/curry (or/region f g) (lift || f g))
(define/curry (and/region f g) (lift && f g))
(define/curry (xor/region f g) (lift xor f g))
(define/curry (not/region f) (lift not f))

(define union/region or/region)
(define intersection/region and/region)
(define inverse/region not/region)

;; Function

(define/curry (scale/function spt f) (compose f (scale/point (point (/ 1 (point-x spt))
                                                                    (/ 1 (point-y spt))))))
(define/curry (uscale/function n f) (compose f (uscale/point (/ 1 n))))
(define/curry (translate/function dest f)
  (compose f (translate/point (point (- (point-x dest))
                                     (- (point-y dest))))))
(define/curry (rotate/function angle f) (compose f (rotate/point (- angle))))


