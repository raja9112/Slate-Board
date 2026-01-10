# Authentication

<p class="lead">You'll need to authenticate your requests to access any of the endpoints in the DigiVault API. In this guide, we'll look at how authentication works. DigiVault offers two ways to authenticate your API requests: Basic authentication and OAuth2 with a token — OAuth2 is the recommended way.</p>

## Basic authentication {#basic-authentication}

With basic authentication, you use your username and password to authenticate your HTTP requests. Unless you have a very good reason, you probably shouldn't use basic auth. Here's how to authenticate using cURL:

```bash title="Example request with basic auth"
curl https://api.digivault.com/v1/conversations \
  -u username:password
```

!!! warning "Security Notice"
    Please don't commit your DigiVault password to GitHub!

## OAuth2 with bearer token {#o-auth2-with-bearer-token}

The recommended way to authenticate with the DigiVault API is by using OAuth2. When establishing a connection using OAuth2, you will need your access token — you will find it in the [DigiVault dashboard](#) under API settings. Here's how to add the token to the request header using cURL:

```bash title="Example request with bearer token"
curl https://api.digivault.com/v1/conversations \
  -H "Authorization: Bearer {token}"
```

!!! tip "Token Security"
    Always keep your token safe and reset it if you suspect it has been compromised.

## Using an SDK {#using-an-sdk}

If you use one of our official SDKs, you won't have to worry about any of the above — fetch your access token from the [DigiVault dashboard](#) under API settings, and the client library will take care of the rest. All the client libraries use OAuth2 behind the scenes.

[Check out our list of first-party SDKs](sdks.md){ .md-button }

