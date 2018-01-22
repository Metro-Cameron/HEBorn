module Events.Account.Config exposing (..)

import Events.Account.Handlers.ServerPasswordAcquired as ServerPasswordAcquired
import Events.Account.Handlers.StoryStepProceeded as StoryStepProceeded
import Events.Account.Handlers.StoryEmailSent as StoryEmailSent
import Events.Account.Handlers.StoryEmailReplyUnlocked as StoryEmailReplyUnlocked
import Events.Account.Handlers.BankAccountUpdated as BankAccountUpdated
import Events.Account.Handlers.BankAccountClosed as BankAccountClosed
import Events.Account.Handlers.DbAccountUpdated as DbAccountUpdated
import Events.Account.Handlers.DbAccountRemoved as DbAccountRemoved
import Events.Account.Handlers.TutorialFinished as TutorialFinished


type alias Config msg =
    { onServerPasswordAcquired : ServerPasswordAcquired.Data -> msg
    , onStoryStepProceeded : StoryStepProceeded.Data -> msg
    , onStoryEmailSent : StoryEmailSent.Data -> msg
    , onStoryEmailReplyUnlocked : StoryEmailReplyUnlocked.Data -> msg
    , onBankAccountUpdated : BankAccountUpdated.Data -> msg
    , onBankAccountClosed : BankAccountClosed.Data -> msg
    , onDbAccountUpdated : DbAccountUpdated.Data -> msg
    , onDbAccountRemoved : DbAccountRemoved.Data -> msg
    , onTutorialFinished : TutorialFinished.Data -> msg
    }
