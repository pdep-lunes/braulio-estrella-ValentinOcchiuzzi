module Lib () where

import Text.Show.Functions ()

doble :: Int -> Int
doble x = x * 2

data Personaje = Personaje {
    nombre :: String,
    poderBasico :: Poder,
    superPoder :: Poder,
    superActiva :: Bool,
    vida :: Int
}

type Poder = Personaje -> Personaje
lluviaDeTuercas :: Poder
torretaCurativa :: Poder
bolaEspinosa :: Poder
granadaDeEspinas :: Poder

lluviaDeTuercas unPersonaje = unPersonaje

torretaCurativa unPersonaje = unPersonaje

bolaEspinosa unPersonaje = unPersonaje

granadaDeEspinas unPersonaje = unPersonaje

pamela :: Personaje
pamela = Personaje {
    nombre = "Pamela",
    poderBasico = lluviaDeTuercas,
    superPoder = torretaCurativa,
    superActiva = False,
    vida = 9600
}

espinas :: Personaje
espinas = Personaje {
    nombre = "Espinas",
    poderBasico = bolaEspinosa,
    superPoder = granadaDeEspinas,
    superActiva = True,
    vida = 4800
}
