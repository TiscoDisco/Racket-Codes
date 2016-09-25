;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a01q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))


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
 (list (make-item "Apple Watch" 750)
 (make-item "64-inch HD TV" 1250)
 (make-item "Sphero BB-8 App-Enabled Droid" 190)))
 (make-store "Chapters-Indigo"
 (list (make-item "The Complete Calvin and Hobbes" 132)
 (make-item "Nopi: The Cookbook" 39)))
 (make-store "Lululemon"
 (list (make-item "The Reversible Yoga Mat" 58)))))

; (update-wishlist wishes) produces a value	
;of type Wishlist just like wishes except that all prices
;are rounded to the nearest integer
; update-wishlist: list of stores -> list of stores
;Examples:
(check-expect (update-wishlist my-wishlist) (list
 (make-store "Best Buy"
 (list (make-item "Apple Watch" 750)
 (make-item "64-inch HD TV" 1250)
 (make-item "Sphero BB-8 App-Enabled Droid" 190)))
 (make-store "Chapters-Indigo"
 (list (make-item "The Complete Calvin and Hobbes" 132)
 (make-item "Nopi: The Cookbook" 39)))
 (make-store "Lululemon"
 (list (make-item "The Reversible Yoga Mat" 58)))))
(check-expect (update-wishlist empty) empty)

;Body:
(define (update-wishlist wishes)
  (local
    [(define (update-item list)
       (cond
         [(empty? list) empty]
         [else (cons (make-item (item-title (first list))
                                (round (item-price (first list))))
                     (update-item (rest list)))]))]
    (cond
      [(empty? wishes) empty]
      [else (cons (make-store (store-name (first wishes))
                              (update-item (store-itemlist
                                            (first wishes))))
                  (update-wishlist (rest wishes)))])))

;Tests:
(check-expect (update-wishlist (list
 (make-store "Best Buy"
 (list (make-item "Apple Watch" 750)
 (make-item "64-inch HD TV" 1250)
 (make-item "Sphero BB-8 App-Enabled Droid" 190)))
 (make-store "Chapters-Indigo"
 (list (make-item "The Complete Calvin and Hobbes" 132)
 (make-item "Nopi: The Cookbook" 39)))
 (make-store "Lululemon"
 (list (make-item "The Reversible Yoga Mat" 58)))))(list
 (make-store "Best Buy"
 (list (make-item "Apple Watch" 750)
 (make-item "64-inch HD TV" 1250)
 (make-item "Sphero BB-8 App-Enabled Droid" 190)))
 (make-store "Chapters-Indigo"
 (list (make-item "The Complete Calvin and Hobbes" 132)
 (make-item "Nopi: The Cookbook" 39)))
 (make-store "Lululemon"
 (list (make-item "The Reversible Yoga Mat" 58)))))



                  


