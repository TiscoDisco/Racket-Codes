;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a02q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Ryan Hamin Kim
;CS116
;Assignment 2 Question 2

;(tov-maker x delta n) produces a function that plots a graph with starting x
; as x and goes up by delta. produces n amount of values
; tov-maker: Num Num Num -> list of positions


;Body:
(define (tov-maker x delta n)
  (local
    [(define (tov m b x0 delta-x n2 count)
      (cond
        [(= count n2) empty]
        [else (cons (make-posn x0 (+ b (* m x0)))
                    (tov m b (+ x0 delta-x) delta-x n2 (+ 1 count)))]))]
    (lambda (y z) (tov y z x delta n 0))))

;Examples:
(define mytable (tov-maker -2 1.5 5))
(check-expect (mytable 2 1) (list (make-posn -2 -3)
 (make-posn -0.5 0)
 (make-posn 1 3)
 (make-posn 2.5 6)
 (make-posn 4 9)))
(check-expect (mytable 2 2) (list (make-posn -2 -2)
 (make-posn -0.5 1)
 (make-posn 1 4)
 (make-posn 2.5 7)
 (make-posn 4 10)))
;Tests:

(check-expect (mytable 2 1) (list (make-posn -2 -3)
 (make-posn -0.5 0)
 (make-posn 1 3)
 (make-posn 2.5 6)
 (make-posn 4 9)))
(check-expect (mytable 2 2) (list (make-posn -2 -2)
 (make-posn -0.5 1)
 (make-posn 1 4)
 (make-posn 2.5 7)
 (make-posn 4 10)))

