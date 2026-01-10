# Contacts

<p class="lead">Contacts are at the core of DigiVault — the API allows you to create, retrieve, update, delete, and list all your contacts.</p>

## The contact model {#the-contact-model}

The contact model contains all the information about your contacts, such as their username, avatar, and phone number. It also contains a reference to the conversation between you and the contact and information about when they were last active on DigiVault.

### Properties

| Property | Type | Description |
|----------|------|-------------|
| `id` | string | Unique identifier for the contact |
| `username` | string | The username for the contact |
| `phone_number` | string | The phone number for the contact |
| `avatar_url` | string | The avatar image URL for the contact |
| `display_name` | string | The contact display name in the contact list (name or username) |
| `conversation_id` | string | Unique identifier for the conversation associated with the contact |
| `last_active_at` | integer | Timestamp of when the contact was last active on the platform |
| `created_at` | integer | Timestamp of when the contact was created |


### Example Contact Object

```json
{
  "id": "WAz8eIbvDR60rouK",
  "username": "FrankMcCallister",
  "phone_number": "1-800-759-3000",
  "avatar_url": "https://assets.digivault.com/avatars/frank.jpg",
  "display_name": "Frank McCallister",
  "conversation_id": "xgQQXg3hrtjh7AvZ",
  "last_active_at": 705103200,
  "created_at": 692233200
}
```

## List all contacts {#list-all-contacts}

<span class="method-badge method-get">GET</span> `/v1/contacts`

This endpoint allows you to retrieve a paginated list of all your contacts. By default, a maximum of 10 contacts are shown per page.

### Query Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `limit` | integer | 10 | Limit the number of contacts returned |
| `starting_after` | string | - | Return contacts after this contact ID |
| `ending_before` | string | - | Return contacts before this contact ID |

### Request Example

=== "cURL"

    ```bash
    curl -G https://api.digivault.com/v1/contacts \
      -H "Authorization: Bearer {token}" \
      -d limit=10
    ```

=== "JavaScript"

    ```javascript
    const client = new ApiClient(token);
    const contacts = await client.contacts.list({ limit: 10 });
    ```

=== "Python"

    ```python
    client = ApiClient(token)
    contacts = client.contacts.list(limit=10)
    ```

=== "PHP"

    ```php
    $client = new \DigiVault\ApiClient($token);
    $contacts = $client->contacts->list(['limit' => 10]);
    ```

### Response

```json
{
  "has_more": false,
  "data": [
    {
      "id": "WAz8eIbvDR60rouK",
      "username": "FrankMcCallister",
      "phone_number": "1-800-759-3000",
      "avatar_url": "https://assets.digivault.com/avatars/frank.jpg",
      "display_name": "Frank McCallister",
      "conversation_id": "xgQQXg3hrtjh7AvZ",
      "last_active_at": 705103200,
      "created_at": 692233200
    },
    {
      "id": "hSIhXBhNe8X1d8Et"
      // ...
    }
  ]
}
```

## Create a contact {#create-a-contact}

<span class="method-badge method-post">POST</span> `/v1/contacts`

This endpoint allows you to add a new contact to your contact list in DigiVault.

### Request Body

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `username` | string | Yes | The username for the contact |
| `phone_number` | string | Yes | The phone number for the contact |
| `avatar_url` | string | No | The avatar image URL for the contact |
| `display_name` | string | No | The contact display name |

### Request Example

=== "cURL"

    ```bash
    curl https://api.digivault.com/v1/contacts \
      -H "Authorization: Bearer {token}" \
      -H "Content-Type: application/json" \
      -d '{
        "username": "FrankMcCallister",
        "phone_number": "1-800-759-3000",
        "avatar_url": "https://assets.digivault.com/avatars/frank.jpg"
      }'
    ```

=== "JavaScript"

    ```javascript
    const contact = await client.contacts.create({
      username: 'FrankMcCallister',
      phone_number: '1-800-759-3000',
      avatar_url: 'https://assets.digivault.com/avatars/frank.jpg'
    });
    ```

=== "Python"

    ```python
    contact = client.contacts.create(
      username='FrankMcCallister',
      phone_number='1-800-759-3000',
      avatar_url='https://assets.digivault.com/avatars/frank.jpg'
    )
    ```

=== "PHP"

    ```php
    $contact = $client->contacts->create([
      'username' => 'FrankMcCallister',
      'phone_number' => '1-800-759-3000',
      'avatar_url' => 'https://assets.digivault.com/avatars/frank.jpg'
    ]);
    ```

### Response

```json
{
  "id": "WAz8eIbvDR60rouK",
  "username": "FrankMcCallister",
  "phone_number": "1-800-759-3000",
  "avatar_url": "https://assets.digivault.com/avatars/frank.jpg",
  "display_name": null,
  "conversation_id": "xgQQXg3hrtjh7AvZ",
  "last_active_at": null,
  "created_at": 692233200
}
```

## Retrieve a contact {#retrieve-a-contact}

<span class="method-badge method-get">GET</span> `/v1/contacts/:id`

This endpoint allows you to retrieve a contact by providing their DigiVault id.

### Path Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `id` | string | The unique identifier for the contact |

### Request Example

=== "cURL"

    ```bash
    curl https://api.digivault.com/v1/contacts/WAz8eIbvDR60rouK \
      -H "Authorization: Bearer {token}"
    ```

=== "JavaScript"

    ```javascript
    const contact = await client.contacts.retrieve('WAz8eIbvDR60rouK');
    ```

=== "Python"

    ```python
    contact = client.contacts.retrieve('WAz8eIbvDR60rouK')
    ```

=== "PHP"

    ```php
    $contact = $client->contacts->retrieve('WAz8eIbvDR60rouK');
    ```

### Response

```json
{
  "id": "WAz8eIbvDR60rouK",
  "username": "FrankMcCallister",
  "phone_number": "1-800-759-3000",
  "avatar_url": "https://assets.digivault.com/avatars/frank.jpg",
  "display_name": "Frank McCallister",
  "conversation_id": "xgQQXg3hrtjh7AvZ",
  "last_active_at": 705103200,
  "created_at": 692233200
}
```

## Update a contact {#update-a-contact}

<span class="method-badge method-put">PUT</span> `/v1/contacts/:id`

This endpoint allows you to perform an update on a contact.

### Path Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `id` | string | The unique identifier for the contact |

### Request Body

| Parameter | Type | Description |
|-----------|------|-------------|
| `username` | string | The username for the contact |
| `phone_number` | string | The phone number for the contact |
| `avatar_url` | string | The avatar image URL for the contact |
| `display_name` | string | The contact display name |

### Request Example

=== "cURL"

    ```bash
    curl -X PUT https://api.digivault.com/v1/contacts/WAz8eIbvDR60rouK \
      -H "Authorization: Bearer {token}" \
      -H "Content-Type: application/json" \
      -d '{
        "display_name": "Frank (Work)"
      }'
    ```

=== "JavaScript"

    ```javascript
    const contact = await client.contacts.update('WAz8eIbvDR60rouK', {
      display_name: 'Frank (Work)'
    });
    ```

=== "Python"

    ```python
    contact = client.contacts.update('WAz8eIbvDR60rouK', 
      display_name='Frank (Work)'
    )
    ```

=== "PHP"

    ```php
    $contact = $client->contacts->update('WAz8eIbvDR60rouK', [
      'display_name' => 'Frank (Work)'
    ]);
    ```

### Response

```json
{
  "id": "WAz8eIbvDR60rouK",
  "username": "FrankMcCallister",
  "phone_number": "1-800-759-3000",
  "avatar_url": "https://assets.digivault.com/avatars/frank.jpg",
  "display_name": "Frank (Work)",
  "conversation_id": "xgQQXg3hrtjh7AvZ",
  "last_active_at": 705103200,
  "created_at": 692233200
}
```

## Delete a contact {#delete-a-contact}

<span class="method-badge method-delete">DELETE</span> `/v1/contacts/:id`

This endpoint allows you to delete contacts from your contact list in DigiVault.

### Path Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `id` | string | The unique identifier for the contact |

### Request Example

=== "cURL"

    ```bash
    curl -X DELETE https://api.digivault.com/v1/contacts/WAz8eIbvDR60rouK \
      -H "Authorization: Bearer {token}"
    ```

=== "JavaScript"

    ```javascript
    await client.contacts.delete('WAz8eIbvDR60rouK');
    ```

=== "Python"

    ```python
    client.contacts.delete('WAz8eIbvDR60rouK')
    ```

=== "PHP"

    ```php
    $client->contacts->delete('WAz8eIbvDR60rouK');
    ```

### Response

```json
{
  "id": "WAz8eIbvDR60rouK",
  "deleted": true
}
```

