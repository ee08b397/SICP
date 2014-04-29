(load "parallel-resistor.scm")

(define (close-enough? a b)
  (< (abs (- a b)) 0.0001))

(define (interval-equal? x y)
  (and (close-enough? (lower-bound x) (lower-bound y))
       (close-enough? (upper-bound x) (upper-bound y))))

(define resistor1 (make-interval 4 5))
(define resistor2 (make-interval 9 10))
(display "resistor1: ")
(print-interval resistor1)
(display "resistor2: ")
(print-interval resistor2)
(display "par1 result: ")
(define par1-result (par1 resistor1 resistor2))
(print-interval par1-result)
(display "par2 result: ")
(define par2-result (par2 resistor1 resistor2))
(print-interval par2-result)
(display "is par1-result equal par2-result? ")
(display (interval-equal? par1-result par2-result))
(newline)
(newline)

; compute A/A and B/A
(display "define A and B using make-interval")
(newline)

(define A (make-interval 4.005  5.005))
(display "A = ")
(print-interval A)
(define B (make-interval 9.99 10.01))
(display "B = ")
(print-interval B)
(display "A/A = ")
(print-interval (div-interval A A))
(display "A/B = ")
(print-interval (div-interval A B))

(display "define A and B using make-center-percent")
(newline)

(define A (make-center-percent 5 0.1))
(define B (make-center-percent 10 0.1))
(display "A = ")
(print-interval A)
(display "B = ")
(print-interval B)
(display "A/A = ")
(print-interval (div-interval A A))
(display "A/B = ")
(print-interval (div-interval A B))
