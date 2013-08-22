# post_deploy.sh

# update dependencies
composer.phar update

# regenerate all entities
php app/console doctrine:generate:entities Innobyte # change if needed

# update schema, and show the SQLs that ran
php app/console doctrine:schema:update --dump-sql
php app/console doctrine:schema:update --force

# clear cache and reset permissions
php app/console cache:clear --env=dev
php app/console cache:clear --env=prod

# get + show assets
php app/console assets:install
php app/console assetic:dump

chmod 0777 -R app/cache app/logs
echo 'Done.'
