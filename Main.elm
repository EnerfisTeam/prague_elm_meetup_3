module Main exposing (main)

import Html exposing (Html, div, h1, a, text, img)
import Html.Attributes exposing (style, href, src, width)
import View exposing (container, logo)


main : Html a
main =
    container Nothing
        [ div [ style [ ( "text-align", "center" ), ( "margin-top", "6em" ) ] ]
            [ h1 [] [ text "Hello, elmPrague #3!" ]
            , a [ href "/Info.elm" ] [ logo [ ( "width", "60%" ) ] ]
            ]
        ]
        []
