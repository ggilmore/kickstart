let GitHubActions = (../imports.dhall).GitHubActions

let Setup = ../setup.dhall

in  Setup.MakeJob
      Setup.JobArgs::{
      , name = "Prettier formatting"
      , additionalSteps =
        [ GitHubActions.Step::{
          , name = Some "Check Prettier formatting"
          , run = Some "ci/check-prettier.sh"
          }
        ]
      }
