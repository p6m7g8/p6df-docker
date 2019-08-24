p6df::modules::docker::version() { echo "0.0.1" }
p6df::modules::docker::deps() {
    ModuleDeps=(
	akarzim/zsh-docker-aliases
	robbyrussell/oh-my-zsh:plugins/docker
	robbyrussell/oh-my-zsh:plugins/docker-compose
    )
}

p6df::modules::docker::external::brew() {

    local formulae
    for formulae in $(brew search docker |egrep -v 'Formulae|Casks'  |sort -u); do
	brew install $formulae
    done

    for formulae in $(brew search docker |egrep -v 'Formulae|Casks'  |sort -u); do
	brew cask install $formulae
    done
}

p6df::modules::docker::home::symlink() { }

p6df::modules::docker::init() {
}

p6df::prompt::docker::line() {

    if [ -f Dockerfile ]; then
	local cmd=$(grep ^CMD Dockerfile | head -1)
	echo "docker: $cmd"
    fi
}

p6_docker_dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }
p6_docker_dzsh()  { docker exec -it $(docker ps -aqf "name=$1") zsh;  }
