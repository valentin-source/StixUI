curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
source ~/.bashrc
nvm install 11
nvm use 11
git pull https://github.com/valentin-source/StixUI.git
cd ./StixUI/app
npm run build
cd ./build
xdg-open ./index.html
