
Accepted pull request for Docker’s documentation and Medium post about issue
Kanan Rahimov	General	April 4, 2018	0 Minutes	

Recently I had an issue with Docker Compose startup order. PostgreSQL was running after Django’s web container so it was impossible to make proper connection especially while first run. The solution is to write some script which will check status of PostgreSQL before running web worker. I found initial version of it on Docker’s web site:

#!/bin/bash
# wait-for-postgres.sh

# Stop execution if we have an error
set -e

# Get host:port from parameters list
host="$1"

# Remove first argument from list of parameters (host)
shift

# Try to connect to PostgreSQL
until psql -h "$host" -U "$POSTGRES_USER" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"

# Execute given other parameters (commands)
exec "$@"
view raw
Status check script for Docker Compose for Django REST Framework and Celery with PostgreSQL, RabbitMQ and Redis - initial.sh hosted with ❤ by GitHub

But it was not working without postgres’ password. After a little research I came up with following update. You need to add PGPASSWORD=$POSTGRES_PASSWORD env variable before calling psql command.

#!/bin/bash
# wait-for-postgres.sh

# Stop execution if we have an error
set -e

# Get host:port from parameters list
host="$1"

# Remove first argument from list of parameters (host)
shift

# Try to connect to PostgreSQL
until PGPASSWORD=$POSTGRES_PASSWORD psql -h "$host" -U "$POSTGRES_USER" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"

# Execute given other parameters (commands)
exec "$@"
view raw
Status check script for Docker Compose for Django REST Framework and Celery with PostgreSQL, RabbitMQ and Redis.sh hosted with ❤ by GitHub

After few additional steps (you can read about them on my medium post) it now works just fine.

I did pull request with regarding changes to Docker’s documentation and it is accepted.
