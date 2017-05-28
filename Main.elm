module Main exposing (..)

import Html exposing (Html, div, h1, a, text)
import Html.Attributes exposing (style, href)
import View exposing (container)


main : Html a
main =
    container Nothing
        [ div [ style [ ( "text-align", "center" ), ("margin-top", "6em")  ] ]
            [ h1 [] [ text "Hello, elmPrague #3!" ]
            , a [ href "/Info.elm" ] [ text "Next ➡" ]
            ]
        ]
