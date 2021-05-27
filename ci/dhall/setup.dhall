let GitHubActions = (./imports.dhall).GitHubActions

let ASDFSteps =
      [ GitHubActions.Step::{
        , name = Some "Install asdf"
        , uses = Some "asdf-vm/actions/setup@v1.0.1"
        }
      , GitHubActions.Step::{
        , name = Some "Install asdf plugins"
        , run = Some "./ci/asdf-add-plugins.sh"
        }
      , GitHubActions.Step::{
        , name = Some "Install asdf tool versions and packages"
        , run = Some "./ci/asdf-install.sh"
        }
      ]

let Checkout =
      GitHubActions.Step::{
      , name = None Text
      , uses = Some "actions/checkout@v2"
      }

let SetupSteps = [ Checkout ] # ASDFSteps

let Job =
      { Type = GitHubActions.Job.Type
      , default =
          GitHubActions.Job.default
        with runs-on = GitHubActions.RunsOn.Type.`ubuntu-18.04`
        with steps = Some SetupSteps
      }

let JobArgs =
      { Type = { name : Text, additionalSteps : List GitHubActions.Step.Type }
      , default = {=}
      }

let MakeJob
    : ∀(args : JobArgs.Type) → Job.Type
    = λ(args : JobArgs.Type) →
        Job::{
        , name = Some args.name
        , steps = SetupSteps # args.additionalSteps
        }

in  { SetupSteps, Job, ASDFSteps, MakeJob, JobArgs }
