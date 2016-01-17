#lang racket
(require racket/draw
         pict
         "../../geom.rkt"
         "../../function.rkt"
         "transform.rkt")

(provide draw-function
         (all-from-out "transform.rkt"))


(define/curry (draw-function area f)
  (define area-size (rect-size area))
  (define area-width (point-x area-size))
  (define area-height (point-y area-size))
  (dc (λ (dc dx dy)
        (define bm (make-bitmap area-width area-height))
        (define bm-dc (send bm make-dc))
        (define color (send (send dc get-pen) get-color))
        (for* ([x (in-range (rect-left area) (rect-right area))]
               [y (in-range (rect-bottom area) (rect-top area))])
              (send bm-dc set-pixel
                    (- x (rect-left area))
                    (- y (rect-bottom area))
                    (to-color (f (point x y)) color)))
        (send dc draw-bitmap bm dx dy))
      area-width area-height))

(define (to-color value color)
  (cond [(is-a? value color%)
         value]
        [(boolean? value)
         (if value color (make-color 0 0 0 0))]
        [(number? value)
         (make-color
          (send color red)
          (send color green)
          (send color blue)
          (* value (send color alpha)))]))
