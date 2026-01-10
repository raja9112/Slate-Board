# Groups

<p class="lead">Groups are where communities live in DigiVault — they can be anything from a small team to a large public community. On this page, we'll dive into the different group endpoints you can use to manage groups programmatically.</p>

!!! info "Coming Soon"
    This page is being updated with comprehensive API documentation. Groups support the standard CRUD operations.

## The group model {#the-group-model}

The group model contains information about groups including members, settings, and metadata.

### Properties

| Property | Type | Description |
|----------|------|-------------|
| `id` | string | Unique identifier for the group |
| `name` | string | The name of the group |
| `description` | string | The description of the group |
| `avatar_url` | string | The avatar image URL for the group |
| `conversation_id` | string | The associated conversation ID |
| `members` | array | An array of group members |
| `created_at` | integer | Timestamp of when the group was created |

## List all groups {#list-all-groups}

<span class="method-badge method-get">GET</span> `/v1/groups`

## Create a group {#create-a-group}

<span class="method-badge method-post">POST</span> `/v1/groups`

## Retrieve a group {#retrieve-a-group}

<span class="method-badge method-get">GET</span> `/v1/groups/:id`

## Update a group {#update-a-group}

<span class="method-badge method-put">PUT</span> `/v1/groups/:id`

## Delete a group {#delete-a-group}

<span class="method-badge method-delete">DELETE</span> `/v1/groups/:id`

