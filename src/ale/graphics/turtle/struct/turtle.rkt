#lang racket
(require pict)

(provide (all-defined-out))


(struct turtle pict (steps))

(struct turtle-state (pos angle bounds painting) #:transparent)

(struct turtle-step (instruction arguments) #:transparent)
