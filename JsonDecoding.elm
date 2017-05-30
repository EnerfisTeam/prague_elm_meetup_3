module JsonDecoding exposing (main, energyDecoder, metersDecoder)

import Html exposing (Html)
import View exposing (triptych, code, meterList)
import Types exposing (Location, Meter, Energy(..))
import Json.Decode


main : Html a
main =
    triptych "Let's decode some JSON!"
        ( "From", code json )
        ( "We want to produce", meterList meters )
        ( "Our work", ourWork )
        "/fun_with_flags.html"
        "Flags"


json : String
json =
    """[
  {
    "id": 1,
    "automatic": true,
    "energy": "el",
    "location": {
      "building": "CNGroup",
      "room": "050"
    }
  },
  {
    "id": 2,
    "automatic": false,
    "energy": "wa",
    "location": {
      "building": "CNGroup",
      "room": "070"
    }
  }
]"""


meters : List Meter
meters =
    [ Meter 1 True El (Location "CNGroup" "050")
    , Meter 2 False Wa (Location "CNGroup" "070")
    ]


ourWork : Html a
ourWork =
    case decodeMeters json of
        Err err ->
            Html.text err

        Ok meters ->
            meterList meters


decodeMeters : String -> Result String (List Meter)
decodeMeters json =
    Json.Decode.decodeString metersDecoder json


metersDecoder : Json.Decode.Decoder (List Meter)
metersDecoder =
    Json.Decode.list meterDecoder


meterDecoder : Json.Decode.Decoder Meter
meterDecoder =
    Json.Decode.map4 Meter
        (Json.Decode.field "id" Json.Decode.int)
        (Json.Decode.field "automatic" Json.Decode.bool)
        (Json.Decode.field "energy" energyDecoder)
        (Json.Decode.field "location" decodeLocation)


energyDecoder : Json.Decode.Decoder Energy
energyDecoder =
    Json.Decode.string
        |> Json.Decode.andThen
            (\s ->
                case s of
                    "el" ->
                        Json.Decode.succeed El

                    "wa" ->
                        Json.Decode.succeed Wa

                    _ ->
                        Json.Decode.fail ("Unrecognized energy " ++ s)
            )


decodeLocation : Json.Decode.Decoder Location
decodeLocation =
    Json.Decode.map2 Location
        (Json.Decode.field "building" Json.Decode.string)
        (Json.Decode.field "room" Json.Decode.string)
