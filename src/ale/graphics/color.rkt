#lang racket
(require racket/draw)

(provide (all-defined-out))


(define color-rgb make-color)

(define ((make-color-getter color-library) color)
  (if (string? color)
      (color-from-name color-library color)
      color))

(define (color-from-name color-library name)
  (define name-lc (string-downcase name))
  (cond [(hash-has-key? color-library name-lc)
         (let ([c (hash-ref color-library name-lc)])
           (color-rgb (vector-ref c 0) (vector-ref c 1) (vector-ref c 2)))]
        [(send the-color-database find-color name-lc)
         (send the-color-database find-color name-lc)]
        [else (error (string-append "No color named \"" name "\" found."))]))

