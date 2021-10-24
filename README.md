# LifesavingRankings.com

## Installation

### Prerequisites

- docker & docker-compose
- composer

### Instructions

```shell
composer install
vendor/bin/sail up
vendor/bin/sail php artisan db:migrate --seed
vendor/bin/sail php artisan db:seed --class=FakeSeeder
npm install
npm run dev
```
