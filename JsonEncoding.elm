module JsonEncoding exposing (main, energyToString)

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
        []


meters : List Meter
meters =
    [ Meter 1 True El (Location "CNGroup" "050")
    , Meter 2 False Wa (Location "CNGroup" "070")
    ]


example : String
example =
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


encodeMeters : List Meter -> String
encodeMeters meters =
    meters
        |> toString


energyToString : Energy -> String
energyToString energy =
    ""
