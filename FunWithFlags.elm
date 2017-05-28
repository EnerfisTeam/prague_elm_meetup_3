module FunWithFlags exposing (main)

import Html exposing (Html, text, programWithFlags, a, div, h1)
import Html.Attributes exposing (href)
import Types exposing (Meter, Energy(..), Location)
import View exposing (meterList, container)
import Json.Decode
import JsonDecoding exposing (decodeEnergy, metersDecoder)


type alias Model =
    { meters : List Meter
    , locale : String
    }


type alias Flags =
    { meters : Json.Decode.Value
    , locale : String
    }


main : Program Flags Model msg
main =
    programWithFlags
        { init = init
        , update = (\_ model -> model ! [])
        , subscriptions = (\_ -> Sub.none)
        , view = view
        }


init : Flags -> ( Model, Cmd msg )
init flags =
    let
        model =
            { meters = [], locale = flags.locale }
    in
        case Json.Decode.decodeValue metersDecoder flags.meters of
            Ok meters ->
                { model | meters = meters } ! []

            Err err ->
                let
                    _ =
                        Debug.crash err
                in
                    model ! []


view : Model -> Html msg
view model =
    container
        (Just ( "/ports.html", "Ports" ))
        [ h1 [] [ text "Fun with flags" ]
        , meterList model.meters
        ]
