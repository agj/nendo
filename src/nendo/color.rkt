#lang racket
(require racket/draw)

(provide (all-defined-out))


(define color-rgb
  (case-lambda [(r g b)
                (make-color (exact-round (* 255 r))
                            (exact-round (* 255 g))
                            (exact-round (* 255 b)))]
               [(r g b a)
                (make-color (exact-round (* 255 r))
                            (exact-round (* 255 g))
                            (exact-round (* 255 b))
                            a)]))

(define color-hsv
  (let ([perform (λ (hue saturation value alpha)
                   (define chroma (* saturation value))
                   (define hue* (/ (remainder* hue (* 2 pi)) (/ pi 3)))
                   (define X (* chroma (- 1 (abs (- (remainder* hue* 2) 1)))))
                   (define-values (r1 g1 b1)
                     (cond [(and (<= 0 hue*) (< hue* 1)) (values chroma X 0)]
                           [(and (<= 1 hue*) (< hue* 2)) (values X chroma 0)]
                           [(and (<= 2 hue*) (< hue* 3)) (values 0 chroma X)]
                           [(and (<= 3 hue*) (< hue* 4)) (values 0 X chroma)]
                           [(and (<= 4 hue*) (< hue* 5)) (values X 0 chroma)]
                           [(and (<= 5 hue*) (< hue* 6)) (values chroma 0 X)]))
                   (define m (- value chroma))
                   (apply make-color (append (map (λ (x) (exact-round (* 255 (+ x m))))
                                                  (list r1 g1 b1))
                                             (list alpha))))])
    (case-lambda [(hue saturation value)       (perform hue saturation value 1)]
                 [(hue saturation value alpha) (perform hue saturation value alpha)])))


(define (remainder* n1 n2)
  (define num-divides (/ n1 n2))
  (- n1 (* (floor num-divides) n2)))
