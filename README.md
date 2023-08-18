# FORK of STIX 2.1 Drag and Drop Modeler
# for use with NODE 11 with minor tweaks

## to Use:
### Option 1:
use the `prepare.sh` file to install and execute the program and environment. (`sh ./prepare.sh`)


### Option 2
install Node 11 (preferably via Node Version Manager (nvm)
`curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash`
`source ~/.bashrc`
`command -v nvm`
`nvm install 11`
`nvm use 11`
### then change in the 'app' directory:
`npm install`
`npm start`
### alternatively:
`npm run build`
then after changing into the build directory:
`npx http-server`
this only works with some versions of http-server though. 

Alternatively open the index.html file located in the build directory directly in your browser.

### Questions regarding my fork: et99e3bg9@mozmail.com
---

The README.md of the original project by Jason minnick is available here: 
https://github.com/valentin-source/StixUI/blob/develop/README-ORIG.md
