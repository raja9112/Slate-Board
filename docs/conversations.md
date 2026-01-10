# Conversations

<p class="lead">Conversations are an essential part of DigiVault — they are the containers for the messages between you, your contacts, and groups. On this page, we'll dive into the different conversation endpoints you can use to manage conversations programmatically.</p>

!!! info "Coming Soon"
    This page is being updated with comprehensive API documentation. In the meantime, conversations work similarly to contacts - you can create, retrieve, update, delete, and list all your conversations using the same patterns.

## The conversation model {#the-conversation-model}

The conversation model contains information about your conversations, including the participants, last message, and read status.

### Properties

| Property | Type | Description |
|----------|------|-------------|
| `id` | string | Unique identifier for the conversation |
| `contact_id` | string | The contact associated with this conversation |
| `group_id` | string | The group associated with this conversation (if applicable) |
| `last_active_at` | integer | Timestamp of when the conversation was last active |
| `last_opened_at` | integer | Timestamp of when you last opened the conversation |
| `created_at` | integer | Timestamp of when the conversation was created |
| `archived_at` | integer | Timestamp of when the conversation was archived |

### Example Conversation Object

```json
{
  "id": "xgQQXg3hrtjh7AvZ",
  "contact_id": "WAz8eIbvDR60rouK",
  "group_id": null,
  "last_active_at": 705103200,
  "last_opened_at": 705103200,
  "created_at": 692233200,
  "archived_at": null
}
```

## List all conversations {#list-all-conversations}

<span class="method-badge method-get">GET</span> `/v1/conversations`

Retrieve a paginated list of all your conversations.

## Create a conversation {#create-a-conversation}

<span class="method-badge method-post">POST</span> `/v1/conversations`

Create a new conversation with a contact or group.

## Retrieve a conversation {#retrieve-a-conversation}

<span class="method-badge method-get">GET</span> `/v1/conversations/:id`

Retrieve a specific conversation by ID.

## Update a conversation {#update-a-conversation}

<span class="method-badge method-put">PUT</span> `/v1/conversations/:id`

Update conversation properties like archived status.

## Delete a conversation {#delete-a-conversation}

<span class="method-badge method-delete">DELETE</span> `/v1/conversations/:id`

Delete a conversation permanently.

