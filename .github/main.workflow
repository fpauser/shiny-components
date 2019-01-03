workflow "Main" {
  on = "push"
  resolves = ["Deploy"]
}

action "Install" {
  needs = "Master"
  uses = "nuxt/actions-yarn@master"
  args = "install"
}

action "Master" {
  uses = "actions/bin/filter@b2bea07"
  args = "branch master"
}

action "Deploy" {
  uses = "./actions/ember/"
  needs = ["Install"]
  args = "deploy production --verbose"
}
