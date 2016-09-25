;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a01q4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Ryan Hamin Kim 20623928
;CS116
;Assignment 1 Question 4


;(participation-mark results threshold tutorials_attended)
;  produces the participation grade (as a rational number between 0 and 5,
;  inclusive) earned by	a CS 116 student
;participation-mark: list of simbols Num Num -> Num
;Examples:
(check-expect (participation-mark (list 'correct 'incorrect 'unanswered 'incorrect 'correct
'incorrect 'unanswered) 100 11) 3.6)
(check-expect (participation-mark (list 'correct 'incorrect 'unanswered 'incorrect 'correct
'incorrect 'unanswered) 40 11) 5)

;Body:
(define (participation-mark results threshold tutorials_attended)
  (local
    [(define (convert list)
       (cond
         [(empty? list) empty]
         [(equal? 'correct (first list))
          (cons 2 (convert (rest list)))]
         [(equal? 'incorrect (first list))
          (cons 1 (convert (rest list)))]
         [else (cons 0 (convert (rest list)))]))
     (define (count1 list counter count)
       (cond
         [(equal? counter count) 0]
         [else (+ (first list) (count1 (rest list) (+ 1 counter) count))]))]
    (cond
      [(< 5 (+ (* (/ (count1 (sort (convert results) >) 0 (ceiling
                                                           (* (length results)
                                                              (/ threshold 100))))
                     (* 2 (ceiling
                                   (* (length results) (/ threshold 100))))) 5)
               (* 0.1 tutorials_attended)))
       5]
      [else (+ (* (/ (count1 (sort (convert results) >) 0 (ceiling
                                                           (* (length results)
                                                              (/ threshold 100))))
                     (* 2 (ceiling
                                   (* (length results) (/ threshold 100))))) 5)
               (* 0.1 tutorials_attended))])))


;Tests:
(check-expect (participation-mark (list 'unanswered)  100 10) 1)
(check-expect (participation-mark (list 'unanswered) 100 0) 0)





