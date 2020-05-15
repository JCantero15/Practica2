(define
    (problem BuildingProblem)
    (:domain BuildingDomain)
    (:objects
        n0 n1 n2 n3 n4 n5 - numero
        p0 p1 - persona
        ascensorRapido - ascensorRapido
        ascensorLento - ascensorLento
    )
    (:init
        (personaEn p0 n0)
        (personaEn p0 n0)
        (superior n0 n1) (superior n0 n2) (superior n0 n3) (superior n0 n4) (superior n0 n5)
        (superior n1 n2) (superior n1 n3) (superior n1 n4) (superior n1 n5)
        (superior n2 n3) (superior n2 n4) (superior n2 n5)
        (superior n3 n4) (superior n4 n5)
        (superior n4 n5)

        (= (movimientoLento n0 n1) 2) (= (movimientoLento n0 n2) 3) (= (movimientoLento n0 n3) 4) (= (movimientoLento n0 n4) 5) (= (movimientoLento n0 n5) 6)
        (= (movimientoLento n1 n2) 2) (= (movimientoLento n1 n3) 3) (= (movimientoLento n1 n4) 4) (= (movimientoLento n1 n5) 5)
        (= (movimientoLento n2 n3) 2) (= (movimientoLento n2 n4) 3) (= (movimientoLento n2 n5) 4)
        (= (movimientoLento n3 n4) 2) (= (movimientoLento n3 n5) 3)
        (= (movimientoLento n4 n5) 2)
        (= (movimientoRapido n0 n2 )4)  (? (movimientoRapido n0 n4)8) (= (movimientoRapido n2 n4)4)
        (= (distancia) 0)

        (plantaAscen ascensorRapido n0)
        (plantaAscen ascensorLento n0)
        (numPasajeros ascensorRapido n0)
        (numPasajeros ascensorLento n0)
        (puedellegar ascesorRapido n0) (puedellegar ascesorRapido n2) (puedellegar ascesorRapido n4)
        (puedellegar ascensorLento n0) (puedellegar ascensorLento n1) (puedellegar ascensorLento n2) (puedellegar ascensorLento n3) (puedellegar ascensorLento n4)
    )
    (:goal (and
        (and (personaEn p0 n5) (personaEn p1 n2))
    ))
    
(:metric minimize (distancia)
)
)