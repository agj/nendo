#lang racket
(require racket/draw
         pict
         "../../geom.rkt")

(provide (all-defined-out))


(define (draw-function f area)
  (define area-size (rect-size area))
  (define area-width (point-x area-size))
  (define area-height (point-y area-size))
  (dc (λ (dc dx dy)
        (define bm (make-bitmap area-width area-height))
        (define bm-dc (send bm make-dc))
        (for* ([x (in-range (rect-left area) (rect-right area))]
               [y (in-range (rect-bottom area) (rect-top area))])
              (send bm-dc set-pixel
                    (- x (rect-left area))
                    (- y (rect-bottom area))
                    (to-color (f x y))))
        (send dc draw-bitmap bm dx dy))
      area-width area-height))

(define (to-color value)
  (cond [(is-a? value color%)
         value]
        [(boolean? value)
         (if value (make-color 0 0 0) (make-color 255 255 255))]))
