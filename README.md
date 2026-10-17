# Task #3 — LCM Web Method (Ruby on Rails)

Minimal Rails 8 API service that returns the **lowest common multiple** of two
natural numbers via HTTP GET.

## Endpoint

```
GET /lcm/:email_token?x=<int>&y=<int>
```

- `email_token` — the sanitized email address (non-alphanumeric chars replaced
  by `_`). For `mislampromail@gmail.com` use `mislampromail_gmail_com`.
- `x`, `y` — non-negative integers.
- **Response**: plain text, digits only (the LCM), or `NaN` if either argument
  is missing or not a non-negative integer.

### Examples

| URL                                                       | Response |
| --------------------------------------------------------- | -------- |
| `/lcm/test?x=4&y=6`                                       | `12`     |
| `/lcm/test?x=0&y=5`                                       | `0`      |
| `/lcm/test?x=-1&y=5`                                      | `NaN`    |
| `/lcm/test?x=abc&y=5`                                     | `NaN`    |
| `/lcm/test?x=12&y=18`                                     | `36`     |

## Local development

```sh
bundle install
bin/rails server
```

Then:

```sh
curl "http://localhost:3000/lcm/test?x=4&y=6"
```

## Deploy to Render.com

1. Push the repo to GitHub.
2. In Render, create a new **Blueprint** and point it at this repo, **or** create
   a **Web Service** manually using these settings:
   - **Runtime**: Ruby
   - **Build Command**: `bundle install`
   - **Start Command**: `bundle exec puma -C config/puma.rb`
   - **Instance Type**: Free
3. Render reads `render.yaml` and provisions the service. Wait for the first
   deploy to finish.
4. Your public URL will look like `https://task3-lcm-XXXX.onrender.com`.
5. **Wake the server** before submitting (free tier sleeps after 15 min of
   inactivity):

   ```sh
   curl https://task3-lcm-XXXX.onrender.com/up
   ```

## Submission string

```
!task3 mislampromail@gmail.com https://task3-lcm-XXXX.onrender.com/lcm/mislampromail_gmail_com?x={}&y={}
```

The bot replaces `{}` with concrete numbers at evaluation time.