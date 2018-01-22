module Game.Storyline.Missions.Messages exposing (Msg(..))

import Game.Storyline.Missions.Actions exposing (Action)
import Events.Account.Handlers.StoryStepProceeded as StoryStepProceeded


type Msg
    = HandleActionDone Action
    | HandleStepProceeded StoryStepProceeded.Data
