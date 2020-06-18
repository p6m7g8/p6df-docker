######################################################################
#<
#
# Function: p6df::modules::docker::version()
#
#>
######################################################################
p6df::modules::docker::version() { echo "0.0.1" }
######################################################################
#<
#
# Function: p6df::modules::docker::deps()
#
#>
######################################################################
p6df::modules::docker::deps() {
    ModuleDeps=(
   	  akarzim/zsh-docker-aliases
	    robbyrussell/oh-my-zsh:plugins/docker
	    robbyrussell/oh-my-zsh:plugins/docker-compose
    )
}

######################################################################
#<
#
# Function: p6df::modules::docker::external::brew()
#
#>
######################################################################
p6df::modules::docker::external::brew() {

  brew cask install docker
  brew cask install docker-toolbox
  brew install docker-swarm
  brew install docker-compose
  brew install docker-compose-completion
  brew install docker-credential-helper
  brew install docker-credential-helper-ecr
  brew install docker-gen
  brew install docker-ls
  brew install docker-slim
  brew install docker-squash
  brew install  dockerize
}

######################################################################
#<
#
# Function: p6df::modules::docker::home::symlink()
#
#>
######################################################################
p6df::modules::docker::home::symlink() { }

######################################################################
#<
#
# Function: p6df::modules::docker::init()
#
#>
######################################################################
p6df::modules::docker::init() {
}

######################################################################
#<
#
# Function: p6df::prompt::docker::line()
#
#>
######################################################################
p6df::prompt::docker::line() {

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
#>
######################################################################
p6_docker_prompt_info() {

  local str
  if [ -f Dockerfile ]; then
    local cmd=$(egrep '^CMD|^ENTRYPOINT' Dockerfile | head -1)
    str="docker: $cmd"
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
p6_docker_dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }
######################################################################
#<
#
# Function: p6_docker_dzsh()
#
#>
######################################################################
p6_docker_dzsh()  { docker exec -it $(docker ps -aqf "name=$1") zsh;  }