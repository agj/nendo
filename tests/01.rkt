#lang racket
(require "../src/nendo/main.rkt")


(define (vstrip pt) (< (abs (point-x pt)) 1))
(define (checker pt) (even? (+ (floor (point-x pt)) (floor (point-y pt)))))
(define (rings pt) (even? (floor (point-distance pt))))
(define (waves pt) (/ (+ 1 (cos (* tau (point-distance pt)))) 2))
(define (circle-f pt) (<= (point-distance pt) 1))

#;(define (swirl f) (polar-transform (λ (ptp) )))

(define draw200 (draw-function (rect 100 100 -100 -100)))

#;(colorize "red" (draw200 (uscale/function 30 waves)))
#;(scale 3 (draw200 (uscale/function 10 rings)))

(define my-checker (uscale/function 10 (translate/function (point 0.5 0.5) checker)))

#;(draw200 (rotate/function (* 1/8 tau) my-checker))
#;(draw200 my-checker)
#;(draw200 (xor/region (rotate/function (* 1/8 tau) my-checker)
                     my-checker))

#;(draw200 (xor/region
          (uscale/function 100 circle-f)
          (uscale/function 50 circle-f)))

(define/curry (swirl n f)
  (compose f (polar-transform (λ (ptp) (point/polar (point/polar-distance ptp)
                                                    (+ (* n (point/polar-distance ptp)) (point/polar-angle ptp)))))))

(draw200 (swirl 0.01 (uscale/function 20 checker)))

; Region algebra test

(define circle-left  (translate/function (point -25 0) (uscale/function 75 circle-f)))
(define circle-right (translate/function (point  25 0) (uscale/function 75 circle-f)))

(draw200 (or/region circle-left circle-right))
(draw200 (and/region circle-left circle-right))
(draw200 (xor/region circle-left circle-right))
(draw200 (not/region circle-left))
