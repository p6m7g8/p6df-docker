######################################################################
#<
#
# Function: p6df::modules::docker::deps()
#
#>
######################################################################
p6df::modules::docker::deps() {
  ModuleDeps=(
    p6m7g8/p6common
    akarzim/zsh-docker-aliases
    ohmyzsh/ohmyzsh:plugins/docker
    ohmyzsh/ohmyzsh:plugins/docker-compose
  )
}

######################################################################
#<
#
# Function: p6df::modules::docker::vscodes()
#
#>
######################################################################
p6df::modules::docker::vscodes() {

  # docker
  code --install-extension ms-azuretools.vscode-docker
}

######################################################################
#<
#
# Function: p6df::modules::docker::external::brew()
#
#>
######################################################################
p6df::modules::docker::external::brew() {

  brew install --cask docker
  brew install --cask docker-toolbox
  brew install docker-compose
  brew install docker-compose-completion
  brew install docker-credential-helper
  brew install docker-credential-helper-ecr
  brew install docker-gen
  brew install docker-ls
  brew install docker-slim
  brew install docker-squash
  brew install dockerize
}

######################################################################
#<
#
# Function: p6df::modules::docker::prompt::line()
#
#>
######################################################################
p6df::modules::docker::prompt::line() {

  p6_docker_prompt_info
}

######################################################################
#<
#
# Function: str str = p6_docker_prompt_info()
#
#  Returns:
#	str - str
#
#  Depends:	 p6_file p6_string
#  Environment:	 CMD RUN
#>
######################################################################
p6_docker_prompt_info() {

  local str
  if p6_file_exists "Dockerfile"; then
    local cmd=$(egrep '^CMD|^ENTRYPOINT' Dockerfile | head -1)
    if p6_string_blank "$cmd"; then
      cmd=$(grep '^RUN' Dockerfile | tail -1)
    fi
    str="docker:   $cmd"
    p6_return_str "$str"
  else
    p6_return_void
  fi
}

######################################################################
#<
#
# Function: p6_docker_dbash()
#
#>
######################################################################
p6_docker_dbash() {

  docker exec -it $(docker ps -aqf "name=$1") bash
}

######################################################################
#<
#
# Function: p6_docker_dzsh()
#
#>
######################################################################
p6_docker_dzsh() {

  docker exec -it $(docker ps -aqf "name=$1") zsh
}
