#lang racket
(require "../src/ale/main.rkt")

;; Contribution by Hiroshi Seo.


(define boring-square (rectangle 10 16))

(define (coolify n thing)
  (frame-resize 10
    (transparency 0.5
      (colorize "purple"
        (line-width 3
          (rotate (* n 10)
            (scale 2 thing)))))))

(define falling-thing
  (ver-align (coolify 0 boring-square)
             (coolify 1 boring-square)
             (coolify 2 boring-square)
             (coolify 3 boring-square)
             (coolify 5 boring-square)
             (coolify 8 boring-square)
             (coolify 13 boring-square)
             (coolify 21 boring-square)))

(define (bound n myvar)
  (if (<= n 0)
      myvar
      (hor-bottom-align -10 (bound (- n 1) myvar)
                        (ver-align myvar
                                   (blank 1 (* 200 (abs (sin (* n 0.3)))))))))


(hor-bottom-align -30
                  falling-thing
                  (bound 40 (coolify 0 boring-square)))
