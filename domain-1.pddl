(define (domain supermarket)
  (:requirements :adl)
  (:types
    location
    aisleCell shelves weighingScale checkoutStand - location
    shopbot item
  )
  (:predicates
    (connected ?from - aisleCell ?to - aisleCell)
    (adjacent ?from - aisleCell ?to - location) 
    (holding ?shopbot - shopbot ?item - item)
    (at-shopbot ?shopbot - shopbot ?cell - aisleCell)
    (weighable ?item - item)
    (weighed ?item - item)
    (in ?item - item ?loc - location) 
    (checkout ?item - item)
  )
  (:constants
    cell1 cell2 cell3 cell4 cell5 cell6 cell7 cell8 cell9 cell10
    cell11 cell12 cell13 cell14 cell15 cell16 cell17 cell18 cell19 cell20 - aisleCell
    shelf1 shelf2 shelf3 shelf4 shelf5 shelf6 shelf7 shelf8 - shelves
    scale - weighingScale
    cs - checkoutStand
  )
  (:action move
    :parameters (?shopbot - shopbot ?from - aisleCell ?to - aisleCell)
    :precondition (and 
    (at-shopbot ?shopbot ?from) 
    (connected ?from ?to))
    :effect (and 
    (at-shopbot ?shopbot ?to) 
    (not (at-shopbot ?shopbot ?from)))
  )
   (:action pickUp
    :parameters (?shopbot - shopbot ?item - item ?from - aisleCell ?loc - location)
    :precondition (and 
    (adjacent ?from ?loc) 
    (in ?item ?loc) (at-shopbot ?shopbot ?from) 
    (not (holding ?shopbot ?item))
    (forall (?otheritems - item) 
    (not (holding ?shopbot ?otheritems))))
    :effect (and (holding ?shopbot ?item) (not (in ?item ?loc)))
  )
  (:action drop
    :parameters (?shopbot - shopbot ?item - item ?from - aisleCell ?loc - location)
    :precondition (and 
    (adjacent ?from ?loc)
    (holding ?shopbot ?item) 
    (at-shopbot ?shopbot ?from) 
    (not (in ?item ?loc)))
    :effect (and (in ?item ?loc) 
    (not (holding ?shopbot ?item)) )
  )
  
  (:action weigh
    :parameters (?shopbot - shopbot ?item - item ?cell - aisleCell ?ws - weighingScale)
    :precondition (and 
    (holding ?shopbot ?item) 
    (at-shopbot ?shopbot ?cell) 
    (adjacent ?cell ?ws)
    (weighable ?item) 
    (not (weighed ?item)))
    :effect (and (weighed ?item) 
    (not (holding ?shopbot ?item)) 
    (in ?item ?ws))
  )
  (:action checkingout
    :parameters (?shopbot - shopbot ?item - item ?cell - aisleCell ?cs - checkoutStand)
    :precondition (and (holding ?shopbot ?item) 
    (at-shopbot ?shopbot ?cell) 
    (adjacent ?cell ?cs) 
    (or (not (weighable ?item))
    (weighed ?item))
)
    :effect (and (checkout ?item) 
    (not (holding ?shopbot ?item)) 
    (in ?item ?cs)
)
  )
)