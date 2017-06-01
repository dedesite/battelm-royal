module Styles exposing (block, flex, hidden, thumbnail, thumbnailWithButton)

import Html.Attributes exposing (style)


block =
    style
        [ ( "display", "inline-block" )
        ]


flex =
    style
        [ ( "display", "flex" )
        ]


hidden =
    style
        [ ( "display", "none" )
        ]


thumbnailWithButton =
    style
        [ ( "float", "left" )
        ]


thumbnail =
    style
        [ ( "background", "#ecf0f1" )
        , ( "border", "0" )
        , ( "color", "#34495f" )
        , ( "cursor", "pointer" )
        , ( "text-align", "center" )
        , ( "-webkit-user-select", "none" )
        , ( "display", "block" )

        --, ("float",  "left")
        , ( "font-family", "Helvetica, Arial, sans-serif" )
        , ( "font-size", "16px" )
        , ( "font-weight", "300" )
        , ( "height", "60px" )
        , ( "line-height", "30px" )
        , ( "margin", "20px 20px 0 0" )
        , ( "outline", "none" )
        , ( "padding", "0" )
        , ( "width", "60px" )
        ]
