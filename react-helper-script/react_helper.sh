#!/bin/bash
# you can create a component or page from project root directory
# first argument is the name of the component
# second argument is to specify page or component

# e.g. ./bin/react_helper.sh HeaderComponent component {to create component}
# e.g. ./bin/react_helper.sh LandingPage page {to create a page}

generate_files() {
    echo -e "import $1 from './$1';\n\nexport default $1;" > index.js
    echo -e "@import \"settings\";\n@import \"color\";"  > $1.scss
    echo -e "import React from 'react';\nimport PropTypes from 'prop-types';\nimport styles from './$1.module.scss';" > $1.js
}

if [[ "$2" == "component" ]];
    then
        pwd=`pwd`
        cd ${pwd}
        cd ./app/components
        mkdir $1
        cd $1
        generate_files $1
        echo "$1 component created"
elif [[ "$2" == "page" ]];
    then
        pwd=`pwd`
        cd ${pwd}
        cd ./pages
        mkdir $1
        cd $1
        generate_files $1
        echo "$1 page created"
else
    echo " Please specify either page or component"
fi
