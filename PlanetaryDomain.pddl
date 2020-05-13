(define (domain PlanetaryDomain)
    (:requirements :typing :equality :strips :fluents :durative-actions)
    (:types rover posicion)
    (:predicates
    (lugar ?r-rover ?x - posicion)
    (stop ?r - rover)
    (moverse ?x ?y - posicion)
    (estar_en ?r - rover ?x - rover)
    (perforado ?r - rover ?x - posicion)
    (foto_hecha ?r - rover ?x - posicion)
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
      :parameters (?r - rover ?x - posicion)
      :duration (= ?duration 10)
      :condition (and 
          (at start (and
                    (estar_en ?r ?x) (>= (bateria ?r) 10)
                    )
          )
       
          (over all (and
                    (estar_en ?r ?x) 
                    )
          )
      )
      :effect (and 
          (at start (and 
                    (decrease (bateria ?r) 10) (stop ?r)
                    )
          )
          (at end   (and
                    (increase (consumo_bateria ?r) 10) (not(stop ?r)) (perforado ?r ?x) 
                    )
          )
            )
      )
    (:durative-action comunicar
      :parameters (?r - rover ?x - posicion)
      :duration (= ?duration 5)
      :condition (and 
          (at start (and
                    (estar_en ?r ?x) (>= (bateria ?r) 5) 
                    )
          )
      
          (over all (and
                    (estar_en ?r ?x) 
                    )
          )
      )
      :effect (and 
          (at start (and
                    (stop ?r)(decrease (bateria ?r) 5)
                    )
          )
          (at end   (and
                    (increase (consumo_bateria ?r) 5) (not(foto_hecha ?r ?x)) (not(perforado ?r ?x))
                    )
          )
            )
    )
    (:durative-action hacer_foto
      :parameters (?r - rover ?x - posicion)
      :duration (= ?duration 10)
      :condition (and 
          (at start (and
                    (estar_en ?r ?x) (<= (bateria ?r) 10)
                    )
          )
        
          
          (over all (and
                    (estar_en ?r ?x)
                    )
          )
      )
      :effect (and 
          (at start (and 
                    (stop ?r) (decrease (consumo_bateria ?r) 10)
                    )
          )
          (at end (and
                    (not (stop ?r)) (increase (consumo_bateria ?r) 10) (foto_hecha ?r ?x)
                    )
          )
      )
   )
    (:durative-action recargar
      :parameters (?r - rover ?x - posicion)
      :duration (= ?duration 20)
      :condition (and 
          (at start (and
                    (estar_en ?r ?x) (<= (bateria ?r) 20)
                    )
          )
      
          (over all (and
                    (estar_en ?r ?x)
                    )
          )
      )
      :effect (and 
          (at start (and 
                    (stop ?r)
                    )
          )
          (at end   (and
                    (not (stop ?r)) (increase (bateria ?r) 20) 
                    )
          )
        )
    )

)

