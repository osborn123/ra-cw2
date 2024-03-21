(define (problem shopbot-problem)
  (:domain supermarket)
  (:objects
    cabbage potato ice-lolly pizza toothpaste shampoo bread ketchup - item
    scale - weighingScale
    cs - checkoutStand
    shopbot1 shopbot2 - shopbot
    cell1 cell2 cell3 cell4 cell5 cell6 cell7 cell8 cell9 cell10
    cell11 cell12 cell13 cell14 cell15 cell16 cell17 cell18 cell19 cell20 - aisleCell
    shelf1 shelf2 shelf3 shelf4 shelf5 shelf6 shelf7 shelf8 - shelves
    basket1 basket2 - basket
    bs - basketStack
    tu - topUpStation
  )

; i will assume that every robots can pick up all products they want, the only restriction is that the robot can only checkout those in their
; shopping list

  (:init
    (at-shopbot shopbot1 cell20)
    (at-shopbot shopbot2 cell19)

    ; Connections
    (connected cell1 cell2) (connected cell2 cell1)
    (connected cell2 cell3) (connected cell3 cell2)
    (connected cell3 cell5) (connected cell5 cell3)
    (connected cell5 cell6) (connected cell6 cell5)
    (connected cell5 cell12) (connected cell12 cell5)
    (connected cell6 cell7) (connected cell7 cell6)
    (connected cell7 cell8) (connected cell8 cell7)
    (connected cell8 cell13) (connected cell13 cell8)
    (connected cell13 cell18) (connected cell18 cell13)
    (connected cell12 cell15) (connected cell15 cell12)
    (connected cell12 cell11) (connected cell11 cell12)
    (connected cell11 cell10) (connected cell10 cell11)
    (connected cell10 cell9) (connected cell9 cell10)
    (connected cell9 cell4) (connected cell4 cell9)
    (connected cell9 cell14) (connected cell14 cell9)
    (connected cell15 cell16) (connected cell16 cell15)
    (connected cell16 cell17) (connected cell17 cell16)
    (connected cell17 cell19) (connected cell19 cell17)
    (connected cell17 cell18) (connected cell18 cell17)
    (connected cell18 cell20) (connected cell20 cell18)
    (connected cell20 cell19) (connected cell19 cell20)

    ; Adjacencies
    (adjacent cell1 scale) (adjacent cell4 scale)
    (adjacent cell14 cs)
    (adjacent cell16 bs) (adjacent cell19 bs)
    (adjacent cell8 tu)

    (in ice-lolly shelf1) (in pizza shelf2)
    (in cabbage shelf3) (in potato shelf4)
    (in toothpaste shelf5) (in shampoo shelf6)
    (in bread shelf7) (in ketchup shelf8)

    (adjacent cell3 shelf1) (adjacent cell6 shelf1)
    (adjacent cell7 shelf2)
    (adjacent cell1 shelf3) (adjacent cell4 shelf3) (adjacent cell10 shelf3)
    (adjacent cell2 shelf4) (adjacent cell5 shelf4) (adjacent cell11 shelf4)
    (adjacent cell6 shelf5) (adjacent cell12 shelf5) (adjacent cell16 shelf5)
    (adjacent cell7 shelf6) (adjacent cell13 shelf6) (adjacent cell17 shelf6)
    (adjacent cell10 shelf7) (adjacent cell14 shelf7)
    (adjacent cell11 shelf8) (adjacent cell15 shelf8)

    ; Weighable
    (weighable cabbage) (weighable potato)

    ; Baskets
    (in basket1 bs)
    (empty basket1)

    (in basket2 bs)
    (empty basket2)

    (assigned basket1 shopbot1)
    (assigned basket2 shopbot2)

    ; Item prices
    (= (price ice-lolly) 4)
    (= (price pizza) 6)
    (= (price cabbage) 3)
    (= (price potato) 4)
    (= (price toothpaste) 7)
    (= (price shampoo) 9)
    (= (price bread) 5)
    (= (price ketchup) 8)


    ; Item prices
    (= (price ice-lolly) 4)
    (= (price pizza) 6)
    (= (price cabbage) 3)
    (= (price potato) 4)
    (= (price toothpaste) 7)
    (= (price shampoo) 9)
    (= (price bread) 5)
    (= (price ketchup) 8)

    (= (stock ice-lolly) 4)
    (= (stock pizza) 6)
    (= (stock cabbage) 3)
    (= (stock potato) 4)
    (= (stock toothpaste) 7)
    (= (stock shampoo) 9)
    (= (stock bread) 5)
    (= (stock ketchup) 8)

    ; Initial credit balance
    (= (balance shopbot1) 15)
    (= (balance shopbot2) 11)
  )

  (:goal
    (and
    (checkout potato shopbot1) (checkout ketchup shopbot1)
    (checkout toothpaste shopbot1) (checkout pizza shopbot1)

        
    (checkout cabbage shopbot2) (checkout bread shopbot2)
    (checkout ice-lolly shopbot2) (checkout shampoo shopbot2)

    (in basket1 cs) (in basket2 cs)
    )
  )
)