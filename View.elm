module View exposing (triptych, panels, code, meterList, container, logo)

import Html exposing (..)
import Html.Attributes exposing (style, href, src, width)
import Types exposing (Meter)


type alias Section a =
    ( String, Html a )


container : Maybe ( String, String ) -> List (Html a) -> Html a
container linkArgs children =
    let
        link =
            case linkArgs of
                Nothing ->
                    []

                Just ( url, linkText ) ->
                    [ a [ href url, style linkStyles ] [ text (linkText ++ " ➡") ] ]
    in
        div
            [ style
                [ ( "margin", "2em auto" )
                , ( "width", "40em" )
                , ( "font-family", "Open Sans, sans-serif" )
                ]
            ]
            (List.append children link)


linkStyles : List ( String, String )
linkStyles =
    [ ( "display", "inline-block" ), ( "margin", "2em 0 4em 0" ), ( "float", "right" ) ]


triptych : String -> Section a -> Section a -> Section a -> String -> String -> Html a
triptych heading top left right url linkText =
    container
        (Just ( url, linkText ))
        [ h1 [] [ text heading ]
        , panels
            top
            left
            right
        ]


panels : Section a -> Section a -> Section a -> Html a
panels top left right =
    div
        []
        [ section top "100%"
        , div
            [ style [ ( "display", "flex" ) ] ]
            [ section left "50%"
            , section right "50%"
            ]
        ]


section : Section a -> String -> Html a
section ( heading, content ) width =
    div
        [ style [ ( "width", width ) ] ]
        [ h2 [] [ text heading ]
        , content
        ]


meterList : List Meter -> Html a
meterList meters =
    meters
        |> List.map (\m -> li [] [ meter m ])
        |> ul
            [ style [ ( "list-style-type", "none" ), ( "padding", "0" ) ] ]


meter : Meter -> Html a
meter meter =
    dl
        []
        [ dt [] [ text "Id" ]
        , dd [] [ text <| toString meter.id ]
        , dt [] [ text "Automatic" ]
        , dd [] [ text <| toString meter.automatic ]
        , dt [] [ text "Energy" ]
        , dd [] [ text <| toString meter.energy ]
        , dt [] [ text "Location" ]
        , dd [] [ text <| toString meter.location ]
        ]


code : String -> Html a
code str =
    pre
        [ style
            [ ( "overflow", "auto" )
            , ( "padding", "1em 0" )
            ]
        ]
        [ text str ]


logo : List (String, String) -> Html a
logo styles =
    img
        [ src "/img/elm.svg", style styles ]
        []
