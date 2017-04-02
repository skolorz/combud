module App.Layout where

import App.Day as Day
import App.NotFound as NotFound
import App.Routes (Route(Home, NotFound))
import Prelude (($), map)
import Pux.Html (Html, div, h1, p, text)

data Action
  = Child (Day.Action)
  | PageView Route

type State =
  { route :: Route
  , count :: Day.State }

init :: State
init =
  { route: NotFound
  , count: Day.init }

update :: Action -> State -> State
update (PageView route) state = state { route = route }
update (Child action) state = state { count = Day.update action state.count }

view :: State -> Html Action
view state =
  div
    []
    [ case state.route of
        Home -> map Child $ Day.view state.count
        NotFound -> NotFound.view state
    ]
