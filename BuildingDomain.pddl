(define (domain BuildingDomain)
    (:requirements :typing :equality :strips :fluents :durative-actions)
    (:types ascensor persona numero ascensorRapido ascensorLento - ascensor)
    (:predicates

    )
    (:functions

    )
    
    (:durative-action subirlento
    :parameters(?lift - ascensorLento ?l1 ?l2 - numero)
    :duration()
    :condition()
    :effect()
    )
    
    (:durative-action subirRapido
    :parameters(?lift - ascensorRapido ?l1 ?l2 - numero)
    :duration()
    :condition()
    :effect()
    )

    (:durative-action bajarLento
    :parameters(?lift - ascensorLento ?l1 ?l2 - numero)
    :duration()
    :condition()
    :effect()
    )

    (:durative-action bajarRapido
    :parameters(?lift - ascensorRapido ?l1 ?l2 - numero)
    :duration()
    :condition()
    :effect()
    )
    
    (:durative-action entrar
    :parameters(?p - persona ?lift - ascensor ?l1 ?l2 - numero)
    :duration()
    :condition()
    :effect()
    )

    (:durative-action salir
    :parameters(?p - persona ?lift - ascensor ?l1 ?l2 - numero)
    :duration()
    :condition()
    :effect()
    )

)

