#lang racket
(require "../main.rkt")

(provide (all-defined-out)
         (all-from-out "../main.rkt"))

(define-syntax-rule (totteoku rest ...) (define rest ...))

(define-syntax-rule (kaku-turtle rest ...) (draw-turtle rest ...))

(define susumu forward)
(define back backward)
(define migi right)
(define hidari left)
(define kurikaesu repeat)

; pict

(define yokonarabi-mannaka hc-append)
(define yokonarabi-ue ht-append)
(define yokonarabi-shita hb-append)
(define tatenarabi-mannaka vc-append)
(define tatenarabi-hidari vl-append)
(define tatenarabi-migi vr-append)

(define irotsuku colorize)
