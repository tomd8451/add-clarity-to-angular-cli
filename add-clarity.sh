#!/bin/bash

# Add Clarity dependencies to YARN
YARN add clarity dependencies
yarn add @clr/icons
yarn add @webcomponents/custom-elements@1.0.0
yarn add @clr/ui
yarn add @clr/angular

# Clarity Scripts for .angular-cli.json
SCRIPTS_LINE="      \"scripts\": [?"
SCRIPTS_LINE="$SCRIPTS_LINE        \"..\/node_modules\/@clr\/icons\/clr-icons.min.css\",?"
SCRIPTS_LINE="$SCRIPTS_LINE        \"..\/node_modules\/@webcomponents\/custom-elements\/custom-elements.min.js\",\?"
SCRIPTS_LINE="$SCRIPTS_LINE        \"..\/node_modules\/@clr\/icons\/clr-icons.min.js\"?"
SCRIPTS_LINE="$SCRIPTS_LINE      ],"

# Clarity css for .angular-cli.json
CSS_LINE="      \"styles\": [?"
CSS_LINE="$CSS_LINE        \"..\/node_modules\/@clr\/icons\/clr-icons.min.css\",?"
CSS_LINE="$CSS_LINE        \"..\/node_modules\/@clr\/ui\/clr-ui.min.css\","

# Backup the files we're manipulating
cp .angular-cli.json .angular-cli.json_bak
cp src/app/app.component.html src/app/app.component.html_bak

# Remove the . from .angular-cli.json while we work on it
cp .angular-cli.json angular-cli.json

# Add the scripts to .angular-cli.json
sed "24s/.*/${SCRIPTS_LINE}/" angular-cli.json > new_angular-cli.json
tr ? '\n' < new_angular-cli.json > angular-cli.json

# Add the css to .angular-cli.json
sed "21s/.*/${CSS_LINE}/" angular-cli.json > new_angular-cli.json
tr ? '\n' < new_angular-cli.json > angular-cli.json

# add the . back into .angular-cli.json
mv angular-cli.json .angular-cli.json

# New app.component.html template making use of clarity classes
APP_COMPONENT_LINE="<div class=\"main-container\">"
APP_COMPONENT_LINE="$APP_COMPONENT_LINE?    <div class=\"alert alert-app-level\">?"
APP_COMPONENT_LINE="$APP_COMPONENT_LINE?    </div>"
APP_COMPONENT_LINE="$APP_COMPONENT_LINE?    <header class=\"header header-6\">"
APP_COMPONENT_LINE="$APP_COMPONENT_LINE?        <div class=\"branding\">"
APP_COMPONENT_LINE="$APP_COMPONENT_LINE?            <span class=\"title\">{{ title }}</span>"
APP_COMPONENT_LINE="$APP_COMPONENT_LINE?        </div>"
APP_COMPONENT_LINE="$APP_COMPONENT_LINE?    </header>"
APP_COMPONENT_LINE="$APP_COMPONENT_LINE?    <div class=\"content-container\">"
APP_COMPONENT_LINE="$APP_COMPONENT_LINE?        <div class=\"content-area\">"
APP_COMPONENT_LINE="$APP_COMPONENT_LINE?        <p>Your content will go here</p>"
APP_COMPONENT_LINE="$APP_COMPONENT_LINE?        </div>"
APP_COMPONENT_LINE="$APP_COMPONENT_LINE?    </div>"
APP_COMPONENT_LINE="$APP_COMPONENT_LINE?</div>"

# Overwrite out app.component.html with the new contents
echo $APP_COMPONENT_LINE | tr ? '\n' > src/app/app.component.html


IMPORTS_LINES="    BrowserModule,?    ClarityModule"
sed "13s/.*/${IMPORTS_LINES}/" src/app/app.module.ts | tr ? '\n' > src/app/new_app.module.ts

IMPORT_LINE="import { ClarityModule } from '@clr\/angular';"
sed "3s/.*/${IMPORT_LINE}/" src/app/new_app.module.ts > src/app/app.module.ts

# Cleanup our mess
rm new_angular-cli.json
rm src/app/new_app.module.ts