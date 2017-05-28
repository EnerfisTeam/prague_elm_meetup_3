port module Ports exposing (main)

import Html exposing (Html, program, a, text, div, input, br, h1)
import Html.Attributes exposing (href, placeholder, style, id)
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


inputStyles : List ( String, String )
inputStyles =
    [ ( "display", "block" ), ( "padding", ".5em" ), ( "margin-top", "1em" ) ]
