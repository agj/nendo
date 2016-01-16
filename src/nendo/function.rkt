#lang racket
(require srfi/26)

(provide (all-defined-out))


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
