#lang racket
(require "../src/nendo/main.rkt")
(require srfi/26)


(define (point-distance pt) (sqrt (+ (expt (point-x pt) 2) (expt (point-y pt) 2))))
(define-syntax-rule (curryλ args body)
  (curry (λ args body)))
(define-syntax define/curry (λ (stx)
  (let* ([data (syntax->datum stx)]
         [pattern (cadr data)]
         [body (cddr data)])
    (datum->syntax stx
      `(define ,(car pattern) (curry (λ ,(cdr pattern) . ,body)))))))
(define (lift f . gs)
  (λ args
    (apply f (map (cut apply <> args) gs))))


(define/curry (scale/point spt pt) (point (* (point-x spt) (point-x pt))
                                          (* (point-y spt) (point-y pt))))
(define/curry (uscale/point n pt) (scale/point (point n n) pt))
(define/curry (translate/point dest pt) (point (+ (point-x pt) (point-x dest))
                                               (+ (point-y pt) (point-y dest))))

(define/curry (scale/function spt f) (compose f (scale/point (point (/ 1 (point-x spt))
                                                                    (/ 1 (point-y spt))))))
(define/curry (uscale/function n f) (compose f (uscale/point (/ 1 n))))
(define/curry (translate/function dest f)
  (compose f (translate/point (point (- (point-x dest))
                                     (- (point-y dest))))))

(define filled (const #t))
(define void (const #f))


(define (vstrip pt) (< (abs (point-x pt)) 1))
(define (checker pt) (even? (+ (floor (point-x pt)) (floor (point-y pt)))))
(define (rings pt) (even? (floor (point-distance pt))))
(define (waves pt) (/ (+ 1 (cos (* tau (point-distance pt)))) 2))

(define rect200 (rect 100 100 -100 -100))

(draw-function rect200 (translate/function (point 25 25) (uscale/function 50 checker)))
(colorize "red" (draw-function rect200 (uscale/function 30 waves)))
(scale 3 (draw-function rect200 (uscale/function 10 rings)))


