# Messages

<p class="lead">Messages are what conversations are made of in DigiVault — they are the basic building blocks of your conversations with your DigiVault contacts. On this page, we'll dive into the different message endpoints you can use to manage messages programmatically.</p>

!!! info "Coming Soon"
    This page is being updated with comprehensive API documentation. In the meantime, messages support full CRUD operations similar to other resources.

## The message model {#the-message-model}

The message model contains all the information about messages sent in conversations.

### Properties

| Property | Type | Description |
|----------|------|-------------|
| `id` | string | Unique identifier for the message |
| `conversation_id` | string | The conversation this message belongs to |
| `contact` | object | The contact who sent the message |
| `message` | string | The message content |
| `reactions` | array | An array of reactions to the message |
| `attachments` | array | An array of attachments |
| `read_at` | integer | Timestamp of when the message was read |
| `created_at` | integer | Timestamp of when the message was created |
| `updated_at` | integer | Timestamp of when the message was last updated |

### Example Message Object

```json
{
  "id": "SIuAFUNKNKNNyLT",
  "conversation_id": "xgQQXg3hrtjh7AvZ",
  "contact": {
    "id": "WAz8eIbvDR60rouK",
    "username": "FrankMcCallister",
    "phone_number": "1-800-759-3000",
    "avatar_url": "https://assets.bitvault.com/avatars/frank.jpg"
  },
  "message": "I'm traveling to Barcelona next week, do you have any tips?",
  "reactions": [],
  "attachments": [],
  "read_at": 705103200,
  "created_at": 692233200,
  "updated_at": 692233200
}
```

## List all messages {#list-all-messages}

<span class="method-badge method-get">GET</span> `/v1/messages`

Retrieve a paginated list of all messages.

## Send a message {#send-a-message}

<span class="method-badge method-post">POST</span> `/v1/messages`

Send a new message to a conversation.

## Retrieve a message {#retrieve-a-message}

<span class="method-badge method-get">GET</span> `/v1/messages/:id`

Retrieve a specific message by ID.

## Update a message {#update-a-message}

<span class="method-badge method-put">PUT</span> `/v1/messages/:id`

Update message content.

## Delete a message {#delete-a-message}

<span class="method-badge method-delete">DELETE</span> `/v1/messages/:id`

Delete a message permanently.

