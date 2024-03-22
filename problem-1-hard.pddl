(define (problem supermarket-shopping-hard)
  (:domain supermarket)
  (:objects
    cabbage potato ice-lolly pizza toothpaste shampoo 
    bread ketchup apple orange banana grapes x - item ; x is a dummy item for empty shelves
    scale - weighingScale
    cs - checkoutStand
    shopbot - shopbot
    cell1 cell2 cell3 cell4 cell5 cell6 cell7 cell8 cell9 cell10 
    cell11 cell12 cell13 cell14 cell15 cell16 cell17 cell18 cell19 cell20
    cell21 cell22 cell23 cell24 - aisleCell
    shelf1 shelf2 shelf3 shelf4 shelf5 shelf6 shelf7 shelf8 shelf9 shelf10 shelf11 - shelves
  )
  (:init
    (at-shopbot shopbot cell1)
    ;(at-shopbot shopbot cell1)
    ;(at-shopbot shopbot cell10)

    ; Connected paths, with a few key paths omitted to simulate "busy hours"
    ; Connections
    (connected cell1 cell2) (connected cell2 cell1)
    (connected cell2 cell3) (connected cell3 cell2)
    (connected cell3 cell4) (connected cell4 cell3)
    (connected cell4 cell5) (connected cell5 cell4)
    (connected cell5 cell6) (connected cell6 cell5)
    (connected cell6 cell7) (connected cell7 cell6)
    (connected cell7 cell8) (connected cell8 cell7)
    (connected cell9 cell8) (connected cell8 cell9)
    (connected cell9 cell10) (connected cell10 cell9)
    (connected cell10 cell11) (connected cell11 cell10)
    (connected cell11 cell12) (connected cell12 cell11)
    (connected cell12 cell13) (connected cell13 cell12)
    (connected cell13 cell14) (connected cell14 cell13)
    (connected cell14 cell15) (connected cell15 cell14)
    (connected cell15 cell16) (connected cell16 cell15)
    (connected cell16 cell17) (connected cell17 cell16)
    (connected cell17 cell18) (connected cell18 cell17)
    (connected cell18 cell19) (connected cell19 cell18)
    (connected cell19 cell20) ()
    (connected cell21 cell20) (connected cell20 cell21)
    (connected cell21 cell22) (connected cell22 cell21)
    (connected cell22 cell23) (connected cell23 cell22)
    (connected cell23 cell24) (connected cell24 cell23)
    
    ; Adjacencies
    (adjacent cell2 scale) (adjacent cell4 scale) (adjacent cell14 cs)
    (adjacent cell3 shelf1) (adjacent cell6 shelf1)
    (adjacent cell7 shelf2)
    (adjacent cell1 shelf3) (adjacent cell4 shelf3) (adjacent cell10 shelf3)
    (adjacent cell2 shelf4) (adjacent cell5 shelf4) (adjacent cell11 shelf4)
    (adjacent cell6 shelf5) (adjacent cell12 shelf5) (adjacent cell16 shelf5)
    (adjacent cell7 shelf6) (adjacent cell13 shelf6) (adjacent cell17 shelf6)
    (adjacent cell10 shelf7) (adjacent cell14 shelf7)
    (adjacent cell11 shelf8) (adjacent cell15 shelf8)
    (adjacent cell22 shelf9) (adjacent cell23 shelf10) (adjacent cell24 shelf11)
    
   ; Item locations (ensure items are on shelves where ShopBot can access them)
    (in ice-lolly shelf1) (in pizza shelf2) (in cabbage shelf3)
    (in potato shelf4) (in shampoo shelf6)
    (in ketchup shelf8) (in apple shelf9)
    (in orange shelf10) (in banana shelf11) (in grapes shelf9)
    
    ; Empty shelves represented by dummy item x
    (in x shelf5) (in x shelf7)

    ; Weighable items
    (weighable cabbage) (weighable potato) (weighable apple) (weighable orange)
  )
  (:goal (and
    (checkout potato) (checkout ketchup)
    (checkout pizza) (checkout apple) (checkout orange)
  ))
)
