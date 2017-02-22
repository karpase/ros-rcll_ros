(define (domain RCLL)
    (:requirements :typing)
    (:types
      ;COLORS
      base-color - object
      cap-color - object
      ring-color object

      ;ORDERS
      order - object
      ordercomplexityvalue - object
      color - object

      ; MACHINES
      mps - object
      mps-typename - object
      mps-statename - object
      mps-side - object      
      ds-gate - object
      cs-operation - object
      cs-statename - object
    )
    (:constants
        ;COLORS
	RING_BLUE RING_GREEN RING_ORANGE RING_YELLOW - ring-color
        BASE_RED BASE_BLACK BASE_SILVER - base-color
        CAP_BLACK CAP_GREY - cap-color
        
        ;ORDERS
	c0 c1 c2 c3 - ordercomplexityvalue

        ;MACHINES
	 BS - mps-typename
	 CS - mps-typename
	 DS - mps-typename
	 RS - mps-typename
	 IDLE - mps-statename
	 BROKEN - mps-statename
	 PREPARED - mps-statename
	 PROCESSING - mps-statename
	 PROCESSED - mps-statename
	 READY-AT-OUTPUT - mps-statename
	 WAIT-IDLE - mps-statename
	 DOWN - mps-statename
	 INPUT - mps-side
	 OUTPUT - mps-side
	 GATE-1 - ds-gate
	 GATE-2 - ds-gate
	 GATE-3 - ds-gate
	 CS_RETRIEVE - cs-operation
	 CS_MOUNT - cs-operation
    )
    (:functions
      ;ORDERS
      (orderDeliveryBegin ?ord - order)
      (orderDeliveryEnd ?ord - order)
    )
    (:predicates   	
      ;ORDERS
      (orderComplexity ?ord - order ?com - ordercomplexityvalue)
      (orderBaseColor ?ord - order ?col - base-color)
      (orderRing1Color ?ord - order ?col - ring-color)
      (orderRing2Color ?ord - order ?col - ring-color)
      (orderRing3Color ?ord - order ?col - ring-color)
      (orderCapColor ?ord - order ?col - cap-color)
      (orderGate ?ord - order ?gat - ds-gate)
      (orderFilled ?ord - order)

      ;MACHINES
      (mps-type ?m - mps ?t - mps-typename)
      (mps-state ?m - mps ?s - mps-statename)
      (rs-ring-spec ?m - mps ?r - ring-color)
      (cs-can-perform ?m - mps ?op - cs-operation)
      (cs-has-performed ?m - mps ?op - cs-operation)
      (prepared ?m - mps)
    )
    ;ORDERS
    (:action fillOrder
     :parameters (?m - mps ?ord - order)
     :precondition 
       (and (mps-type ?m DS) )
     :effect
       (and 
		(orderFilled ?ord)
	)
    )

    ;MACHINES
    (:action prepare-bs
		:parameters (?m - mps ?side - mps-side ?bc - base-color)
		:precondition (and (mps-type ?m BS) (mps-state ?m IDLE))
		:effect (and (prepared ?m) (mps-state ?m READY-AT-OUTPUT))
    )

    (:action prepare-ds
		:parameters (?m - mps ?gate - ds-gate)
		:precondition (and (mps-type ?m DS) (mps-state ?m IDLE))
		;:precondition (and (mps-type ?m DS))
		:effect (and (prepared ?m) (mps-state ?m PREPARED))
    )

    (:action prepare-cs
		:parameters (?m - mps ?op - cs-operation)
		:precondition (and (mps-type ?m CS) (mps-state ?m IDLE) (cs-can-perform ?m ?op))
		:effect (and (prepared ?m) (mps-state ?m PREPARED) (not (cs-can-perform ?m ?op)) (cs-has-performed ?m ?op))
    )

    (:action prepare-rs
		:parameters (?m - mps ?rc - ring-color)
		:precondition (and (mps-type ?m RS) (mps-state ?m IDLE) (rs-ring-spec ?m ?rc))
		;:precondition (and (mps-type ?m RS) (rs-ring-spec ?m ?rc))
		:effect (and (prepared ?m) (mps-state ?m PREPARED))
    )

    (:action cs-modeswap-retrieved
		:parameters (?m - mps)
		:precondition (cs-has-performed ?m CS_RETRIEVE)
		:effect (and (not (cs-has-performed ?m CS_RETRIEVE)) (cs-can-perform ?m CS_MOUNT))
    )

    (:action cs-modeswap-mounted
		:parameters (?m - mps)
		:precondition (cs-has-performed ?m CS_MOUNT)
		:effect (and (not (cs-has-performed ?m CS_MOUNT)) (cs-can-perform ?m CS_RETRIEVE))
    )


)
