# Attachments

<p class="lead">Attachments are how you share files in DigiVault — they can be anything from documents to images and videos. On this page, we'll dive into the different attachment endpoints you can use to manage attachments programmatically.</p>

!!! info "Coming Soon"
    This page is being updated with comprehensive API documentation. Attachments can be uploaded, retrieved, and deleted.

## The attachment model {#the-attachment-model}

The attachment model contains information about files attached to messages.

### Properties

| Property | Type | Description |
|----------|------|-------------|
| `id` | string | Unique identifier for the attachment |
| `message_id` | string | The message this attachment belongs to |
| `filename` | string | The original filename |
| `file_type` | string | The MIME type of the file |
| `file_size` | integer | The size of the file in bytes |
| `url` | string | The URL to download the attachment |
| `created_at` | integer | Timestamp of when the attachment was created |

## List all attachments {#list-all-attachments}

<span class="method-badge method-get">GET</span> `/v1/attachments`

## Create an attachment {#create-an-attachment}

<span class="method-badge method-post">POST</span> `/v1/attachments`

## Retrieve an attachment {#retrieve-an-attachment}

<span class="method-badge method-get">GET</span> `/v1/attachments/:id`

## Update an attachment {#update-an-attachment}

<span class="method-badge method-put">PUT</span> `/v1/attachments/:id`

## Delete an attachment {#delete-an-attachment}

<span class="method-badge method-delete">DELETE</span> `/v1/attachments/:id`

