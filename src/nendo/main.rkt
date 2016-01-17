#lang racket
(require pict
         racket/draw)
(require "draw/turtle/main.rkt"
         "draw/function/main.rkt"
         "color.rkt"
         "function.rkt")

(provide (all-defined-out)
         (rename-out [*scale scale]
                     [*colorize colorize]
                     [*scale-to-fit scale-to-fit]
                     [*rotate rotate]))
(provide (except-out (all-from-out pict
                                   "draw/turtle/main.rkt"
                                   "draw/function/main.rkt"
                                   "color.rkt")
                     scale
                     colorize
                     scale-to-fit
                     rotate))


; Meta-utilities

(define ((last-argument-first proc) . args)
  (apply proc (append (take-right args 1) (drop-right args 1))))


; pict

(define filled-circle (curry disk))
(define/curry (square n) (rectangle n n))
(define/curry (filled-square n) (filled-rectangle n n))

(define hor-align hc-append)
(define hor-center-align hc-append)
(define hor-top-align ht-append)
(define hor-bottom-align hb-append)
(define ver-align vc-append)
(define ver-center-align vc-append)
(define ver-left-align vl-append)
(define ver-right-align vr-append)

(define superimpose cc-superimpose)
(define center-superimpose cc-superimpose)
(define left-superimpose lc-superimpose)
(define right-superimpose rc-superimpose)
(define top-superimpose ct-superimpose)
(define bottom-superimpose cb-superimpose)
(define top-left-superimpose lt-superimpose)
(define top-right-superimpose rt-superimpose)
(define bottom-left-superimpose lb-superimpose)
(define bottom-right-superimpose rb-superimpose)

(define/curry (*colorize c pict) (colorize pict c))
(define/curry (transparency n pict) (cellophane pict n))
(define/curry (*scale baisuu pict) (scale pict baisuu))
(define line-width (curry linewidth))
(define/curry (*rotate angle pict) (rotate pict (- angle)))
(define/curry (*scale-to-fit comp pict)
  (cond [(rect? comp) (scale-to-fit pict (point-x comp) (point-y comp))]
        [(pict? comp) (scale-to-fit pict comp)]))
#;(define *scale-to-fit (last-argument-first scale-to-fit))
(define frame-resize (λ args
  (define (*inset pict vals) (match vals [(list t r b l) (inset pict l t r b)]
                                         [_ (apply inset (cons pict vals))]))
  (if (pict? (last args))
      (*inset (last args) (drop-right args 1))
      (λ (pict) (*inset pict args)))))
#;(define frame-resize (last-argument-first inset))

(define (adjust-center-xy x y pict)
  (inset pict
         (if (< x 0) 0 (* 2 x))       ; left
         (if (< y 0) 0 (* 2 y))       ; top
         (if (> x 0) 0 (* 2 (- x)))   ; right
         (if (> y 0) 0 (* 2 (- y))))) ; bottom
(define (adjust-center-angle angle dist pict)
  (define off (point-polar dist (- angle (* tau 0.25))))
  (adjust-center-xy (point-x off) (point-y off) pict))
(define (adjust-center-up n pict) (adjust-center-xy 0 (- n) pict))
(define (adjust-center-right n pict) (adjust-center-xy n 0 pict))
(define (adjust-center-down n pict) (adjust-center-xy 0 n pict))
(define (adjust-center-left n pict) (adjust-center-xy (- n) 0 pict))


