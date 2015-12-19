#lang racket
(require "../../main.rkt"
         "colors.rkt")

(provide (all-defined-out)
         (all-from-out "../../main.rkt"))

; Turtle

(define-syntax-rule (kaku-turtle rest ...) (draw-turtle rest ...))

(define susumu forward)
(define back backward)
(define migi right)
(define hidari left)
(define kaku paint)
(define kakanai dont-paint)
(define kurikaesu repeat)

; General

(define-syntax-rule (totteoku rest ...) (define rest ...))
(define-syntax moshi
  (λ (stx)
    (define datum (cdr (syntax->datum stx)))
    (cond [(= 2 (length datum)) (datum->syntax stx (cons 'when datum))]
          [(= 3 (length datum)) (datum->syntax stx (cons 'if datum))])))

; Colors

(define iro (make-color-getter colors))
(define iro-rgb color-rgb)

; pict

(define kara blank)
(define en circle)
(define en-nuri disk)
(define chouen ellipse)
(define chouen-nuri filled-ellipse)
(define seihoukei square)
(define seihoukei-nuri filled-square)
(define chouhoukei rectangle)
(define chouhoukei-nuri filled-rectangle)

(define yokonarabi hc-append)
(define yokonarabi-mannaka hc-append)
(define yokonarabi-ue ht-append)
(define yokonarabi-shita hb-append)
(define tatenarabi vc-append)
(define tatenarabi-mannaka vc-append)
(define tatenarabi-hidari vl-append)
(define tatenarabi-migi vr-append)

(define kasane cc-superimpose)
(define kasane-mannaka cc-superimpose)
(define kasane-hidari lc-superimpose)
(define kasane-migi rc-superimpose)
(define kasane-ue ct-superimpose)
(define kasane-shita cb-superimpose)
(define kasane-hidariue lt-superimpose)
(define kasane-migiue rt-superimpose)
(define kasane-hidarishita lb-superimpose)
(define kasane-migishita rb-superimpose)

(define (irozuke c pict) (colorize (iro c) pict))
(define toumeido transparency)
(define kakudai scale)
(define sen-futosa linewidth)
(define kaiten rotate)
(define sunpou-awase scale-to-fit)
(define waku-chousei frame-resize)
(define waku-kirinuki clip)

(define chuushin-chousei-xy adjust-center-xy)
(define chuushin-chousei-kakudo adjust-center-angle)
(define chuushin-chousei-ue adjust-center-up)
(define chuushin-chousei-migi adjust-center-right)
(define chuushin-chousei-shita adjust-center-down)
(define chuushin-chousei-hidari adjust-center-left)


