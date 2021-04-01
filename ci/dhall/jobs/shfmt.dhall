let GitHubActions = (../imports.dhall).GitHubActions

let Setup = ../setup.dhall

in  Setup.MakeJob
      Setup.JobArgs::{
      , name = "shfmt"
      , additionalSteps =
        [ GitHubActions.Step::{
          , name = Some "Check that scripts are formatted consistently"
          , run = Some "ci/check-shfmt.sh"
          }
        ]
      }
