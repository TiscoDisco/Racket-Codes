;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a02q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))



(define-struct movie (title year length))
;; a Movie is a (make-movie Str Nat Nat) where
;; title is the name of the movie
;; year is the year it was released
;; length is the duration in minutes


;(movie-sorter lom) produces a function that consumes a list of movie, type, and value
; makes a list that consists movies that are in that type and value
;movie-sorter: listofmovie -> listofmovie

;Body:

(define (movie-sorter lom)
  (local
    [(define (movie-sort list type val)
       (cond
         [(equal? type 'year) (year2 list type val)]
         [(equal? type 'title) (title2 list type val)]
         [(equal? type 'length) (length2 list type val)]))
     (define (year2 ylist ytype yval)
       (cond
         [(empty? ylist) empty]
         [(<= yval (movie-year (first ylist)))
          (cons (first ylist) (year2 (rest ylist) ytype yval))]
         [else (year2 (rest ylist) ytype yval)]))
     (define (length2 llist ltype lval)
       (cond
         [(empty? llist) empty]
         [(> lval (movie-length (first llist)))
          (cons (first llist) (length2 (rest llist) ltype lval))]
         [else (length2 (rest llist) ltype lval)]))     
     (define (title2 tlist ttype tval)
       (cond
         [(empty? tlist) empty]
         [(equal? tval (movie-title (first tlist)))
          (cons (first tlist) (title2 (rest tlist) ttype tval))]
         [else (title2 (rest tlist) ttype tval)]))]
    (lambda (sym num) (movie-sort lom sym num))))
;Examples:
(define mvfilter
 (movie-sorter (list (make-movie "Mission Impossible 4" 2011 138)
 (make-movie "Of Mice and Men" 1992 115)
 (make-movie "Avatar" 2009 162))))

(check-expect (mvfilter 'year 2000)  (list (make-movie "Mission Impossible 4" 2011 138)
 (make-movie "Avatar" 2009 162)) )
;Tests:
(check-expect (mvfilter 'length 140) (list (make-movie "Mission Impossible 4" 2011 138)
 (make-movie "Of Mice and Men" 1992 115)))
(check-expect (mvfilter 'title "Avatar")
 (list (make-movie "Avatar" 2009 162))) 

