apt update -y
echo "\n-----\n"
apt install unzip zip git curl vim zsh ca-certificates gnupg lsb-release -y
echo "\n-----\n"
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "\n-----\n"


rm -rf $HOME/.jenv
git clone https://github.com/jenv/jenv.git ~/.jenv
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(jenv init -)"' >> ~/.zshrc
source ~/.zshrc
echo "\n-- JENV VERSIONS --\n"
jenv versions


echo "\n-- SDKMAN INSTALL --\n"
curl -s "https://get.sdkman.io" | bash
echo 'source "$HOME/.sdkman/bin/sdkman-init.sh"' >> ~/.zshrc
sdk version
source ~/.zshrc


echo "\n-- JAVA INSTALL --\n"
sdk install java 11.0.15-librca
jenv add ~/.sdkman/candidates/java/11.0.15-librca

echo "\n-- MAVEN INSTALL --\n"
sdk install maven


echo "\n-- DOCKER INSTALL --\n"
apt remove docker docker-engine docker.io containerd runc
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

echo '\nalias ports="lsof -nP | grep LISTEN"\n' >> ~/.zshrc
source ~/.zshrc