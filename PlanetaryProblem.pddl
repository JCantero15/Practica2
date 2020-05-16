(define
    (problem PlanetaryProblem)
    (:domain PlanetaryDomain)
    (:objects
        r1 - rover
        pos1 - posicion 
        pos2 - posicion
        pos3 - posicion
    )
    (:init
        (=(bateria r1)30)
        (= (consumo_bateria r1)0)
        (= (distancia pos1 pos2) 5)        
        (= (distancia pos2 pos1) 5) 
        (= (distancia pos1 pos3) 10)        
        (= (distancia pos3 pos1) 10)                
        (= (distancia pos3 pos2) 5)        
        (= (distancia pos2 pos3) 5)
        (estar_en r1 pos1)    
        (moverse pos1 pos2)
        (moverse pos2 pos1) 
        (moverse pos1 pos3)
        (moverse pos3 pos1) 
        (moverse pos3 pos2)
        (moverse pos2 pos3)  
          
    )
    (:goal (and
        (estar_en r1 pos1)
        (foto_hecha r1 pos2)
        (perforado r1 pos2)
        (perforado r1 pos3)        
    ))
    
(:metric minimize (consumo_bateria r1))
)