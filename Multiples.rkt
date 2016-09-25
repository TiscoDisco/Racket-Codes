;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a02q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))


; (multiples-between a b k) produces a list of values that are multiples of k that
;  are in the range from a to b
;multiples-between: Num Num Num -> list of Num
;Examples:
(check-expect (multiples-between 4 15 3) (list 6 9 12 15))
(check-expect (multiples-between 10 21 45) empty)

;Body:
(define (multiples-between a b k)
  (cond
    [(> a b) empty]
    [(= 0 (remainder a k)) (cons a
                                 (multiples-between (+ 1 a) b k))]
    [else (multiples-between (+ 1 a) b k)]))

;Tests:
(check-expect (multiples-between 1 1 1) (list 1))
(check-expect (multiples-between 1 0 1) empty)
