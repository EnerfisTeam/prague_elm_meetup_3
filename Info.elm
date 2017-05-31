module Info exposing (main)

import Html exposing (Html, div, p, text, strong, a, img)
import Html.Attributes exposing (style, href, alt, src)
import View exposing (container)


main : Html a
main =
    container (Just ( "/Topic.elm", "Topic" ))
        [ div [ style [ ( "font-size", "1.2em" ), ( "margin-top", "5em" ) ] ]
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
                [ img
                    [ src "/img/enectiva.svg"
                    , alt "Enectiva"
                    , style [ ( "width", "100%" ), ( "margin", "2em 0" ) ]
                    ]
                    []
                ]
            ]
        ]
        []
