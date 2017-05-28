module Info exposing (main)

import Html exposing (Html, div, p, text, strong, a, img)
import Html.Attributes exposing (style, href, alt, src)
import View exposing (container)


main : Html a
main =
    container Nothing
        [ div [ style [ ( "font-size", "1.2em" ), ( "margin-top", "3em" ) ] ]
            [ p []
                [ text "We are "
                , strong [] [ text "Štěpán Pilař" ]
                , text " & "
                , strong [] [ text "Bea Jakubcová" ]
                ]
            , p []
                [ text "We work at "
                , a
                    [ href "http://www.enerfis.cz/en/" ]
                    [ text "Enerfis" ]
                , text " and develop an on-line energy monitoring solution"
                ]
            , a
                [ href "https://www.enectiva.cz/en/about-enectiva" ]
                [ img [ src "enectiva.png", alt "Enectiva" ] [] ]
            , p []
                [ a
                    [ href "/JsonEncoding.elm"
                    , style [ ( "float", "right" ), ( "margin-top", "3em" ), ( "display", "inline-block" ) ]
                    ]
                    [ text "Let's generate some JSON in Elm ➡" ]
                ]
            ]
        ]
