module Speakers exposing (main)

import Html exposing (Html, dl, dt, dd, text, h1)
import View exposing (container)
import Types exposing (Meter, Energy(..))
import JsonEncoding exposing (energyToString)
import Native.Speakers


type alias Model =
    Meter


model : Meter
model =
    { id = 42
    , automatic = True
    , location =
        { building = "CNGroup"
        , room = "050"
        }
    , energy = El
    }


main : Html msg
main =
    container
        (Just ( "/Credits.elm", "Credits" ))
        [ h1 [] [ text "Learning the language" ]
        , eventView model
        ]


eventView : Meter -> Html msg
eventView meter =
    dl
        []
        [ dt [] [ text <| t "id" ]
        , dd [] [ text <| toString meter.id ]
        , dt [] [ text <| t "energy" ]
        , dd [] [ text <| t <| energyToString meter.energy ]
        , dt [] [ text <| t "location" ]
        , dd [] [ text (meter.location.building ++ ", " ++ meter.location.room) ]
        ]


t : String -> String
t v =
    Native.Speakers.t v
