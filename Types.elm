module Types exposing (Meter, Location, Energy(..))


type alias Meter =
    { id : Int
    , automatic : Bool
    , energy : Energy
    , location : Location
    }


type alias Location =
    { building : String
    , room : String
    }


type Energy
    = El
    | Wa
