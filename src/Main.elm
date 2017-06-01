module Main exposing (..)

import Html exposing (Html, button, div, text, h1, h2, p)
import Html.Events exposing (onClick)
import Model
import Data.Cards
import Styles


main =
    Html.beginnerProgram { model = model, view = view, update = update }



--  MODEL


type alias DeckEdition =
    { deck : Model.Deck
    , cardToUse : Maybe Model.Card
    , infoCard : Maybe Model.Card
    }


model : DeckEdition
model =
    { deck = List.take 8 Data.Cards.getAllCards
    , cardToUse = Nothing
    , infoCard = Nothing
    }



--  UPDATE


type Msg
    = Use Model.Card
    | Info Model.Card
    | Replace Model.Card


update : Msg -> DeckEdition -> DeckEdition
update msg model =
    case msg of
        Use card ->
            { model | cardToUse = Just card }

        -- card :: model
        Info card ->
            { model | infoCard = Just card }

        -- Remove code
        --List.filter (\c -> c /= card) model
        Replace card ->
            case model.cardToUse of
                Just value ->
                    { model
                        | deck =
                            (List.map
                                (\c ->
                                    if c /= card then
                                        c
                                    else
                                        value
                                )
                                model.deck
                            )
                        , cardToUse = Nothing
                    }

                Nothing ->
                    model


renderCard card =
    div
        [ Styles.thumbnail ]
        [ text card.name ]


renderDeckedCard card cardToUse =
    let
        displayReplace =
            if cardToUse /= Nothing then
                Styles.block
            else
                Styles.hidden
    in
        div
            [ Styles.thumbnailWithButton ]
            [ renderCard card
            , button [ onClick (Replace card), displayReplace ] [ text "Replace" ]
            ]


renderUnusedCard card hideUse =
    let
        display =
            if hideUse then
                Styles.hidden
            else
                Styles.block
    in
        div
            [ Styles.thumbnailWithButton ]
            [ renderCard card
            , button [ onClick (Use card), display ] [ text "Use" ]
            , button [ onClick (Info card) ] [ text "Info" ]
            ]


renderRow cards deck =
    let
        cardInDeck card =
            List.member card deck
    in
        div
            [ Styles.flex ]
            (List.map (\card -> renderUnusedCard card (cardInDeck card)) cards)


renderUnusedCards divs cards deck =
    let
        row =
            renderRow (List.take 8 cards) deck
    in
        if List.length cards > 0 then
            renderUnusedCards (row :: divs) (List.drop 8 cards) deck
        else
            divs


renderInfo infoCard =
    case infoCard of
        Just card ->
            div []
                [ h2 [] [ text ("Infos : " ++ card.name) ]
                , text ("Elixir : " ++ toString card.elixirCost)
                , text ("Action : " ++ toString card.action)
                ]

        Nothing ->
            div [] []



--  VIEW


view : DeckEdition -> Html Msg
view model =
    div []
        [ div [ Styles.block ]
            [ h1 [] [ text "Battelm Royal" ]
            , h2 [] [ text "Deck" ]
            , div [] (List.map (\card -> renderDeckedCard card model.cardToUse) model.deck)
            ]
        , div []
            [ h2 [] [ text "Available cards" ]
            , div [] (List.reverse (renderUnusedCards [] Data.Cards.getAllCards model.deck))
            ]
        , renderInfo model.infoCard
        ]
