#!/bin/bash

branch="master"
repo="git@github.com:predavlad/deploy-scripts.git" # CHANGE
deploy_dir_name=`date +"%Y%m%d-%k%S"`
deploy_dir="/var/www/releases/${deploy_dir_name}"
shared_dir="/var/www/shared"
echo "Deploy dir: ${now}"
echo "Cloning repository..."
git clone $repo -b $branch $deploy_dir


echo "Creating symlinks"

`mkdir -p ${deploy_dir}/skin/adminhtml/default`

`ln -s ${shared_dir}/index.php ${deploy_dir}/index.php`
`ln -s ${shared_dir}/api.php ${deploy_dir}/api.php`
`ln -s ${shared_dir}/cron.php ${deploy_dir}/cron.php`
`ln -s ${shared_dir}/cron.sh ${deploy_dir}/cron.sh`
`ln -s ${shared_dir}/downloader ${deploy_dir}/downloader`

`ln -s ${shared_dir}/lib ${deploy_dir}/lib`
`ln -s ${shared_dir}/media ${deploy_dir}/media`
`ln -s ${shared_dir}/js ${deploy_dir}/js`
`ln -s ${shared_dir}/var ${deploy_dir}/var`
`ln -s ${shared_dir}/.htaccess ${deploy_dir}/.htaccess`

#APP
`cp    ${shared_dir}/app/Mage.php ${deploy_dir}/app/Mage.php`
`ln -s ${shared_dir}/app/etc/local.xml ${deploy_dir}/app/etc/local.xml`
`ln -s ${shared_dir}/app/etc/config.xml ${deploy_dir}/app/etc/config.xml`
`ln -s ${shared_dir}/app/code/core ${deploy_dir}/app/code/core`
`ln -s ${shared_dir}/app/locale ${deploy_dir}/app/locale`
`ln -s ${shared_dir}/app/design/adminhtml/default/default ${deploy_dir}/app/design/adminhtml/default/default`
`ln -s ${shared_dir}/app/design/frontend/base ${deploy_dir}/app/design/frontend/base`
`ln -s ${shared_dir}/app/design/frontend/default ${deploy_dir}/app/design/frontend/default`
`ln -s ${shared_dir}/app/design/install ${deploy_dir}/app/design/install`

#SKIN
`ln -s ${shared_dir}/skin/adminhtml/default/default ${deploy_dir}/skin/adminhtml/default/default`
`ln -s ${shared_dir}/skin/frontend/base ${deploy_dir}/skin/frontend/base`
`ln -s ${shared_dir}/skin/frontend/default ${deploy_dir}/skin/frontend/default`

#SYMLINK release
`rm /var/www/current && ln -s ${deploy_dir} /var/www/current`
