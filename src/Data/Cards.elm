module Data.Cards exposing (getAllCards)

import Model exposing (Card)


getAllCards =
    [ Card "Witch" 4 "witch" Model.Unit
    , Card "Wizard" 4 "wizard" Model.Unit
    , Card "Arrows" 3 "arrows" Model.Damage
    , Card "Speed Potion" 2 "speed_potion" Model.Spell
    , Card "Knight" 3 "knight" Model.Unit
    , Card "Goblin" 2 "goblin" Model.Unit
    , Card "Archer" 3 "archer" Model.Unit
    , Card "Prince" 5 "prince" Model.Unit
    , Card "Skeleton Army" 3 "skeleton_army" Model.Unit
    , Card "Gargouille" 3 "gargouille" Model.Unit
    , Card "Ork" 2 "ork" Model.Unit
    , Card "Corsair" 4 "corsair" Model.Unit
    , Card "Fireball" 4 "fireball" Model.Spell
    ]
