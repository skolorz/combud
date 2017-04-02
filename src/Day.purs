module App.Day where

import Prelude ((+), (-), const, show, ($))
import Data.Eq
import Data.Show
import Pux.Html (Html, div, span, button, text, h2)
import Pux.Html.Events (onClick)
import Data.Array as Array

data Action = Increment | Decrement

data Ride = Morning | Afternoon | Both
newtype Person = Person String 
derive newtype instance eqPerson :: Eq Person
derive newtype instance showPerson :: Show Person

type Squad = Array Person
type DayPlan = { day :: String, morningSquad :: Squad, afternoonSquad :: Squad }
type State = DayPlan

defaultSquad = [Person "Szymon", Person "Tomek", Person "Sylwek"]

init :: State
init = { day: "Dziś, 16 marca", morningSquad: defaultSquad, afternoonSquad: defaultSquad }

showDay :: State -> String
showDay s = s.day

update :: Action -> State -> State
update Increment state = state 
update Decrement state = state

view :: State -> Html Action
view state =
  div
    []
    [ h2 [] [ text $ showDay state ]
    ]
