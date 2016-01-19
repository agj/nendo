#lang racket
(require "../src/nendo/main.rkt")


(define (vstrip pt) (< (abs (point-x pt)) 1))
(define (checker pt) (even? (+ (floor (point-x pt)) (floor (point-y pt)))))
(define (rings pt) (even? (floor (point-distance pt))))
(define (waves pt) (/ (+ 1 (cos (* tau (point-distance pt)))) 2))
(define (circle-f pt) (<= (point-distance pt) 1))

(define draw200 (draw-fi (rect 100 100 -100 -100)))

#;(colorize "red" (draw200 (uscale/fi 30 waves)))
#;(scale 3 (draw200 (uscale/fi 10 rings)))

(define my-checker (uscale/fi 10 (translate/fi (point 0.5 0.5) checker)))

#;(draw200 (rotate/fi (* 1/8 tau) my-checker))
#;(draw200 my-checker)
#;(draw200 (xor/region (rotate/fi (* 1/8 tau) my-checker)
                     my-checker))

#;(draw200 (xor/region
          (uscale/fi 100 circle-f)
          (uscale/fi 50 circle-f)))

(define/curry (swirl n f)
  (compose f (polar-transform (λ (ptp) (point/polar (point/polar-distance ptp)
                                                    (+ (* n (point/polar-distance ptp)) (point/polar-angle ptp)))))))

(draw200 (swirl 0.01 (uscale/fi 20 checker)))

; Region algebra test

(define circle-left  (translate/fi (point -25 0) (uscale/fi 75 circle-f)))
(define circle-right (translate/fi (point  25 0) (uscale/fi 75 circle-f)))

(draw200 (or/region circle-left circle-right))
(draw200 (and/region circle-left circle-right))
(draw200 (xor/region circle-left circle-right))
(draw200 (not/region circle-left))
