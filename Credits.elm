module End exposing (main)

import Html exposing (Html, text, div, h1, p, ul, li, a, br)
import Html.Attributes exposing (style, href)
import View exposing (container)


main : Html msg
main =
    container
        Nothing
        [ div
            [ style [ ( "margin-top", "3em" ) ] ]
            [ h1 [] [ text "That's it!" ]
            , p []
                [ text "Now you know how to" ]
            , ul
                [ style [ ( "line-height", "2em" ), ( "padding", "0" ) ] ]
                [ li [] [ a [ href "/JsonEncoding.elm" ] [ text "Create JSON in Elm and send it out" ] ]
                , li [] [ a [ href "/JsonDecoding.elm" ] [ text "Parse JSON coming to your Elm app" ] ]
                , li [] [ a [ href "/fun_with_flags.html" ] [ text "Pass init data to your Elm app" ] ]
                , li [] [ a [ href "/ports.html" ] [ text "Work safely with JS libraries" ] ]
                , li [] [ a [ href "/Speakers.elm" ] [ text "Play with fire" ] ]
                ]
            , br [] []
            , p
                []
                [ text "Thank you"
                , br [] []
                , text "Štěpán Pilař & Bea Jakubcová"
                ]
            , p
                []
                [ text "This presentation on "
                , a [ href "https://github.com/EnerfisTeam/prague_elm_meetup_3" ] [ text "GitHub" ]
                , br [] []
                , text "Our blog "
                , a [ href "https://developing.enectiva.cz" ] [ text "Developing Enectiva" ]
                ]
            ]
        ]
        []
