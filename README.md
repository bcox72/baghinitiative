# The Bagh Initiative

CodeIgniter 4 website for `bahginitiative.com`, based on the supplied Bagh Initiative vision document.

## Requirements

- PHP 8.2 or newer
- Composer

## Local setup

1. Run `composer install`.
2. Copy `env` to `.env` if local overrides are needed.
3. Run `php spark serve`.
4. Open <http://localhost:8080>.

The application currently has no database requirement.

## Deployment

1. Configure the domain document root to the deployed application's `public/` directory.
2. Copy `deploy.env.example` to `deploy.env` and set the SSH alias and remote paths.
3. Run `./publish.sh`.
4. Enable HTTPS through the server's SSL/AutoSSL tooling.

`deploy.env`, `.env`, and runtime files under `writable/` are excluded from Git.

## Content follow-ups

- Add the public contact address and prayer-update link.
- Connect the giving call to the final donation page.
- Add a privacy policy before adding forms or analytics.
