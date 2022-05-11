# LifesavingRankings.com

## Installation

### Prerequisites

-   docker & docker-compose
-   composer

### Instructions

```shell
composer install --ignore-platform-reqs
vendor/bin/sail up
vendor/bin/sail php artisan migrate --seed
vendor/bin/sail php artisan db:seed --class=FakeSeeder
npm install
npm run dev
```

If you use Minio as file storage, be sure to create a new bucket in the console: `localhost:8900`

Go to `localhost`  
For mailhog (sent emails) go to `localhost:8025`
