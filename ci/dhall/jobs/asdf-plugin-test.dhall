let GitHubActions = (../imports.dhall).GitHubActions

let Setup = ../setup.dhall

let SetupSteps = Setup.SetupSteps

let Job = Setup.Job

in  Job::{
    , name = Some "asdf plugin test"
    , strategy = Some GitHubActions.Strategy::{
      , matrix = toMap { os = [ "ubuntu-latest", "macos-latest" ] }
      }
    , steps =
          SetupSteps
        # [ GitHubActions.Step::{
            , name = Some "asdf-plugin-test"
            , uses = Some "asdf-vm/actions/plugin-test@v1.0.0"
            , `with` = Some (toMap { command = "just --help" })
            , env = Some
                (toMap { GITHUB_API_TOKEN = "\${{ secrets.GITHUB_TOKEN }}" })
            }
          ]
    }
