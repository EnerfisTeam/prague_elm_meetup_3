port module Ports exposing (main)

import Html exposing (Html, program, text, div, input, h1)
import Html.Attributes exposing (placeholder, style, id)
import Html.Events exposing (onFocus)
import View exposing (container)
import Json.Decode


type alias Model =
    { date : Maybe String
    }


type Msg
    = OpenDatePicker
    | DatePicked String


type alias HtmlId =
    String


port openDatePicker : HtmlId -> Cmd msg


port datePicked : (String -> msg) -> Sub msg


main : Program Never Model Msg
main =
    program
        { init = { date = Nothing } ! []
        , update = update
        , subscriptions = (\_ -> datePicked DatePicked)
        , view = view
        }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OpenDatePicker ->
            model ! [ openDatePicker dateInputId ]

        DatePicked date ->
            { model | date = Just date } ! []


dateInputId : HtmlId
dateInputId =
    "date"


view : Model -> Html Msg
view model =
    let
        picked =
            case model.date of
                Nothing ->
                    "No date picked yet"

                Just date ->
                    "Date picked: " ++ date
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
                , onFocus OpenDatePicker
                , id dateInputId
                ]
                []
            ]
            [ ( "https://elmtown.github.io/2017/05/09/history-in-elm-town-ports-episode-13.html", "History in Elm Town, Ports! - Episode 13" )
            ]


inputStyles : List ( String, String )
inputStyles =
    [ ( "display", "block" ), ( "padding", ".5em" ), ( "margin-top", "1em" ) ]
