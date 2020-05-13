(define (domain PlanetaryDomain)
    (:requirements :typing :equality :strips :fluents :durative-actions)
    (:types rover posicion)
    (:predicates
    (lugar ?r-rover ?x - posicion)
    (stop ?r - rover)
    (moverse ?x ?y - posicion)
        (estar_en ?r - rover ?x - rover)
)
    (:functions
    (distancia ?x ?y - posicion)
    (bateria ?r-rover)
    (consumo_bateria ?r - rover)
    )
    (:durative-action velocidad_rapida
      :parameters (?r - rover ?x ?y - position)
      :duration (= ?duration (/(distancia ?x ?y)2))
      :condition (and 
          (at start (and
                    (estar_en ?r ?x) (stop ?r) (>= (bateria ?r) (* (distancia ?x ?y)2 ) )
                    )
          )
        
          
          (over all (and
                    (moverse ?x ?y)
                    )
      ))
      :effect (and 
          (at start (and 
                    (decrease (bateria ?r) (* (distancia ?x ?y) 2)) (not(stop ?r)) (not(estar_en ?r ?x))
                    )
          )
          (at end   (and
                    (estar_en ?r ?y) (stop ?r) (increase (consumo_bateria ?r) (* (distancia ?x ?y) 2))
                    )
          )
      )
   )

    (:durative-action velocidad_normal
      :parameters (?r - rover ?x ?y - position)
      :duration (= ?duration (distancia ?x ?y))
      :condition (and 
          (at start (and
                    (estar_en ?r ?x) (stop ?r) (>= (bateria ?r)  (distancia ?x ?y) )
                    )
          )
        
          
          (over all (and
                    (moverse ?x ?y)
                    )
      ))
      :effect (and 
          (at start (and 
                    (decrease (bateria ?r) (distancia ?x ?y) ) (not(stop ?r)) (not(estar_en ?r ?x))
                    )
          )
          (at end   (and
                    (estar_en ?r ?y) (stop ?r) (increase (consumo_bateria ?r)  (distancia ?x ?y))
                    )
          )
      )
   )

    (:durative-action perforar
      :parameters ()
      :duration ()
      :condition (and 
          (at start (

                    )
          )
        )
          
          (over all (

                    )
          )
    
      :effect (and 
          (at start (and 
                    )
          )
          (at end (and

                    )
          )
      )
   )

    (:durative-action comunicar
      :parameters ()
      :duration ()
      :condition (and 
          (at start (

                    )
          )
        )
          
          (over all (

                    )
          )
    
      :effect (and 
          (at start (and 
                    )
          )
          (at end (and

                    )
          )
      )
   )
    (:durative-action hacer_foto
      :parameters ()
      :duration ()
      :condition (and 
          (at start (

                    )
          )
        )
          
          (over all (

                    )
          )
    
      :effect (and 
          (at start (and 
                    )
          )
          (at end (and

                    )
          )
      )
   )
    (:durative-action recargar
      :parameters ()
      :duration ()
      :condition (and 
          (at start (

                    )
          )
        )
          
          (over all (

                    )
          )
    
      :effect (and 
          (at start (and 
                    )
          )
          (at end (and

                    )
          )
      )
   )

)
