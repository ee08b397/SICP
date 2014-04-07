(load "average.scm")

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display "guess: ")
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (not-average-eval)
  (fixed-point (lambda (a) (/ (log 1000) (log a))) 2.0))

(define (average-eval)
  (fixed-point (lambda (a) 
                 (average a (/ (log 1000) (log a))))
               2.0))
