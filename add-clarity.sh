#!/bin/bash

# YARN add clarity dependencies
yarn add @clr/icons
yarn add @webcomponents/custom-elements@1.0.0
yarn add @clr/ui
yarn add @clr/angular

# Clarity Scripts for .angular-cli.json
SCRIPTS_LINE_1="      \"scripts\": [?"
SCRIPTS_LINE_2="        \"..\/node_modules\/@clr\/icons\/clr-icons.min.css\",?"
SCRIPTS_LINE_3="        \"..\/node_modules\/@webcomponents\/custom-elements\/custom-elements.min.js\",\?"
SCRIPTS_LINE_4="        \"..\/node_modules\/@clr\/icons\/clr-icons.min.js\"?"
SCRIPTS_LINE_5="      ],"

SCRIPTS_LINE="$SCRIPTS_LINE_1$SCRIPTS_LINE_2$SCRIPTS_LINE_3$SCRIPTS_LINE_4$SCRIPTS_LINE_5"

CSS_LINE_1="      \"styles\": [?"
CSS_LINE_2="        \"..\/node_modules\/@clr\/icons\/clr-icons.min.css\",?"
CSS_LINE_3="        \"..\/node_modules\/@clr\/ui\/clr-ui.min.css\","

CSS_LINE="$CSS_LINE_1$CSS_LINE_2$CSS_LINE_3"

cp .angular-cli.json .angular-cli.json_bak
cp .angular-cli.json angular-cli.json
sed "24s/.*/${SCRIPTS_LINE}/" angular-cli.json > new_angular-cli.json
tr ? '\n' < new_angular-cli.json > angular-cli.json

sed "21s/.*/${CSS_LINE}/" angular-cli.json > new_angular-cli.json
tr ? '\n' < new_angular-cli.json > angular-cli.json

rm new_angular-cli.json

mv angular-cli.json .angular-cli.json

cat app.component.html > src/app/app.component.html
rm app.component.html