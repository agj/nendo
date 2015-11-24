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
(define kaku paint)
(define kakanai dont-paint)
(define kurikaesu repeat)

; pict

(define en circle)
(define en-nuri disk)
(define chouen ellipse)
(define chouen-nuri filled-ellipse)
(define (seihoukei n) (rectangle n n))
(define (seihoukei-nuri n) (filled-rectangle n n))
(define chouhoukei rectangle)
(define chouhoukei-nuri filled-rectangle)
(define kara empty)

(define yokonarabi-mannaka hc-append)
(define yokonarabi-ue ht-append)
(define yokonarabi-shita hb-append)
(define tatenarabi-mannaka vc-append)
(define tatenarabi-hidari vl-append)
(define tatenarabi-migi vr-append)

(define kasane-mannaka cc-superimpose)
(define kasane-hidari lc-superimpose)
(define kasane-migi rc-superimpose)
(define kasane-ue ct-superimpose)
(define kasane-shita cb-superimpose)
(define kasane-hidariue lt-superimpose)
(define kasane-migiue rt-superimpose)
(define kasane-hidarishita lb-superimpose)
(define kasane-migishita rb-superimpose)

(define (irozuke iro pict) (colorize pict iro))
(define (toumeido pc pict) (cellophane pict pc))
(define (kakudai baisuu pict) (scale pict baisuu))

#;(define (iro-hsv)
  (make-color ))
