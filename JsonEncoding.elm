module JsonEncoding exposing (main)

import Html exposing (Html)
import View exposing (triptych, meterList, code)
import Types exposing (Meter, Location, Energy(..))
import Json.Encode


main : Html a
main =
    triptych "Let's encode some JSON!"
        ( "From", meterList meters )
        ( "We want to produce", code example )
        ( "Our work", code (encodeMeters meters) )
        "/JsonDecoding.elm"
        "Now the other way"


meters : List Meter
meters =
    [ Meter 1 True El (Location "A" "050")
    , Meter 2 False Wa (Location "A" "070")
    ]


example : String
example =
    """[
  {
    "id": 1,
    "automatic": true,
    "energy": "el",
    "location": {
      "building": "A",
      "room": "050"
    }
  },
  {
    "id": 2,
    "automatic": false,
    "energy": "wa",
    "location": {
      "building": "A",
      "room": "070"
    }
  }
]"""


encodeMeters : List Meter -> String
encodeMeters meters =
    --toString meters
    meters
        |> List.map encodeMeter
        |> Json.Encode.list
        |> Json.Encode.encode 2


encodeMeter : Meter -> Json.Encode.Value
encodeMeter meter =
    Json.Encode.object
        [ ( "id", Json.Encode.int meter.id )
        , ( "automatic", Json.Encode.bool meter.automatic )
        , ( "energy", Json.Encode.string (energyToString meter.energy) )
        , ( "location", encodeLocation meter.location )
        ]


encodeLocation : Location -> Json.Encode.Value
encodeLocation location =
    Json.Encode.object
        [ ( "building", Json.Encode.string location.building )
        , ( "room", Json.Encode.string location.room )
        ]


energyToString : Energy -> String
energyToString energy =
    case energy of
        El ->
            "el"

        Wa ->
            "wa"
