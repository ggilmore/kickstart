let GitHubActions = (../imports.dhall).GitHubActions

let Setup = ../setup.dhall

in  Setup.MakeJob
      Setup.JobArgs::{
      , name = "dhall-format"
      , additionalSteps =
        [ GitHubActions.Step::{
          , name = Some "Check that dhall files are formatted"
          , run = Some "just format-dhall"
          , env = Some (toMap { CHECK = "true" })
          }
        ]
      }
