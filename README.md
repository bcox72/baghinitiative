# The Bagh Initiative

Static website for `bahginitiative.com`, based on the supplied Bagh Initiative vision document.

## Local preview

```bash
python3 -m http.server 8080
```

Open <http://localhost:8080>.

## Deployment

1. Create the domain or subaccount in cPanel and point its document root at the intended `public_html` directory.
2. Copy `deploy.env.example` to `deploy.env` and set the SSH alias and absolute document root.
3. Run `./publish.sh`.
4. Point the domain's A/AAAA records at the server, then issue an SSL certificate in cPanel/AutoSSL.

`deploy.env` is intentionally ignored by Git.

## Content follow-ups

- Add the public contact address and prayer-update link.
- Connect the Give call to the final donation page when it is available.
- Add a privacy policy before collecting contact information through a form or analytics platform.
