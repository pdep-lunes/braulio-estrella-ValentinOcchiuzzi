module Lib () where

import Text.Show.Functions ()

type Poder = Personaje -> Personaje
data Personaje = Personaje {
    nombre :: String,
    poderBasico :: Poder,
    superPoder :: Poder,
    superActiva :: Bool,
    vida :: Int
} deriving Show

--PODERES
bolaEspinosa :: Poder
bolaEspinosa contrincante = contrincante {vida = max (vida contrincante - 1000) 0} 

lluviaDeTuercas :: String -> Personaje -> Personaje
lluviaDeTuercas "sanadora" unPersonaje = unPersonaje {vida = vida unPersonaje + 800}
lluviaDeTuercas "dañina" unPersonaje = unPersonaje {vida = div (vida unPersonaje) 2}
  
torretaCurativa :: Poder
torretaCurativa aliado = aliado {vida = 2*vida aliado, superActiva = True}

granadaDeEspinas :: Int -> Personaje -> Personaje
granadaDeEspinas radio contrincante
  |radio > 3 && estaEnLasUltimas contrincante = espinasEstuvoAqui contrincante {superActiva = False, vida = 0}
  |radio > 3 = espinasEstuvoAqui contrincante 
  |otherwise = bolaEspinosa contrincante

espinasEstuvoAqui :: Poder
espinasEstuvoAqui personaje = personaje {nombre = nombre personaje ++ " Espinas estuvo aqui"}

estaEnLasUltimas :: Personaje -> Bool
estaEnLasUltimas unPersonaje = vida unPersonaje < 800

--REPORTES
atacarConPoderEspecial :: Personaje -> Personaje -> Personaje
atacarConPoderEspecial unPersonaje contrincante
  | superActiva unPersonaje = poderBasico unPersonaje . superPoder unPersonaje $ contrincante
  | otherwise = contrincante

estanEnLasUltimas :: [Personaje] -> [String]
estanEnLasUltimas personajes = map nombre (filter estaEnLasUltimas personajes)

--PERSONAJES
personajes :: [Personaje]
personajes = [pamela, espinas]

pamela :: Personaje
pamela = Personaje {
    nombre = "Pamela",
    poderBasico = lluviaDeTuercas "sanadora",
    superPoder = torretaCurativa,
    superActiva = False,
    vida = 9600
}

espinas :: Personaje
espinas = Personaje {
    nombre = "Espinas",
    poderBasico = bolaEspinosa,
    superPoder = granadaDeEspinas 5,
    superActiva = True,
    vida = 4800
}
