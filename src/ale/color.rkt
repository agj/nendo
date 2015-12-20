#lang racket
(require racket/draw)

(provide (all-defined-out))


(define (color-rgb r g b)
  (make-color (exact-round (* 255 r))
              (exact-round (* 255 g))
              (exact-round (* 255 b))))

(define ((make-color-getter color-library) color)
  (if (string? color)
      (color-from-name color-library color)
      color))

(define (color-from-name color-library name)
  (define name-lc (string-downcase name))
  (cond [(hash-has-key? color-library name-lc)
         (let ([c (hash-ref color-library name-lc)])
           (make-color (vector-ref c 0) (vector-ref c 1) (vector-ref c 2)))]
        [(send the-color-database find-color name-lc)
         (send the-color-database find-color name-lc)]
        [else (error (string-append "No color named \"" name "\" found."))]))

