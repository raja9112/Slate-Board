# Quickstart

<p class="lead">This guide will get you all set up and ready to use the DigiVault API. We'll cover how to get started using one of our API clients and how to make your first API request. We'll also look at where to go next to find all the information you need to take full advantage of our powerful REST API.</p>

!!! note "Before you begin"
    Before you can make requests to the DigiVault API, you will need to grab your API key from your dashboard. You find it under [Settings → API](#).

## Choose your client {#choose-your-client}

Before making your first API request, you need to pick which API client you will use. In addition to good ol' cURL HTTP requests, DigiVault offers clients for JavaScript, Python, and PHP. In the following example, you can see how to install each client.

=== "cURL"

    ```bash
    # cURL is most likely already installed on your machine
    curl --version
    ```

=== "JavaScript"

    ```bash
    # Install the DigiVault JavaScript SDK
    npm install @digivault/sdk --save
    ```

=== "Python"

    ```bash
    # Install the DigiVault Python SDK
    pip install digivault-sdk
    ```

=== "PHP"

    ```bash
    # Install the DigiVault PHP SDK
    composer require digivault/sdk
    ```

[Check out our list of first-party SDKs](sdks.md){ .md-button }

## Making your first API request {#making-your-first-api-request}

After picking your preferred client, you are ready to make your first call to the DigiVault API. Below, you can see how to send a GET request to the Conversations endpoint to get a list of all your conversations. In the cURL example, results are limited to ten conversations, the default page length for each client.

=== "cURL"

    ```bash
    curl -G https://api.digivault.com/v1/conversations \
      -H "Authorization: Bearer {token}" \
      -d limit=10
    ```

=== "JavaScript"

    ```javascript
    import ApiClient from '@digivault/sdk'

    const client = new ApiClient(token)

    await client.conversations.list()
    ```

=== "Python"

    ```python
    from digivault_sdk import ApiClient

    client = ApiClient(token)

    client.conversations.list()
    ```

=== "PHP"

    ```php
    $client = new \DigiVault\ApiClient($token);

    $client->conversations->list();
    ```

[Read the docs for the Conversations endpoint](conversations.md){ .md-button }

## What's next? {#whats-next}

Great, you're now set up with an API client and have made your first request to the API. Here are a few links that might be handy as you venture further into the DigiVault API:

- [Grab your API key from the DigiVault dashboard](#)
- [Check out the Conversations endpoint](conversations.md)
- [Learn about the different error messages in DigiVault](errors.md)

