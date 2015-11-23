#lang racket
(require pict)
(require "struct/turtle.rkt"
         "../../struct/geom.rkt")

(provide (all-defined-out)
         (all-from-out "struct/turtle.rkt"
                       "../../struct/geom.rkt"))

(define-syntax draw-turtle
  (λ (stx)
    (datum->syntax stx `(let* ([forward turtle:forward] [backward turtle:backward] [right turtle:right] [left turtle:left] [repeat turtle:repeat]
                               [steps (expand-turtle-sub-steps ,(cons 'list (cdr (syntax->datum stx))))]
                               [states (turtle-steps->states steps)]
                               [bounds (turtle-state-bounds (last states))]
                               [size (rect-size bounds)])
                          (turtle (make-turtle-draw steps bounds)
                                  (point-x size) (point-y size)
                                  0 0
                                  '()
                                  #f
                                  #f
                                  steps)))))

(define (turtle:forward amount) (turtle-step 'forward (list amount)))
(define (turtle:backward amount) (turtle-step 'backward (list amount)))
(define (turtle:right amount) (turtle-step 'right (list amount)))
(define (turtle:left amount) (turtle-step 'left (list amount)))
(define (turtle:repeat . args) (turtle-step 'repeat args))

(define (expand-turtle-sub-steps steps)
  (append-map (λ (step)
                (cond [(turtle-step? step)
                       (if (eq? 'repeat (turtle-step-instruction step))
                           (expand-turtle-sub-steps (apply *repeat (turtle-step-arguments step)))
                           (list step))]
                      [(turtle? step)
                       (turtle-steps step)]))
              steps))

(define (*repeat times . steps)
  (append-map (const steps) (range times)))

(define (make-turtle-draw steps bounds)
  (define size (rect-size bounds))
  (define offset-x (- (rect-left bounds)))
  (define offset-y (- (rect-top bounds)))
  (pict-draw (dc (λ (dc dx dy)
                   (foldl (process-turtle-step dc (+ dx offset-x) (+ dy offset-y))
                          (turtle-state (point 0 0) 0 (rect 0 0 0 0))
                          steps))
                 (point-x size) (point-y size))))

(define (process-turtle-step dc dx dy)
  (λ (step old-state)
    (define state (advance-turtle-state step old-state))
    (define old-pos (turtle-state-pos old-state))
    (define pos (turtle-state-pos state))
    (when (not (and (= (point-x pos) (point-x old-pos))
                    (= (point-y pos) (point-y old-pos))))
          (send dc draw-line (+ dx (point-x old-pos))
                             (+ dy (point-y old-pos))
                             (+ dx (point-x pos))
                             (+ dy (point-y pos))))
    state))

(define (advance-turtle-state step state)
  (define instruction (turtle-step-instruction step))
  (define arguments (turtle-step-arguments step))
  (cond [(eq? 'forward instruction)
         (turtle-state-move (car arguments) state)]
        [(eq? 'backward instruction)
         (turtle-state-move (- (car arguments)) state)]
        [(eq? 'right instruction)
         (turtle-state-rotate (car arguments) state)]
        [(eq? 'left instruction)
         (turtle-state-rotate (- (car arguments)) state)]))

(define (turtle-steps->states steps)
  (reverse (foldl (λ (step states)
                    (cons (advance-turtle-state step (car states)) states))
                  (list (turtle-state (point 0 0) 0 (rect 0 0 0 0)))
                  steps)))

(define (turtle-steps->result-state steps)
  (last (turtle-steps->states steps)))

(define (turtle-state-move amount state)
  (define angle (turtle-state-angle state))
  (define prev-pos (turtle-state-pos state))
  (define prev-bounds (turtle-state-bounds state))
  (define pos (point-sum prev-pos
                         (point-polar amount angle)))
  (define bounds (rect (min (point-y pos) (rect-top prev-bounds))
                           (max (point-x pos) (rect-right prev-bounds))
                           (max (point-y pos) (rect-bottom prev-bounds))
                           (min (point-x pos) (rect-left prev-bounds))))
  (turtle-state pos angle bounds))

(define (turtle-state-rotate amount state)
  (turtle-state (turtle-state-pos state)
                (+ amount (turtle-state-angle state))
                (turtle-state-bounds state)))