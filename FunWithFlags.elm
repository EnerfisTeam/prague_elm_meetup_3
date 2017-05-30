module FunWithFlags exposing (main)

import Html exposing (Html, text, program, h1)
import Types exposing (Meter)
import View exposing (meterList, container)
import Json.Decode
import JsonDecoding exposing (metersDecoder)


type alias Model =
    { meters : List Meter
    , locale : String
    }


main : Program Never Model msg
main =
    program
        { init = init
        , update = (\_ model -> model ! [])
        , subscriptions = (\_ -> Sub.none)
        , view = view
        }


init : ( Model, Cmd msg )
init =
    { meters = [], locale = "cs" } ! []


view : Model -> Html msg
view model =
    container
        (Just ( "/ports.html", "Ports" ))
        [ h1 [] [ text ("Fun with flags (in " ++ model.locale ++ ")") ]
        , meterList model.meters
        ]
        []
