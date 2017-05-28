module Speakers exposing (main)

import Html exposing (Html, program, dl, dt, dd, text, h1)
import View exposing (container)
import Native.Speakers


type alias Model =
    Event


type alias Event =
    { name : String
    , location : String
    , date : String
    }


model : Event
model =
    { name = "Prague Elm meetup"
    , location = "CN Group"
    , date = "Today"
    }


main : Html msg
main =
    container
        (Just ( "/Credits.elm", "Credits" ))
        [ h1 [] [ text "Learning the language" ]
        , eventView model
        ]


eventView : Event -> Html msg
eventView event =
    dl
        []
        [ dt [] [ text <| t "name" ]
        , dd [] [ text event.name ]
        , dt [] [ text <| t "location" ]
        , dd [] [ text event.location ]
        , dt [] [ text <| t "date" ]
        , dd [] [ text event.date ]
        ]


t : String -> String
t v =
    Native.Speakers.t v
