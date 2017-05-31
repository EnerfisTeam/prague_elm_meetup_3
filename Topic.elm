module Topic exposing (main)

import Html exposing (Html, h1, text)
import Html.Attributes exposing (style)
import View exposing (container)


main : Html a
main =
    container (Just ( "/Context.elm", "Context" ))
        [ h1
            [ style [ ( "font-size", "5em" ), ( "text-align", "center" ), ( "margin", "2em 0 5em 0" ) ] ]
            [ text "Elm + JS(ON)" ]
        ]
        []
