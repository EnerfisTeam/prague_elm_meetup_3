module Context exposing (main)

import Html exposing (Html, div, h1, a, text, img, program)
import Html.Attributes exposing (style, href, src, width)
import Html.Events
import Keyboard
import View exposing (container, logo)


type alias Step =
    Int


type Msg
    = Next
    | Prev
    | Noop


main : Program Never Step Msg
main =
    program
        { init = 1 ! []
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


view : Step -> Html Msg
view step =
    container (Just ( "/JsonEncoding.elm", "Let's generate some JSON in Elm" ))
        [ h1 [] [ text "Context" ]
        , styled
            (List.append [ ( "display", "flex" ) ]
                (dims (tileSize * 4 + gapSize * 3) (tileSize * 3 + gapSize * 2) 0 0)
            )
            [ left step
            , middle step
            , right step
            ]
        ]
        [ ( "https://guide.elm-lang.org/interop/", "Docs on interop" )
        , ( "https://elmtown.github.io/2016/11/07/js-in-elm-town-episode-4.html", "JS in Elm Town" )
        ]


update : Msg -> Step -> ( Step, Cmd Msg )
update msg step =
    case msg of
        Noop ->
            step ! []

        Prev ->
            if step > 1 then
                (step - 1) ! []
            else
                step ! []

        Next ->
            if step < 5 then
                (step + 1) ! []
            else
                step ! []


styled : List ( String, String ) -> List (Html Msg) -> Html Msg
styled styles children =
    div
        [ style styles ]
        children


left : Step -> Html Msg
left step =
    apis step


middle : Step -> Html Msg
middle step =
    styled
        []
        [ elm step
        , jsLibs step
        ]


right : Step -> Html Msg
right step =
    styled
        []
        [ js step
        , server step
        ]


js : Step -> Html Msg
js step =
    img
        [ src "/img/js.svg"
        , style (List.append (dims tileSize tileSize 0 gapSize) (showAtStep 3 step))
        ]
        []


server : Step -> Html Msg
server step =
    img
        [ src "/img/server.svg"
        , style (List.append (dims tileSize tileSize 0 0) (showAtStep 2 step))
        ]
        []


jsLibs : Step -> Html Msg
jsLibs step =
    styled
        (List.append (dims (tileSize * 2 + gapSize) tileSize 0 0) (showAtStep 5 step))
        [ img [ src "/img/lodash.svg", style (dims tileSize tileSize gapSize 0) ] []
        , img [ src "/img/jquery.svg", style (dims tileSize tileSize 0 0) ] []
        ]


apis : Step -> Html Msg
apis step =
    styled
        (List.append (dims tileSize (tileSize * 3 + gapSize * 2) gapSize 0) (showAtStep 4 step))
        [ img [ src "/img/history.svg", style (dims tileSize tileSize 0 gapSize) ] []
        , img [ src "/img/location.svg", style (dims tileSize tileSize 0 gapSize) ] []
        , img [ src "/img/html5.svg", style (dims tileSize tileSize 0 0) ] []
        ]


elm : Step -> Html Msg
elm step =
    logo
        (List.append
            (dims (tileSize * 2 + gapSize) (tileSize * 2 + gapSize) gapSize gapSize)
            (showAtStep 1 step)
        )


dims : Int -> Int -> Int -> Int -> List ( String, String )
dims w h mr mb =
    [ ( "width", (toString w) ++ "em" )
    , ( "height", (toString h) ++ "em" )
    , ( "margin-right", (toString mr) ++ "em" )
    , ( "margin-bottom", (toString mb) ++ "em" )
    ]


showAtStep : Step -> Step -> List ( String, String )
showAtStep limit current =
    let
        opacity =
            if limit <= current then
                "1"
            else
                "0"
    in
        [ ( "transition", "opacity 500ms" ), ( "opacity", opacity ) ]


tileSize : Int
tileSize =
    7


gapSize : Int
gapSize =
    4


subscriptions : Step -> Sub Msg
subscriptions _ =
    Keyboard.ups
        (\code ->
            case code of
                39 ->
                    Next

                37 ->
                    Prev

                _ ->
                    Noop
        )
