# LifesavingRankings.com

## Installation

### Prerequisites

-   docker & docker-compose
-   composer

### Instructions

```shell
composer install
vendor/bin/sail up
vendor/bin/sail php artisan migrate --seed
vendor/bin/sail php artisan db:seed --class=FakeSeeder
npm install
npm run dev
```

Go to `localhost`  
For mailhog (sent emails) go to `localhost:8025`
