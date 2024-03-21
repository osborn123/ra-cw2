(define (domain supermarket)
  (:requirements :adl)
  (:types
    location aisleCell shelves weighingScale checkoutStand basketStack - location
    shopbot item basket - object
   
  )
 
(:predicates
    (connected ?from - aisleCell ?to - aisleCell)
    (adjacent ?from - aisleCell ?to - location)
    (at-shopbot ?shopbot - shopbot ?cell - aisleCell)
    (holding ?shopbot - shopbot ?obj - basket)
    (weighable ?item - item)
    (weighed ?item - item)
    (in ?obj - object ?loc - location)
    (checkout ?item - item)
    (not-empty-basket ?item - item ?basket - basket)
    (empty ?basket - basket)
  )
  (:constants
    aisleCell - location
    shelves -location
    weighingScale - location
    checkoutStand -location
    basketStack - location;; New constant for basket stack location
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
    :parameters (?shopbot - shopbot ?item - item ?from - aisleCell ?loc - location ?basket - basket)
    :precondition (and 
                    (adjacent ?from ?loc) 
                    (in ?item ?loc) 
                    (at-shopbot ?shopbot ?from)
                    (holding ?shopbot ?basket) 
                    (not (not-empty-basket ?item ?basket)))
    :effect (and (not-empty-basket ?item ?basket) 
        (not (in ?item ?loc)) 
        (not (empty ?basket)))
  )

  (:action drop
    :parameters (?shopbot - shopbot ?item - item ?from - aisleCell ?loc - location ?basket - basket)
    :precondition (and 
        (not-empty-basket ?item ?basket) 
        (at-shopbot ?shopbot ?from) 
        (adjacent ?from ?loc)
        (not (in ?item ?loc)))
    :effect (and (in ?item ?loc) 
    (not (not-empty-basket ?item ?basket)) )
  )

  (:action weigh
    :parameters (?shopbot - shopbot ?item - item ?cell - aisleCell ?ws - weighingScale ?basket - basket)
    :precondition (and (holding ?shopbot ?basket) 
                    (not-empty-basket ?item ?basket) 
                       (at-shopbot ?shopbot ?cell)  
                       (adjacent ?cell ?ws) 
                       (weighable ?item) 
                       (not (weighed ?item)))
    :effect (and (weighed ?item) 
    (not (not-empty-basket ?item ?basket)) 
    (in ?item ?ws))
  )

(:action checkingout
    :parameters (?shopbot - shopbot ?item - item ?cell - aisleCell ?cs - checkoutStand ?basket - basket)
    :precondition (and (in ?item ?cs) 
                    (not (holding ?shopbot ?basket)) 
                    (not (not-empty-basket ?item ?basket))
                       (at-shopbot ?shopbot ?cell) 
                       (adjacent ?cell ?cs)
                       (or (not (weighable ?item)) 
                       (weighed ?item)))
    :effect (and (checkout ?item))
)

  (:action pickUpBasket
    :parameters (?shopbot - shopbot ?basket - basket ?cell - aisleCell ?bs - basketStack)
    :precondition (and 
                    (at-shopbot ?shopbot ?cell) 
                    (adjacent ?cell ?bs) 
                    (in ?basket ?bs)
                    (not (holding ?shopbot ?basket)))
    :effect (and (holding ?shopbot ?basket) 
                (not (in ?basket ?bs)) 
                (empty ?basket))
  )

  
    (:action checkoutWithBasket
    :parameters (?shopbot - shopbot ?basket - basket ?cell - aisleCell ?cs - checkoutStand)
    :precondition (and 
    (holding ?shopbot ?basket) 
    (at-shopbot ?shopbot ?cell) 
    (adjacent ?cell ?cs)
    (forall(?item -item)
    (not (not-empty-basket ?item ?basket))))
    :effect (and 
    
    (not (holding ?shopbot ?basket))
    (in ?basket ?cs))) 

)