let GitHubActions = (../imports.dhall).GitHubActions

let Setup = ../setup.dhall

in  Setup.MakeJob
      Setup.JobArgs::{
      , name = "dhall-check"
      , additionalSteps =
        [ GitHubActions.Step::{
          , name = Some "Check that all dhall files typecheck"
          , run = Some "just check-dhall"
          }
        ]
      }
