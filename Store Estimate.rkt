;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a01q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Ryan Hamin Kim 20623928
;; CS116
;;Assignmnet 1 question 1

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

(define my-wishlist2 (list
 (make-store "Best Buy"
 (list (make-item "Apple Watch" 7502)
 (make-item "64-inch HD TV" 1249.99)
 (make-item "Sphero BB-8 App-Enabled Droid" 1891.99)))
 (make-store "Chapters-Indigo"
 (list (make-item "The Complete Calvin and Hobbes" 131.50)
 (make-item "Nopi: The Cookbook" 329.05)))
 (make-store "Lululemon"
 (list (make-item "The Reversible Yoga Mat" 518.00)))))

(define my-wishlist3 (list
 (make-store "Best Buy"
 (list (make-item "Apple Watch" 0)
 (make-item "64-inch HD TV" 0)
 (make-item "Sphero BB-8 App-Enabled Droid" 0)))
 (make-store "Chapters-Indigo"
 (list (make-item "The Complete Calvin and Hobbes" 0)
 (make-item "Nopi: The Cookbook" 0)))
 (make-store "Lululemon"
 (list (make-item "The Reversible Yoga Mat" 0)))))




;; (wishlist-price wishes) produces the total price of the items on the
;;  wishlist
;; wishlist-price: list of stores -> Num
;;Examples:
(check-expect (wishlist-price my-wishlist) 2418.53)
(check-expect (wishlist-price empty) 0)

;Body:
(define (wishlist-price wishes)
  (local
    [(define (price-add store)
       (cond
         [(empty? store) 0]
         [else (+ (item-price (first store))
                  (price-add (rest store)))]))]    
    (cond
      [(empty? wishes) 0]
      [else (+ (price-add (store-itemlist (first wishes)))
             (wishlist-price (rest wishes)))])))

;Tests:
(check-expect (wishlist-price my-wishlist2) 11622.53)
(check-expect (wishlist-price my-wishlist3) 0)




