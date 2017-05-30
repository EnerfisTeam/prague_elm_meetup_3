module Ports exposing (main)

import Html exposing (Html, program, text, div, input, h1)
import Html.Attributes exposing (placeholder, style, id)
import Html.Events exposing (onFocus)
import View exposing (container)
import Json.Decode


type alias Model =
    { date : Maybe String
    }


type Msg
    = Noop


type alias HtmlId =
    String


main : Program Never Model Msg
main =
    program
        { init = { date = Nothing } ! []
        , update = update
        , subscriptions = (\_ -> Sub.none)
        , view = view
        }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    model ! []


dateInputId : HtmlId
dateInputId =
    "date"


view : Model -> Html Msg
view model =
    let
        picked =
            "No date picked yet"
    in
        container
            (Just ( "/Speakers.elm", "Native" ))
            [ h1 [] [ text "Set sail!" ]
            , div
                []
                [ text picked ]
            , input
                [ placeholder "Select a date"
                , style inputStyles
                , id dateInputId
                ]
                []
            ]
            [ ( "https://elmtown.github.io/2017/05/09/history-in-elm-town-ports-episode-13.html", "History in Elm Town, Ports! - Episode 13" )
            ]


inputStyles : List ( String, String )
inputStyles =
    [ ( "display", "block" ), ( "padding", ".5em" ), ( "margin-top", "1em" ) ]
