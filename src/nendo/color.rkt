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
