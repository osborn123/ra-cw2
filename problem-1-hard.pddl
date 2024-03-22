(define (problem supermarket-shopping-hard)
  (:domain supermarket)
  (:objects
    cabbage potato ice-lolly pizza toothpaste shampoo bread ketchup
    apple orange banana grapes lettuce tomato cucumber pepper x- item ;x is mean empty shelf
    scale - weighingScale
    cs - checkoutStand
    shopbot  - shopbot ; Adding multiple ShopBots for complexity
    cell1 cell2 cell3 cell4 cell5 cell6 cell7 cell8 cell9 cell10
    cell11 cell12 cell13 cell14 cell15 cell16 cell17 cell18 cell19 cell20
    cell21 cell22 cell23 cell24 cell25 cell26 cell27 cell28 cell29 cell30
    cell31 cell32 cell33 cell34 cell35 - aisleCell
    shelf1 shelf2 shelf3 shelf4 shelf5 shelf6 shelf7 shelf8
    shelf9 shelf10 shelf11 shelf12 shelf13 shelf14 shelf15 - shelves
  )
  (:init
    (at-shopbot shopbot cell1)
  

    ; Connected paths extended for additional cells
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
    (connected cell19 cell20) (connected cell20 cell19)
    (connected cell21 cell20) (connected cell20 cell21)
    (connected cell21 cell22) (connected cell22 cell21)
    (connected cell22 cell23) (connected cell23 cell22)
    (connected cell23 cell24) (connected cell24 cell23)
    (connected cell24 cell25) (connected cell25 cell24)
    (connected cell25 cell26) (connected cell26 cell25)
    (connected cell26 cell27) (connected cell27 cell26)
    (connected cell27 cell28) (connected cell28 cell27)
    (connected cell28 cell29) (connected cell29 cell28)
    (connected cell29 cell30) (connected cell30 cell29)
    (connected cell30 cell31) (connected cell31 cell30)
    (connected cell31 cell32) (connected cell32 cell31)
    (connected cell32 cell33) (connected cell33 cell32)
    (connected cell33 cell34) (connected cell34 cell33)
    (connected cell34 cell35) (connected cell35 cell34)
  
    ; Adjacencies for additional shelves
    ; [Existing adjacencies are defined above]
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
    (adjacent cell26 shelf12) (adjacent cell29 shelf12)
    (adjacent cell27 shelf13) (adjacent cell28 shelf13)
    (adjacent cell30 shelf14) (adjacent cell31 shelf14)
    (adjacent cell32 shelf15) (adjacent cell33 shelf15)
    
    ; Item locations for additional items
    (in lettuce shelf12) (in tomato shelf13) (in cucumber shelf34)
    (in pepper shelf27) (in cabbage shelf31) (in potato shelf29)
    (in ice-lolly shelf3) (in pizza shelf4) (in toothpaste shelf5)
    (in shampoo shelf6) (in bread shelf7) (in ketchup shelf8)
    (in apple shelf9) (in orange shelf18) (in banana shelf11)
    (in grapes shelf12) 
    
    (in x shelf15)(in x shelf24) (in x shelf33)(in x shelf35)  
    ; Weighable items extended
    (weighable lettuce) (weighable tomato) (weighable cucumber) (weighable pepper)
    
    ; Goal extended to include additional items
  )
  (:goal (and
    (checkout potato) (checkout ketchup) (checkout pizza)
    (checkout apple) (checkout orange) (checkout lettuce) (checkout tomato)
  ))
)






 
    
    