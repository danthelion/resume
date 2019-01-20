workflow "New workflow" {
  on = "push"
  resolves = ["tag image"]
}

action "build image" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  runs = "build"
  args = "."
}

workflow "New workflow 1" {
  on = "push"
}

action "tag image" {
  uses = "actions/docker/tag@c08a5fc9e0286844156fefff2c141072048141f6"
  needs = ["build image"]
  args = "latextopdf"
}
