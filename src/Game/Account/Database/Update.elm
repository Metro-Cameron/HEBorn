module Game.Account.Database.Update exposing (update)

import Dict exposing (Dict)
import Json.Decode exposing (Value, decodeValue)
import Utils.Update as Update
import Core.Dispatch as Dispatch exposing (Dispatch)
import Core.Messages as Core
import Utils.Update as Update
import Driver.Websocket.Channels exposing (..)
import Driver.Websocket.Reports as Ws
import Driver.Websocket.Messages as Ws
import Events.Events as Events exposing (Event(Report, AccountEvent))
import Events.Account as AccEv
import Events.Account.Database as DbEv
import Requests.Requests as Requests
import Game.Account.Database.Models exposing (..)
import Game.Account.Database.Messages exposing (..)
import Game.Models as Game


type alias UpdateResponse =
    ( Model, Cmd Msg, Dispatch )


update : Game.Model -> Msg -> Model -> UpdateResponse
update game msg model =
    case msg of
        Event event ->
            updateEvent game event model


updateEvent : Game.Model -> Events.Event -> Model -> UpdateResponse
updateEvent game event model =
    case event of
        AccountEvent (AccEv.DatabaseEvent (DbEv.PasswordAcquired data)) ->
            onPasswordAcquired game data model

        _ ->
            Update.fromModel model


onPasswordAcquired :
    Game.Model
    -> DbEv.PasswordAcquiredData
    -> Model
    -> UpdateResponse
onPasswordAcquired game data model =
    let
        server =
            { password = data.password
            , label = Nothing
            , notes = Nothing
            , virusInstalled = []
            , activeVirus = Nothing
            , type_ = NPC
            , remoteConn = Nothing
            }
    in
        model.servers
            |> Dict.insert data.nip server
            |> (\s -> { model | servers = s })
            |> Update.fromModel