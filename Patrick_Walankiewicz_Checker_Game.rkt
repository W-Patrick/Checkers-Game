;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Patrick_Walankiewicz_Checker_Game) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)


(define CELL-SIZE 30)
(define SIDE 8)
(define BACKGROUND (empty-scene (* CELL-SIZE SIDE) (* CELL-SIZE SIDE)))
(define CHECKER-PIECE (circle (- (/ CELL-SIZE 2) (/ CELL-SIZE 6))
                              'solid
                              'lightblue))
(define CHECKER-PIECE-2 (circle (- (/ CELL-SIZE 2) (/ CELL-SIZE 6))
                                'solid
                                'pink))
(define KING-PIECE (overlay (star (- (/ CELL-SIZE 2) (/ CELL-SIZE 4)) 'solid 'black)
                            CHECKER-PIECE))
(define KING-PIECE-2 (overlay (star (- (/ CELL-SIZE 2) (/ CELL-SIZE 4)) 'solid 'black)
                            CHECKER-PIECE-2))
(define WHITE-BOX (square CELL-SIZE 'solid 'white))
(define BLACK-BOX (square CELL-SIZE 'solid 'black))
(define OUTLINE (square CELL-SIZE 'outline 'black))
(define THICKER (circle (- (/ CELL-SIZE 2) (/ CELL-SIZE 6)) 'outline 'yellow))
(define THICKER2 (circle (- (/ CELL-SIZE 2) (/ CELL-SIZE 5)) 'outline 'yellow))
(define PIECE-OUTLINE (circle (- (/ CELL-SIZE 2) (/ CELL-SIZE 7)) 'outline 'yellow))


(define SELECTED-PIECE (overlay PIECE-OUTLINE
                                THICKER
                                THICKER2
                                CHECKER-PIECE))

(define SELECTED-PIECE-2 (overlay PIECE-OUTLINE
                                  THICKER
                                  THICKER2
                                  CHECKER-PIECE-2))

(define SELECTED-KING-PIECE (overlay PIECE-OUTLINE
                                THICKER
                                THICKER2
                                KING-PIECE))

(define SELECTED-KING-PIECE-2 (overlay PIECE-OUTLINE
                                THICKER
                                THICKER2
                                KING-PIECE-2))

(define (place-image/grid object x-pos y-pos background)
  (place-image
   object
   (+ (* x-pos CELL-SIZE) (/ CELL-SIZE 2))
   (+ (* y-pos CELL-SIZE) (/ CELL-SIZE 2))
   background))


(define (main w)
  (big-bang (make-world
             (make-player1 (list
                            (make-pieces (make-posn 1 0) 0 "no")
                            (make-pieces (make-posn 3 0) 0 "no")
                            (make-pieces (make-posn 5 0) 0 "no")
                            (make-pieces (make-posn 7 0) 0 "no")
                            (make-pieces (make-posn 0 1) 0 "no")
                            (make-pieces (make-posn 2 1) 0 "no")
                            (make-pieces (make-posn 4 1) 0 "no")
                            (make-pieces (make-posn 6 1) 0 "no")
                            (make-pieces (make-posn 1 2) 0 "no")
                            (make-pieces (make-posn 3 2) 0 "no")
                            (make-pieces (make-posn 5 2) 0 "no")
                            (make-pieces (make-posn 7 2) 0 "no")))
             (make-player2 (list
                            (make-pieces (make-posn 0 7) 0 "no")
                            (make-pieces (make-posn 2 7) 0 "no")
                            (make-pieces (make-posn 4 7) 0 "no")
                            (make-pieces (make-posn 6 7) 0 "no")
                            (make-pieces (make-posn 1 6) 0 "no")
                            (make-pieces (make-posn 3 6) 0 "no")
                            (make-pieces (make-posn 5 6) 0 "no")
                            (make-pieces (make-posn 7 6) 0 "no")
                            (make-pieces (make-posn 0 5) 0 "no")
                            (make-pieces (make-posn 2 5) 0 "no")
                            (make-pieces (make-posn 4 5) 0 "no")
                            (make-pieces (make-posn 6 5) 0 "no")))            
             1)            
            [to-draw render]
            [on-tick update]
            [on-mouse change]
            [stop-when stop finish]))

(define WHITE-GRID (list (make-posn 0 0)
                         (make-posn 0 2)
                         (make-posn 0 4)
                         (make-posn 0 6)
                         (make-posn 1 1)
                         (make-posn 1 3)
                         (make-posn 1 5)
                         (make-posn 1 7)
                         (make-posn 2 0)
                         (make-posn 2 2)
                         (make-posn 2 4)
                         (make-posn 2 6)
                         (make-posn 3 1)
                         (make-posn 3 3)
                         (make-posn 3 5)
                         (make-posn 3 7)
                         (make-posn 4 0)
                         (make-posn 4 2)
                         (make-posn 4 4)
                         (make-posn 4 6)
                         (make-posn 5 1)
                         (make-posn 5 3)
                         (make-posn 5 5)
                         (make-posn 5 7)
                         (make-posn 6 0)
                         (make-posn 6 2)
                         (make-posn 6 4)
                         (make-posn 6 6)
                         (make-posn 7 1)
                         (make-posn 7 3)
                         (make-posn 7 5)
                         (make-posn 7 7)))


(define BLACK-GRID (list (make-posn 0 1)
                         (make-posn 0 3)
                         (make-posn 0 5)
                         (make-posn 0 7)
                         (make-posn 1 0)
                         (make-posn 1 2)
                         (make-posn 1 4)
                         (make-posn 1 6)
                         (make-posn 2 1)
                         (make-posn 2 3)
                         (make-posn 2 5)
                         (make-posn 2 7)
                         (make-posn 3 0)
                         (make-posn 3 2)
                         (make-posn 3 4)
                         (make-posn 3 6)
                         (make-posn 4 1)
                         (make-posn 4 3)
                         (make-posn 4 5)
                         (make-posn 4 7)
                         (make-posn 5 0)
                         (make-posn 5 2)
                         (make-posn 5 4)
                         (make-posn 5 6)
                         (make-posn 6 1)
                         (make-posn 6 3)
                         (make-posn 6 5)
                         (make-posn 6 7)
                         (make-posn 7 0)
                         (make-posn 7 2)
                         (make-posn 7 4)
                         (make-posn 7 6)))

(define-struct world [player1 player2 turn])

(define-struct player1 [pieces])

(define-struct player2 [pieces])

(define-struct pieces [posn state king?])

;;;;;;;;;;;;MOUSE-FUNCTION;;;;;;;;;;;;;

;; [world] [Number] [Number] [Mouse-Event] -> [world]
;; Checks whether the player clicked on a piece

(define (change w x y event)
  (cond
    [(and (= (world-turn w) 1)
          (string=? event "button-down")
          (within-range? (player1-pieces (world-player1 w))
                         (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                         (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)))
     (make-world (make-player1 (update-pieces (player1-pieces (world-player1 w)) (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                                              (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)))
                 (world-player2 w)
                 (world-turn w))]
    [(and (= (world-turn w) 2)
          (string=? event "button-down")
          (within-range? (player2-pieces (world-player2 w))
                         (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                         (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)))
     (make-world (world-player1 w)
                 (make-player2 (update-pieces (player2-pieces (world-player2 w)) (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                                              (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)))
                 (world-turn w))]
    [(and (= (world-turn w) 1)
          (string=? event "button-down")
          (ormap (lambda (piece) (and (= (pieces-state piece) 1)
                                      (string=? (pieces-king? piece) "yes"))) (player1-pieces (world-player1 w)))
          (not (ormap (lambda (piece) (and (= (posn-x (pieces-posn piece)) (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)))
                                           (= (posn-y (pieces-posn piece)) (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)))))
                      (player2-pieces (world-player2 w))))                 
          (or (appropriate-spot? (first (selected-piece (player1-pieces (world-player1 w))))
                             (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                             (/ (- y (/ CELL-SIZE 2)) CELL-SIZE))
              (appropriate-spot-2? (first (selected-piece (player1-pieces (world-player1 w))))
                             (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                             (/ (- y (/ CELL-SIZE 2)) CELL-SIZE))))
     (make-world (make-player1 (move-pieces (player1-pieces (world-player1 w)) (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                                            (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)))
                 (world-player2 w)
                 2)]
    [(and (= (world-turn w) 1)
          (string=? event "button-down")
          (ormap (lambda (piece) (= (pieces-state piece) 1)) (player1-pieces (world-player1 w)))
          (not (ormap (lambda (piece) (and (= (posn-x (pieces-posn piece)) (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)))
                                           (= (posn-y (pieces-posn piece)) (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)))))
                      (player2-pieces (world-player2 w))))                 
          (appropriate-spot? (first (selected-piece (player1-pieces (world-player1 w))))
                             (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                             (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)))
     (make-world (make-player1 (move-pieces (player1-pieces (world-player1 w)) (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                                            (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)))
                 (world-player2 w)
                 2)]
    [(and (= (world-turn w) 1)
          (string=? event "button-down")
          (ormap (lambda (piece) (and (= (pieces-state piece) 1)
                                      (string=? (pieces-king? piece) "yes"))) (player1-pieces (world-player1 w)))
          (or (next-to-piece? (first (selected-piece (player1-pieces (world-player1 w)))) (player2-pieces (world-player2 w)))
              (next-to-piece-2? (first (selected-piece (player1-pieces (world-player1 w)))) (player2-pieces (world-player2 w))))
          (not (behind? (append (player1-pieces (world-player1 w)) (player2-pieces (world-player2 w)))
                        (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE))
                        (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE))))
          (or (appropriate-jump? (which-pieces? (first (selected-piece (player1-pieces (world-player1 w)))) (player2-pieces (world-player2 w)))
                             (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                             (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)
                             (first (selected-piece (player1-pieces (world-player1 w)))))
              (appropriate-jump-2? (which-pieces-2? (first (selected-piece (player1-pieces (world-player1 w)))) (player2-pieces (world-player2 w)))
                             (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                             (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)
                             (first (selected-piece (player1-pieces (world-player1 w)))))))
     (make-world (make-player1 (move-pieces (player1-pieces (world-player1 w)) (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                                            (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)))
                 (make-player2 (if (appropriate-jump? (which-pieces? (first (selected-piece (player1-pieces (world-player1 w)))) (player2-pieces (world-player2 w)))
                             (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                             (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)
                             (first (selected-piece (player1-pieces (world-player1 w)))))
                                (remove-piece (player2-pieces (world-player2 w))
                                             (which-pieces? (first (selected-piece (player1-pieces (world-player1 w)))) (player2-pieces (world-player2 w)))
                                             (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                                             (/ (- y (/ CELL-SIZE 2)) CELL-SIZE))
                                (remove-piece-2 (player2-pieces (world-player2 w))
                                             (which-pieces-2? (first (selected-piece (player1-pieces (world-player1 w)))) (player2-pieces (world-player2 w)))
                                             (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                                             (/ (- y (/ CELL-SIZE 2)) CELL-SIZE))))
                     (if (or (= (player1-double w x y) 1)
                             (= (player1-double-2 w x y) 1))
                         1
                         2))]
    [(and (= (world-turn w) 1)
          (string=? event "button-down")
          (ormap (lambda (piece) (= (pieces-state piece) 1)) (player1-pieces (world-player1 w)))
          (next-to-piece? (first (selected-piece (player1-pieces (world-player1 w)))) (player2-pieces (world-player2 w)))
          (not (behind? (append (player1-pieces (world-player1 w)) (player2-pieces (world-player2 w)))
                        (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE))
                        (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE))))
          (appropriate-jump? (which-pieces? (first (selected-piece (player1-pieces (world-player1 w)))) (player2-pieces (world-player2 w)))
                             (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                             (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)
                             (first (selected-piece (player1-pieces (world-player1 w))))))
     (make-world (make-player1 (move-pieces (player1-pieces (world-player1 w)) (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                                            (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)))
                 (make-player2 (remove-piece (player2-pieces (world-player2 w))
                                             (which-pieces? (first (selected-piece (player1-pieces (world-player1 w)))) (player2-pieces (world-player2 w)))
                                             (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                                             (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)))
                 
                     (player1-double w x y))]
    [(and (= (world-turn w) 2)
          (string=? event "button-down")
          (ormap (lambda (piece) (and (= (pieces-state piece) 1)
                                      (string=? (pieces-king? piece) "yes"))) (player2-pieces (world-player2 w)))
          (not (ormap (lambda (piece) (and (= (posn-x (pieces-posn piece)) (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)))
                                           (= (posn-y (pieces-posn piece)) (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)))))
                      (player1-pieces (world-player1 w)))) 
          (or (appropriate-spot? (first (selected-piece (player2-pieces (world-player2 w))))
                               (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                               (/ (- y (/ CELL-SIZE 2)) CELL-SIZE))
              (appropriate-spot-2? (first (selected-piece (player2-pieces (world-player2 w))))
                               (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                               (/ (- y (/ CELL-SIZE 2)) CELL-SIZE))))
     (make-world (world-player1 w)
                 (make-player2 (move-pieces (player2-pieces (world-player2 w)) (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                                            (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)))
                 1)]
    [(and (= (world-turn w) 2)
          (string=? event "button-down")
          (ormap (lambda (piece) (= (pieces-state piece) 1)) (player2-pieces (world-player2 w)))
          (not (ormap (lambda (piece) (and (= (posn-x (pieces-posn piece)) (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)))
                                           (= (posn-y (pieces-posn piece)) (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)))))
                      (player1-pieces (world-player1 w)))) 
          (appropriate-spot-2? (first (selected-piece (player2-pieces (world-player2 w))))
                               (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                               (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)))
     (make-world (world-player1 w)
                 (make-player2 (move-pieces (player2-pieces (world-player2 w)) (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                                            (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)))
                 1)]
    [(and (= (world-turn w) 2)
          (string=? event "button-down")
          (ormap (lambda (piece) (and (= (pieces-state piece) 1)
                                      (string=? (pieces-king? piece) "yes"))) (player2-pieces (world-player2 w)))
          (or (next-to-piece-2? (first (selected-piece (player2-pieces (world-player2 w)))) (player1-pieces (world-player1 w)))
              (next-to-piece? (first (selected-piece (player2-pieces (world-player2 w)))) (player1-pieces (world-player1 w))))
          (not (behind? (append (player1-pieces (world-player1 w))
                                (player2-pieces (world-player2 w)))
                        (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE))
                        (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE))))
          (or (appropriate-jump-2? (which-pieces-2? (first (selected-piece (player2-pieces (world-player2 w)))) (player1-pieces (world-player1 w)))
                             (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                             (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)
                             (first (selected-piece (player2-pieces (world-player2 w)))))
              (appropriate-jump? (which-pieces? (first (selected-piece (player2-pieces (world-player2 w)))) (player1-pieces (world-player1 w)))
                             (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                             (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)
                             (first (selected-piece (player2-pieces (world-player2 w)))))))
      (make-world (make-player1 (if (appropriate-jump-2? (which-pieces-2? (first (selected-piece (player2-pieces (world-player2 w)))) (player1-pieces (world-player1 w)))
                                                         (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                                                         (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)
                                                         (first (selected-piece (player2-pieces (world-player2 w)))))
                                 (remove-piece-2 (player1-pieces (world-player1 w))
                                             (which-pieces-2? (first (selected-piece (player2-pieces (world-player2 w)))) (player1-pieces (world-player1 w)))
                                             (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                                             (/ (- y (/ CELL-SIZE 2)) CELL-SIZE))
                                 (remove-piece (player1-pieces (world-player1 w))
                                             (which-pieces? (first (selected-piece (player2-pieces (world-player2 w)))) (player1-pieces (world-player1 w)))
                                             (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                                             (/ (- y (/ CELL-SIZE 2)) CELL-SIZE))))
                 (make-player2 (move-pieces (player2-pieces (world-player2 w)) (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                                            (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)))
                    (if (or (= (player2-double w x y) 2)
                            (= (player2-double-2 w x y) 2))
                         2
                         1))]
    [(and (= (world-turn w) 2)
          (string=? event "button-down")
          (ormap (lambda (piece) (= (pieces-state piece) 1)) (player2-pieces (world-player2 w)))
          (next-to-piece-2? (first (selected-piece (player2-pieces (world-player2 w)))) (player1-pieces (world-player1 w)))
          (not (behind? (append (player1-pieces (world-player1 w))
                                (player2-pieces (world-player2 w)))
                        (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE))
                        (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE))))
          (appropriate-jump-2? (which-pieces-2? (first (selected-piece (player2-pieces (world-player2 w)))) (player1-pieces (world-player1 w)))
                             (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                             (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)
                             (first (selected-piece (player2-pieces (world-player2 w))))))
     (make-world (make-player1 (remove-piece-2 (player1-pieces (world-player1 w))
                                             (which-pieces-2? (first (selected-piece (player2-pieces (world-player2 w)))) (player1-pieces (world-player1 w)))
                                             (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                                             (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)))
                 (make-player2 (move-pieces (player2-pieces (world-player2 w)) (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)
                                            (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)))
                    (player2-double w x y))]
    [else w]))

;;;;;;;;;;TICK-FUNCTION;;;;;;;;;;;;

(define (update w)
  (cond
    [(= (world-turn w) 2) (make-world
                           (make-player1 (map (lambda (piece) (if (= (posn-y (pieces-posn piece)) 7)
                                                   (make-pieces (pieces-posn piece)
                                                                (pieces-state piece)
                                                                "yes")
                                                   piece)) (player1-pieces (world-player1 w))))
                           (world-player2 w)
                           (world-turn w))]
    [(= (world-turn w) 1) (make-world
                           (world-player1 w)
                           (make-player2 (map (lambda (piece) (if (= (posn-y (pieces-posn piece)) 0)
                                                   (make-pieces (pieces-posn piece)
                                                                (pieces-state piece)
                                                                "yes")
                                                   piece)) (player2-pieces (world-player2 w))))
                           (world-turn w))]
    [else w]))

;;;;;;;;;;GENERAL-FUNCTIONS;;;;;;;;;;;

;; [list-of pieces] [Number] [Number] -> [boolean]
;; Checks to see if any of the pieces were selected
(define (within-range? lop x y)
  (ormap (lambda (piece) (and  (<= x (+ (posn-x (pieces-posn piece)) .3))
                               (>= x (- (posn-x (pieces-posn piece)) .3))
                               (<= y (+ (posn-y (pieces-posn piece)) .3))
                               (>= y (- (posn-y (pieces-posn piece)) .3))))
         
         lop))

;; [list-of pieces] [Number] [Number] -> [boolean]
;; Updates the pieces

(define (update-pieces lop x y)
  (map (lambda (piece) (if (and (<= x (+ (posn-x (pieces-posn piece)) .3))
                                (>= x (- (posn-x (pieces-posn piece)) .3))
                                (<= y (+ (posn-y (pieces-posn piece)) .3))
                                (>= y (- (posn-y (pieces-posn piece)) .3)))
                           (make-pieces (pieces-posn piece) (if (= (pieces-state piece) 1)
                                                                0
                                                                (if (cons? (filter (lambda (piece) (= (pieces-state piece) 1)) lop))
                                                                    0
                                                                    1))
                                        (pieces-king? piece))
                           piece))
       lop))

(define (selected-piece lop)
  (filter (lambda (piece) (= (pieces-state piece) 1)) lop))

(define (move-pieces lop x y)
  (map (lambda (piece) (if (= (pieces-state piece) 1)
                           (make-pieces (make-posn (round x) (round y)) 0 (pieces-king? piece))
                           piece)) lop))

;;;;;;;;;;Player 1;;;;;;;;;;;

(define (appropriate-spot? piece x y)
  (or (and (<= x (+ (posn-x (pieces-posn piece)) 1.3))
           (>= x (+ (posn-x (pieces-posn piece)) .7))
           (<= y (+ (posn-y (pieces-posn piece)) 1.3))
           (>= y (+ (posn-y (pieces-posn piece)) .7)))
      (and (<= x (- (posn-x (pieces-posn piece)) .7))
           (>= x (- (posn-x (pieces-posn piece)) 1.3))
           (<= y (+ (posn-y (pieces-posn piece)) 1.3))
           (>= y (+ (posn-y (pieces-posn piece)) .7)))))

(define (next-to-piece? p lop)
  (ormap (lambda (piece) (appropriate-spot? p (posn-x (pieces-posn piece)) (posn-y (pieces-posn piece)))) lop))

(define (which-pieces? p lop)
  (filter (lambda (piece) (appropriate-spot? p (posn-x (pieces-posn piece)) (posn-y (pieces-posn piece)))) lop))

(define (appropriate-jump? ps x y p)
  (ormap (lambda (piece) (if (< (posn-x (pieces-posn p)) (posn-x (pieces-posn piece)))
                             (and (<= x (+ (posn-x (pieces-posn piece)) 1.3))
           (>= x (+ (posn-x (pieces-posn piece)) .7))
           (<= y (+ (posn-y (pieces-posn piece)) 1.3))
           (>= y (+ (posn-y (pieces-posn piece)) .7)))
                             (and (<= x (- (posn-x (pieces-posn piece)) .7))
           (>= x (- (posn-x (pieces-posn piece)) 1.3))
           (<= y (+ (posn-y (pieces-posn piece)) 1.3))
           (>= y (+ (posn-y (pieces-posn piece)) .7)))))
                             ps))

(define (behind? ps x y)
  (ormap (lambda (piece) (or (and (= (posn-x (pieces-posn piece)) (round x))
                                  (= (posn-y (pieces-posn piece)) (round y)))
                             (> (round x) 7)
                             (< (round x) 0)
                             (> (round y) 7)
                             (< (round y) 0)))
  ps))

(define (remove-piece pieces ps x y)
  (filter (lambda (p) (if (and (member? p ps)
                               (appropriate-spot? p (round x) (round y)))
                          #false
                          #true))
          pieces))

(define (player1-double w x y)
  (if (and (next-to-piece? (make-pieces (make-posn (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)) (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE))) 1 "no")
                                         (player2-pieces (world-player2 w)))
                         (cond
                           [(= 2 (length (which-pieces? (make-pieces (make-posn (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE))
                                                                                (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE))) 1 "no")
                                         (player2-pieces (world-player2 w)))))
                               (or (not (behind? (append (player1-pieces (world-player1 w)) (player2-pieces (world-player2 w)))
                                             (+ (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)) 2)
                                             (+ (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)) 2)))
                                   (not (behind? (append (player1-pieces (world-player1 w)) (player2-pieces (world-player2 w)))
                                             (- (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)) 2)
                                             (+ (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)) 2))))]
                           [(> (posn-x (pieces-posn (first (which-pieces?
                                                            (make-pieces (make-posn (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE))
                                                                                    (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE))) 1 "no")
                                         (player2-pieces (world-player2 w)))))) (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)))
                            (not (behind? (append (player1-pieces (world-player1 w)) (player2-pieces (world-player2 w)))
                                             (+ (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)) 2)
                                             (+ (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)) 2)))]
                           [else (not (behind? (append (player1-pieces (world-player1 w)) (player2-pieces (world-player2 w)))
                                             (- (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)) 2)
                                             (+ (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)) 2)))]))
                         1
                         2))

(define (player1-double-2 w x y)
  (if (and (next-to-piece-2? (make-pieces (make-posn (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)) (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE))) 1 "no")
                                         (player2-pieces (world-player2 w)))
                         (cond
                           [(= 2 (length (which-pieces-2? (make-pieces (make-posn (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE))
                                                                                  (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE))) 1 "no")
                                         (player2-pieces (world-player2 w)))))
                               (or (not (behind? (append (player1-pieces (world-player1 w)) (player2-pieces (world-player2 w)))
                                             (+ (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)) 2)
                                             (- (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)) 2)))
                                   (not (behind? (append (player1-pieces (world-player1 w)) (player2-pieces (world-player2 w)))
                                             (- (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)) 2)
                                             (- (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)) 2))))]
                           [(> (posn-x (pieces-posn (first (which-pieces-2? (make-pieces (make-posn (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE))
                                                                                                    (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE))) 1 "no")
                                         (player2-pieces (world-player2 w)))))) (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)))
                            (not (behind? (append (player1-pieces (world-player1 w)) (player2-pieces (world-player2 w)))
                                             (+ (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)) 2)
                                             (- (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)) 2)))]
                           [else (not (behind? (append (player1-pieces (world-player1 w)) (player2-pieces (world-player2 w)))
                                             (- (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)) 2)
                                             (- (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)) 2)))]))
                         1
                         2))



;;;;;;;;;;Player2;;;;;;;;;;;;

(define (appropriate-spot-2? piece x y)
  (or (and (<= x (+ (posn-x (pieces-posn piece)) 1.3))
           (>= x (+ (posn-x (pieces-posn piece)) .7))
           (<= y (- (posn-y (pieces-posn piece)) .7))
           (>= y (- (posn-y (pieces-posn piece)) 1.3)))
      (and (<= x (- (posn-x (pieces-posn piece)) .7))
           (>= x (- (posn-x (pieces-posn piece)) 1.3))
           (<= y (- (posn-y (pieces-posn piece)) .7))
           (>= y (- (posn-y (pieces-posn piece)) 1.3)))))

(define (next-to-piece-2? p lop)
  (ormap (lambda (piece) (appropriate-spot-2? p (posn-x (pieces-posn piece)) (posn-y (pieces-posn piece)))) lop))

(define (appropriate-jump-2? ps x y p)
  (ormap (lambda (piece) (if (< (posn-x (pieces-posn p)) (posn-x (pieces-posn piece)))
                             (and (<= x (+ (posn-x (pieces-posn piece)) 1.3))
           (>= x (+ (posn-x (pieces-posn piece)) .7))
           (<= y (- (posn-y (pieces-posn piece)) .7))
           (>= y (- (posn-y (pieces-posn piece)) 1.3)))
                             (and (<= x (- (posn-x (pieces-posn piece)) .7))
           (>= x (- (posn-x (pieces-posn piece)) 1.3))
           (<= y (- (posn-y (pieces-posn piece)) .7))
           (>= y (- (posn-y (pieces-posn piece)) 1.3))))) ps))

(define (which-pieces-2? p lop)
  (filter (lambda (piece) (appropriate-spot-2? p (posn-x (pieces-posn piece)) (posn-y (pieces-posn piece)))) lop))

(define (remove-piece-2 pieces ps x y)
  (filter (lambda (p) (if (and (member? p ps)
                               (appropriate-spot-2? p (round x) (round y)))
                          #false
                          #true))
          pieces))

(define (player2-double w x y)
   (if (and (next-to-piece-2? (make-pieces (make-posn (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)) (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE))) 1 "no")
                                              (player1-pieces (world-player1 w)))
                         (cond
                           [(= 2 (length (which-pieces-2? (make-pieces (make-posn (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)) (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE))) 1 "no")
                                         (player1-pieces (world-player1 w)))))
                               (or (not (behind? (append (player1-pieces (world-player1 w)) (player2-pieces (world-player2 w)))
                                             (+ (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)) 2)
                                             (- (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)) 2)))
                                   (not (behind? (append (player1-pieces (world-player1 w)) (player2-pieces (world-player2 w)))
                                             (- (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)) 2)
                                             (- (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)) 2))))]
                           [(> (posn-x (pieces-posn (first (which-pieces-2? (make-pieces (make-posn (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)) (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE))) 1 "no")
                                         (player1-pieces (world-player1 w)))))) (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)))
                            
                            (not (behind? (append (player1-pieces (world-player1 w)) (player2-pieces (world-player2 w)))
                                             (+ (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)) 2)
                                             (- (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)) 2)))]
                           [else (not (behind? (append (player1-pieces (world-player1 w)) (player2-pieces (world-player2 w)))
                                             (- (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)) 2)
                                             (- (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)) 2)))]))
                         2
                         1))

(define (player2-double-2 w x y)
   (if (and (next-to-piece? (make-pieces (make-posn (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)) (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE))) 1 "no")
                                              (player1-pieces (world-player1 w)))
                         (cond
                           [(= 2 (length (which-pieces? (make-pieces (make-posn (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)) (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE))) 1 "no")
                                         (player1-pieces (world-player1 w)))))
                               (or (not (behind? (append (player1-pieces (world-player1 w)) (player2-pieces (world-player2 w)))
                                             (+ (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)) 2)
                                             (+ (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)) 2)))
                                   (not (behind? (append (player1-pieces (world-player1 w)) (player2-pieces (world-player2 w)))
                                             (- (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)) 2)
                                             (+ (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)) 2))))]
                           [(> (posn-x (pieces-posn (first (which-pieces? (make-pieces (make-posn (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)) (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE))) 1 "no")
                                         (player1-pieces (world-player1 w)))))) (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)))        
                            (not (behind? (append (player1-pieces (world-player1 w)) (player2-pieces (world-player2 w)))
                                             (+ (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)) 2)
                                             (+ (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)) 2)))]
                           [else (not (behind? (append (player1-pieces (world-player1 w)) (player2-pieces (world-player2 w)))
                                             (- (round (/ (- x (/ CELL-SIZE 2)) CELL-SIZE)) 2)
                                             (+ (round (/ (- y (/ CELL-SIZE 2)) CELL-SIZE)) 2)))]))
                         2
                         1))

;;;;;;;;Draw Functions;;;;;;;;;;;

(define (draw-white-boxes w bg)
  (local (;[Posn] [Image] -> [Image]
          ;Draws a checker square 
          (define (draw-one box scene)
            (place-image/grid
             WHITE-BOX
             (posn-x box)
             (posn-y box)
             scene)))
    (foldr draw-one bg w)))

(define (draw-black-boxes w bg)
  (local (;[Posn] [Image] -> [Image]
          ;Draws a checker square 
          (define (draw-one box scene)
            (place-image/grid
             BLACK-BOX
             (posn-x box)
             (posn-y box)
             scene)))
    (foldr draw-one bg w)))

(define (render w)
  (local (;[Pieces] [Image] -> [Image]
          ;Draws pieces
          (define (draw-one piece scene)
            (if (string=? "yes" (pieces-king? piece))
                (king-piece piece scene)
                (reg-piece piece scene))))
    (foldr draw-one (draw-player2 w) (player1-pieces (world-player1 w)))))

(define (draw-player2 w)
  (local (;[Pieces] [Image] -> [Image]
          ;Draws pieces
          (define (draw-one piece scene)
           (if (string=? "yes" (pieces-king? piece))
                (king-piece-2 piece scene)
                (reg-piece-2 piece scene))))
    (foldr draw-one (draw-white-boxes WHITE-GRID (draw-black-boxes BLACK-GRID BACKGROUND))
           (player2-pieces (world-player2 w)))))


(define (reg-piece piece scene)
  (if (= 1 (pieces-state piece))
                (place-image/grid
                 SELECTED-PIECE
                 (posn-x (pieces-posn piece))
                 (posn-y (pieces-posn piece))
                 scene)   
                (place-image/grid
                 CHECKER-PIECE
                 (posn-x (pieces-posn piece))
                 (posn-y (pieces-posn piece))
                 scene)))

(define (king-piece piece scene)
  (if (= 1 (pieces-state piece))
                (place-image/grid
                 SELECTED-KING-PIECE
                 (posn-x (pieces-posn piece))
                 (posn-y (pieces-posn piece))
                 scene)   
                (place-image/grid
                 KING-PIECE
                 (posn-x (pieces-posn piece))
                 (posn-y (pieces-posn piece))
                 scene)))

(define (reg-piece-2 piece scene)
            (if (= 1 (pieces-state piece))
                (place-image/grid
                 SELECTED-PIECE-2
                 (posn-x (pieces-posn piece))
                 (posn-y (pieces-posn piece))
                 scene)
                (place-image/grid
                 CHECKER-PIECE-2
                 (posn-x (pieces-posn piece))
                 (posn-y (pieces-posn piece))
                 scene)))

(define (king-piece-2 piece scene)
            (if (= 1 (pieces-state piece))
                (place-image/grid
                 SELECTED-KING-PIECE-2
                 (posn-x (pieces-posn piece))
                 (posn-y (pieces-posn piece))
                 scene)
                (place-image/grid
                 KING-PIECE-2
                 (posn-x (pieces-posn piece))
                 (posn-y (pieces-posn piece))
                 scene)))

;;;;;;;;;;;END-FUNCTIONS;;;;;;;;;;;;;

(define (stop w)
  (or (empty? (player1-pieces (world-player1 w)))
      (empty? (player2-pieces (world-player2 w)))))

(define (finish w)
  (if (empty? (player1-pieces (world-player1 w)))
      (place-image/grid (text "Player 2 Wins!" 25 'black)
                        (- (/ SIDE 2) .5)
                        (- (/ SIDE 2) .5)
                        BACKGROUND)
      (place-image/grid (text "Player 1 Wins!" 25 'black)
                        (- (/ SIDE 2) .5)
                        (- (/ SIDE 2) .5)
                        BACKGROUND)))

(main 0)







