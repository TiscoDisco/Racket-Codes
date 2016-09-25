;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a01q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Ryan Hamin Kim 20623928
;CS116
;Assignment 1 Question 3
(define-struct item (title price))
;; An Item is (make-item Str Num)
;; * describes a product (title and price) one might want to buy from a store
;; requires: price > 0
(define-struct store (name itemlist))
;; A Store is (make-store Str (listof Item))
;; requires: itemlist must be non-empty

(define my-wishlist (list
 (make-store "Best Buy"
 (list (make-item "Apple Watch" 750)
 (make-item "64-inch HD TV" 1249.99)
 (make-item "Sphero BB-8 App-Enabled Droid" 189.99)))
 (make-store "Chapters-Indigo"
 (list (make-item "The Complete Calvin and Hobbes" 131.50)
 (make-item "Nopi: The Cookbook" 39.05)))
 (make-store "Lululemon"
 (list (make-item "The Reversible Yoga Mat" 58.00)))))


; (where-to-shop list money) consumes wishes and max price and produces a list of
;   all store names where one can buy at least one item the person has wished for
;   at a price less than or equal to max price
; where-to-shop: list of store Num -> list of string
;Examples:
(check-expect (where-to-shop my-wishlist 45) (list "Chapters-Indigo"))
(check-expect (where-to-shop my-wishlist 10000)
              (list "Best Buy" "Chapters-Indigo" "Lululemon"))
              
;Body:
(define (where-to-shop list money)
  (local
    [(define (price-add store money2)
       (cond
         [(empty? store) false]
         [(>= money (item-price (first store)))
          true]
         [else (price-add (rest store) money2)]))]
    (cond
      [(empty? list) empty]
      [(price-add (store-itemlist (first list)) money)
       (cons (store-name (first list))
             (where-to-shop (rest list) money))]
      [else (where-to-shop (rest list) money)])))

;Tests:
(check-expect (where-to-shop my-wishlist 5000)
              (list "Best Buy" "Chapters-Indigo" "Lululemon"))
(check-expect (where-to-shop empty 1000) empty)
