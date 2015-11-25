#lang racket
(require "../../main.rkt"
         "colors.rkt")

(provide (all-defined-out)
         (all-from-out "../../main.rkt"))

; Meta-utilities

(define ((last-argument-first proc) . args)
  (apply proc (append (take-right args 1) (drop-right args 1))))



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
(define-syntax-rule (moshi rest ...) (when rest ...))

; Colors

(define iro (make-color-getter colors))
(define iro-rgb color-rgb)

; pict

(define kara empty)
(define en circle)
(define en-nuri disk)
(define chouen ellipse)
(define chouen-nuri filled-ellipse)
(define (seihoukei n) (rectangle n n))
(define (seihoukei-nuri n) (filled-rectangle n n))
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

(define (irozuke c pict) (colorize pict (iro c)))
(define (toumeido n pict) (cellophane pict n))
(define (kakudai baisuu pict) (scale pict baisuu))
(define sen-futosa linewidth)
(define (kaiten kakudo pict) (rotate pict (degrees->radians (- kakudo))))
(define sunpou-awase (last-argument-first scale-to-fit))
(define waku-chousei (last-argument-first inset))

(define (chuushin-chousei-xy x y pict)
  (inset pict
         (if (< x 0) 0 (* 2 x))       ; left
         (if (< y 0) 0 (* 2 y))       ; top
         (if (> x 0) 0 (* 2 (- x)))   ; right
         (if (> y 0) 0 (* 2 (- y))))) ; bottom
(define (chuushin-chousei-kakudo angle dist pict)
  (define off (point-polar dist (degrees->radians (- angle 90))))
  (chuushin-chousei-xy (point-x off) (point-y off) pict))
(define (chuushin-chousei-ue n pict) (chuushin-chousei-xy 0 (- n) pict))
(define (chuushin-chousei-migi n pict) (chuushin-chousei-xy n 0 pict))
(define (chuushin-chousei-shita n pict) (chuushin-chousei-xy 0 n pict))
(define (chuushin-chousei-hidari n pict) (chuushin-chousei-xy (- n) 0 pict))


