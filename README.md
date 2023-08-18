# STIX 2.1 Drag and Drop Modeler
# FORK for use with NODE 11 with minor tweaks

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

# All the following is the original README.md file:

![Image of UI](https://github.com/STIX-Modeler/UI/blob/develop/example-stix.png)

There are three, primary technologies used to develop this software. React, MobX (state management) and Webpack. Some level of competence with these tech's will be needed to make code changes. SCSS is heavily integrated to allow granular control of styling the application.

I want to be clear, this is not a tool that is intended to visualize a tremendous amount of nodes. For that, a forced directed graph should be used.

# Definitions

The definitions are a direct copy from the OASIS schemas repository without mutation. Right now these are statically shimmed in. I could see a backend process regularly pulling these into the project.

Reference: https://github.com/oasis-open/cti-stix2-json-schemas/tree/master/schemas/

# Definition Adapters

The definition adapters are a way to mutate the definitions to help control the flow of the visualization. All adapters inherit the Base.js adapter where much of the initial mutating happens.

# Control Property

The control property can be used to help extend custom options to display and/or interact with the properties in the details panel. Some properties default based on their type but if more complex or unique controls are required, the control property is the way to extend functionality.

Current controls:
- hidden: Hides the property in the details panel.
- literal: Outputs values as is with a control or input to edit.
- slider: Custom slider-bar control.
- csv: The csv control will take a comma separated list of values in a text control and split them into an array for the object property values.

    Example: foo,bar will mutate to ["foo", "bar"]

- killchain: Used to select complex arrays.
- externalrefs: Used to build complex objects.
- stringselector: Works like the array selector but only allows for selecting a single value to populate a string.
- textarea: Allows for cleaner input of larger text amounts.

# Hoisting Vocabs

In the definitions specific to an object, I hoist the vocabs onto the property it belongs to. This makes it seamless to pass along to the array control used to select options.

Specific vocab notes

- labels: there are placeholder values located in definition-adapters/Base.js. This can easily be updated to reflect your sharing group or company's standard list for each object or even hidden with the `control` property.

# Usage

Currently, the only usage workflow is via a dev build outlined below. This is simple enough for anyone to perform.
nve is used to change the node version. this isnt necceary if the node version is manually changed to 11.

 - Pull down bits (via fork or clicking download)
 - $ cd app
 - $npm install
 - $npm start

There is a modest production build that is also integrated. This can get a compiled version deployed in a short amount of time.

- $ npm run build

The visualization is supported in the latest versions of Chrome, Firefox and Safari.

A proxy (https://github.com/STIX-Modeler/UI/blob/develop/app/src/stores/Proxy.js) has been shimmed in place to submit data from the UI through any give workflow. This should make integration easier to pick up and run with. Right now, a logger is in place simply logging out the object. Simplly JSON.stingify the object and POST to an endpoint that is waiting for JSON 2.1 data.

# Where do we go from here?

A couple things come to mind. First, Some type of complex Indicator pattern expression builder. In STIX 2.0, this was less complicated since the pattern was just STIX syntax. Now that more pattern types are supported, though more powerful, more complex tooling is needed to support fully developing this feature out.

The second thing that comes to mind, integrating the attack-pattern object with Mitre's CTI repo (https://github.com/mitre/cti).

# Contact

Any questions, I can be reached at jason.minnick@gmail.com
