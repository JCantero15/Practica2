(define (domain BuildingDomain)
    (:requirements :typing :equality :strips :fluents :durative-actions)
    (:types ascensor persona numero ascensorRapido ascensorLento - ascensor)
    (:predicates
        (plantaAscen ?ascensor - ascensor ?n - numero)
        (superior ?n1 ?n2 - nuemro)
        (puedellegar ?ascensor - ascensor ?n1 - numero)
    )
    (:functions
        (movimientoRapido ?n1 ?n2 - numero)
        (movimientoLento ?n1 ?n2 - numero)
        (distancia)
    )
    
    (:durative-action subirlento
    :parameters(?ascensor - ascensorLento ?n1 ?n2 - numero)
    :duration(= ?duration (movimientoLento ?n1 ?n2) )
    :condition(and (at start(and (plantaAscen ?ascensor ?n1) (superior ?n1 ?n2) (puedellegar ?ascensor ?n2))))
    :effect(and (at end (and (plantaAscen ?ascensor ?n2 ) (not (plantaAscen ?ascensor ?n1)) (increase (distancia) (movimientoLento ?n1 ?n2)))))
    )
    
    (:durative-action subirRapido
    :parameters(?ascensor - ascensorRapido ?n1 ?n2 - numero)
    :duration(= ?duration (movimientoRapido ?n1 ?n2) )
    :condition(and (at start(and (plantaAscen ?ascensor ?n1) (superior ?n1 ?n2) (puedellegar ?ascensor ?n2))))
    :effect(and (at end (and (plantaAscen ?ascensor ?n2 ) (not (plantaAscen ?ascensor ?n1)) (increase (distancia) (movimientoRapido ?n1 ?n2)))))
    )

    (:durative-action bajarLento
    :parameters(?ascensor - ascensorLento ?l1 ?l2 - numero)
    :duration(= ?duration (movimientoLento ?l2 ?l1) )
    :condition(and (at start(and (plantaAscen ?ascensor ?n2) (superior ?n2 ?n1) (puedellegar ?ascensor ?n1))))
    :effect(and (at end (and (plantaAscen ?ascensor ?n1 ) (not (plantaAscen ?ascensor ?n2)) (increase (distancia) (movimientoLento ?n2 ?n1)))))
    )

    (:durative-action bajarRapido
    :parameters(?ascensor - ascensorRapido ?l1 ?l2 - numero)
    :duration(= ?duration (movimientoRapido ?l1 ?l2) )
    :condition(and (at start(and (plantaAscen ?ascensor ?n2) (superior ?n2 ?n1) (puedellegar ?ascensor ?n1))))
    :effect(and (at end (and (plantaAscen ?ascensor ?n1 ) (not (plantaAscen ?ascensor ?n2)) (increase (distancia) (movimientoRapido ?n2 ?n1)))))
    )
    
    (:durative-action entrar
    :parameters(?p - persona ?ascensor - ascensor ?l1 ?l2 - numero)
    :duration()
    :condition()
    :effect()
    )

    (:durative-action salir
    :parameters(?p - persona ?ascensor - ascensor ?l1 ?l2 - numero)
    :duration()
    :condition()
    :effect()
    )

)

