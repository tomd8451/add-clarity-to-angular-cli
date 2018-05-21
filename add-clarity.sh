#!/bin/bash

# Add Clarity dependencies to YARN
yarn add rxjs-compat
ng add @clr/angular@next

# Backup the files we're manipulating
cp src/app/app.component.html src/app/app.component.html_bak

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
