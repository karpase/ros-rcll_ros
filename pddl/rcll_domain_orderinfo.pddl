(define (domain RCLL)
    (:requirements :typing)
    (:types
      order - object
      ordercomplexityvalue - object
      color - object
      gate - object
    )
    (:constants
	RING_BLUE RING_GREEN RING_ORANGE RING_YELLOW BASE_RED BASE_BLACK BASE_SILVER CAP_BLACK CAP_GREY - color
	c0 c1 c2 c3 - ordercomplexityvalue
    )
    (:functions
      (orderDeliveryBegin ?ord - order)
      (orderDeliveryEnd ?ord - order)
    )
    (:predicates   	
      (orderComplexity ?ord - order ?com - ordercomplexityvalue)
      (orderBaseColor ?ord - order ?col - color)
      (orderRing1Color ?ord - order ?col - color)
      (orderRing2Color ?ord - order ?col - color)
      (orderRing3Color ?ord - order ?col - color)
      (orderCapColor ?ord - order ?col - color)
      (orderGate ?ord - order ?gat - gate)
      (orderFilled ?ord - order)
    )
    (:action fillOrder
     :parameters (?ord - order)
     :precondition 
       (and )
     :effect
       (and 
		(orderFilled ?ord)
	)
    )
)
