(define (domain supermarket)
  (:requirements :adl:fluents)
  (:types
    location aisleCell shelves weighingScale checkoutStand basketStack topUpStation - location
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
    (checkout ?item - item ?shopbot - shopbot) 
    (not-empty-basket ?item - item ?basket - basket)
    (empty ?basket - basket)
    (cell-occupied ?cell - aisleCell)
    
    (assigned ?basket - basket ?shopbot - shopbot)
  )
(:functions
    (price ?item - item)
    (balance ?shopbot - shopbot)
)




  (:constants
    aisleCell - location
    shelves -location
    weighingScale - location
    checkoutStand -location
    basketStack - location;; New constant for basket stack location
    topUpStation - location 
  )
    

    (:action move
    :parameters (?shopbot - shopbot ?from ?to - aisleCell)
    :precondition (and 
                    (at-shopbot ?shopbot ?from) 
                    (connected ?from ?to)
                    (not(cell-occupied ?to ))
                    )
    :effect (and 
              (not (at-shopbot ?shopbot ?from))
              (at-shopbot ?shopbot ?to)
              (forall (?other - shopbot) (when (not (= ?other ?shopbot)) (not(cell-occupied ?to))))
             
              )
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


(:action checkout-item-with-credits
    :parameters (?shopbot - shopbot ?item - item ?basket - basket ?cell - aisleCell ?cs - checkoutStand)
    :precondition (and (not (holding ?shopbot ?basket)) 
                        (not (not-empty-basket ?item ?basket))
                       
                       (at-shopbot ?shopbot ?cell) 
                       (adjacent ?cell ?cs)
                       
                       (>= (balance ?shopbot) (price ?item)))
    :effect (and (checkout ?item ?shopbot )
                 (decrease (balance ?shopbot) (price ?item))
                 (not (not-empty-basket ?item ?basket)))
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
                (empty ?basket)(assigned ?basket ?shopbot))
  )

  
    (:action checkoutWithBasket
    :parameters (?shopbot - shopbot ?basket - basket ?cell - aisleCell ?cs - checkoutStand)
    :precondition (and 
    (holding ?shopbot ?basket) 
    (at-shopbot ?shopbot ?cell) 
    (adjacent ?cell ?cs)
    (assigned ?basket ?shopbot)
    (forall(?item -item)
    (not (not-empty-basket ?item ?basket))))
    :effect (and 
    (not (holding ?shopbot ?basket))
    (not(assigned ?basket ?shopbot))
    (in ?basket ?cs))) 


    (:action top-up-credits
    :parameters (?shopbot - shopbot ?cell - aisleCell ?tu - topUpStation)
    :precondition (and (at-shopbot ?shopbot ?cell) (adjacent ?cell ?tu))
    :effect (increase (balance ?shopbot) 5)
  )

)



