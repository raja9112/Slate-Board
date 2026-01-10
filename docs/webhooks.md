# Webhooks

<p class="lead">In this guide, we will look at how to register and consume webhooks to integrate your app with DigiVault. With webhooks, your app can know when something happens in DigiVault, such as someone sending a message or adding a contact.</p>

## Registering webhooks {#registering-webhooks}

To register a new webhook, you need to have a URL in your app that DigiVault can call. You can configure a new webhook from the DigiVault dashboard under [API settings](#). Give your webhook a name, pick the events you want to listen for, and add your URL.

Now, whenever something of interest happens in your app, a webhook is fired off by DigiVault. In the next section, we'll look at how to consume webhooks.

### Webhook Configuration

When creating a webhook, you'll need to specify:

| Field | Description |
|-------|-------------|
| **Name** | A descriptive name for your webhook |
| **URL** | The endpoint URL where DigiVault will send webhook events |
| **Events** | The types of events you want to receive |
| **Secret** | A secret key used to verify webhook signatures (auto-generated) |
| **Active** | Whether the webhook is currently active |

!!! tip "Testing Webhooks Locally"
    Use tools like [ngrok](https://ngrok.com/) to create a public URL that tunnels to your local development server for testing webhooks.

## Consuming webhooks {#consuming-webhooks}

When your app receives a webhook request from DigiVault, check the webhook signature to verify that the request is indeed from DigiVault. You can find the signature in the request header. The signature is a hash of the request payload signed with your webhook secret.

### Webhook Payload

All webhook payloads follow this structure:

```json
{
  "id": "webhook_1234567890",
  "type": "conversation.message.created",
  "created_at": 1640995200,
  "data": {
    "object": {
      "id": "xgQQXg3hrtjh7AvZ",
      "conversation_id": "WAz8eIbvDR60rouK",
      "contact": {
        "id": "WAz8eIbvDR60rouK",
        "username": "FrankMcCallister",
        "name": "Frank McCallister",
        "avatar_url": "https://assets.digivault.com/avatars/frank.jpg"
      },
      "message": "Hello, world!",
      "created_at": 1640995200
    }
  }
}
```

### Verifying Webhook Signatures

=== "Node.js"

    ```javascript
    import crypto from 'crypto';

    function verifyWebhookSignature(payload, signature, secret) {
      const expectedSignature = crypto
        .createHmac('sha256', secret)
        .update(JSON.stringify(payload))
        .digest('hex');

      return crypto.timingSafeEqual(
        Buffer.from(signature),
        Buffer.from(expectedSignature)
      );
    }

    // Express.js example
    app.post('/webhooks', (req, res) => {
      const signature = req.headers['x-bitvault-signature'];
      
      if (!verifyWebhookSignature(req.body, signature, process.env.WEBHOOK_SECRET)) {
        return res.status(401).send('Invalid signature');
      }

      // Process webhook
      const event = req.body;
      console.log('Received event:', event.type);

      res.sendStatus(200);
    });
    ```

=== "Python"

    ```python
    import hmac
    import hashlib
    from flask import Flask, request, jsonify

    def verify_webhook_signature(payload, signature, secret):
        expected_signature = hmac.new(
            secret.encode('utf-8'),
            payload.encode('utf-8'),
            hashlib.sha256
        ).hexdigest()
        
        return hmac.compare_digest(signature, expected_signature)

    app = Flask(__name__)

    @app.route('/webhooks', methods=['POST'])
    def handle_webhook():
        signature = request.headers.get('X-DigiVault-Signature')
        payload = request.get_data(as_text=True)
        
        if not verify_webhook_signature(payload, signature, os.environ['WEBHOOK_SECRET']):
            return jsonify({'error': 'Invalid signature'}), 401
        
        # Process webhook
        event = request.get_json()
        print(f"Received event: {event['type']}")
        
        return '', 200
    ```

=== "PHP"

    ```php
    <?php

    function verifyWebhookSignature($payload, $signature, $secret) {
        $expectedSignature = hash_hmac('sha256', $payload, $secret);
        return hash_equals($signature, $expectedSignature);
    }

    $payload = file_get_contents('php://input');
    $signature = $_SERVER['HTTP_X_BITVAULT_SIGNATURE'];
    $secret = getenv('WEBHOOK_SECRET');

    if (!verifyWebhookSignature($payload, $signature, $secret)) {
        http_response_code(401);
        exit('Invalid signature');
    }

    $event = json_decode($payload, true);
    error_log('Received event: ' . $event['type']);

    http_response_code(200);
    ```

## Event types {#event-types}

DigiVault supports the following webhook events:

### Conversation Events

| Event Type | Description |
|------------|-------------|
| `conversation.created` | A new conversation was created |
| `conversation.updated` | A conversation was updated |
| `conversation.archived` | A conversation was archived |
| `conversation.deleted` | A conversation was deleted |

### Message Events

| Event Type | Description |
|------------|-------------|
| `conversation.message.created` | A new message was sent in a conversation |
| `conversation.message.updated` | A message was edited |
| `conversation.message.deleted` | A message was deleted |
| `conversation.message.read` | A message was read |

### Contact Events

| Event Type | Description |
|------------|-------------|
| `contact.created` | A new contact was created |
| `contact.updated` | A contact was updated |
| `contact.deleted` | A contact was deleted |

### Group Events

| Event Type | Description |
|------------|-------------|
| `group.created` | A new group was created |
| `group.updated` | A group was updated |
| `group.member_added` | A member was added to a group |
| `group.member_removed` | A member was removed from a group |
| `group.deleted` | A group was deleted |

## Security {#security}

When using webhooks, security is crucial. Here are some best practices:

!!! warning "Security Best Practices"
    - **Always verify signatures** - Never trust incoming webhook requests without verifying the signature
    - **Use HTTPS** - Only use HTTPS URLs for your webhook endpoints
    - **Keep secrets secure** - Store webhook secrets in environment variables, never in code
    - **Implement rate limiting** - Protect your webhook endpoint from being overwhelmed
    - **Validate event data** - Don't trust incoming data; validate it before processing
    - **Use idempotency** - Handle duplicate webhooks gracefully using event IDs

### Handling Duplicate Events

DigiVault may send the same webhook event more than once. Use the `id` field to implement idempotency:

```javascript
const processedEvents = new Set();

app.post('/webhooks', (req, res) => {
  const event = req.body;
  
  // Check if we've already processed this event
  if (processedEvents.has(event.id)) {
    return res.sendStatus(200);
  }
  
  // Process event
  processEvent(event);
  
  // Mark as processed
  processedEvents.add(event.id);
  
  res.sendStatus(200);
});
```

## Testing Webhooks

You can test your webhook integration using the DigiVault dashboard. Navigate to your webhook settings and click "Send test webhook" to send a sample event to your endpoint.

### Example Test Event

```json
{
  "id": "webhook_test_123",
  "type": "conversation.message.created",
  "created_at": 1640995200,
  "data": {
    "object": {
      "id": "test_message_id",
      "conversation_id": "test_conversation_id",
      "message": "This is a test message",
      "created_at": 1640995200
    }
  }
}
```

## Webhook Retry Logic

If your webhook endpoint returns an error (non-2xx status code) or fails to respond within 30 seconds, DigiVault will retry the webhook with exponential backoff:

- 1st retry: after 1 minute
- 2nd retry: after 5 minutes
- 3rd retry: after 15 minutes
- 4th retry: after 1 hour
- 5th retry: after 6 hours

After 5 failed attempts, the webhook will be marked as failed and you'll receive an email notification.

!!! info "Monitoring Webhooks"
    You can monitor webhook delivery status and view logs in the DigiVault dashboard under [API settings → Webhooks](#).

