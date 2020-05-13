(define
    (problem PlanetaryProblem)
    (:domain PlanetaryDomain)
    (:objects
        rover - rover
        pos1 pos2 pos3 - posicion
    )
    (:init
        (=(bateria rover)50)
        (= (consumo_bateria rover)0)
        (= (distancia pos1 pos2) 5)        
        (= (distancia pos2 pos1) 5) 
        (= (distancia pos1 pos3) 10)        
        (= (distancia pos3 pos1) 10)                
        (= (distancia pos3 pos2) 5)        
        (= (distancia pos2 pos3) 5)
        (moverse pos1 pos2)
        (moverse pos2 pos1) 
        (moverse pos1 pos3)
        (moverse pos3 pos1) 
        (moverse pos3 pos2)
        (moverse pos2 pos3)  
        (estar_en rover pos1)              
    )
    (:goal (and
        (estar_en rover pos3)
        (perforado rover pos1)
        (perforado rover pos3)        
    ))
    
(:metric minimize (consumo_bateria rover))
)