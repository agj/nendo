#lang racket
(require "../../function.rkt"
         "../../geom.rkt")

(provide (all-defined-out))


;; Point

(define/curry (scale/point spt pt) (point (* (point-x spt) (point-x pt))
                                          (* (point-y spt) (point-y pt))))
(define/curry (uscale/point n pt) (scale/point (point n n) pt))
(define/curry (translate/point dest pt) (point (+ (point-x pt) (point-x dest))
                                               (+ (point-y pt) (point-y dest))))

;; Function

(define/curry (scale/function spt f) (compose f (scale/point (point (/ 1 (point-x spt))
                                                                    (/ 1 (point-y spt))))))
(define/curry (uscale/function n f) (compose f (uscale/point (/ 1 n))))
(define/curry (translate/function dest f)
  (compose f (translate/point (point (- (point-x dest))
                                     (- (point-y dest))))))
