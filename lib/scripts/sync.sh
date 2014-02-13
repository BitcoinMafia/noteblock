#!/usr/bin/env sh

echo "Dropping local DB..."
bundle exec rake db:drop

echo "Creating local DB..."
bundle exec rake db:create

echo "Capturing Heroku pgbackup..."
heroku pgbackups:capture --expire --remote web

echo "Downloading pgbackup..."
curl -o tmp/latest.dump `heroku pgbackups:url --remote web`

echo "Restoring pgbackup..."
pg_restore --verbose --clean --no-acl --no-owner -h localhost -U noteblock -d noteblock_development tmp/latest.dump

echo "Removing db dump..."
rm tmp/latest.dump

### FOR LOCAL
echo "migrating db..."
bundle exec rake db:migrate

echo "preparing test db"
bundle exec rake db:test:prepare
