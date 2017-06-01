module Model exposing (Card, CardType(..), Deck)


type CardType
    = Unit
    | Spell
    | Damage


type alias Card =
    { name : String
    , elixirCost : Int
    , thumbnail : String
    , action : CardType
    }


type alias Deck =
    List Card
