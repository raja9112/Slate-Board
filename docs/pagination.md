# Pagination

<p class="lead">In this guide, we will look at how to work with paginated responses when querying the DigiVault API. By default, all responses limit results to 10 items. However, you can go as high as 100 by adding a limit parameter to your requests.</p>

When an API response returns a list of objects, no matter the amount, pagination is supported. In paginated responses, objects are nested in a `data` attribute and have a `has_more` attribute that indicates whether you have reached the end of the last page. You can use the `starting_after` and `ending_before` query parameters to browse pages.

## Example using cursors {#example-using-cursors}

In this example, we request the page that starts after the conversation with id `s4WycXedwhQrEFuM`. As a result, we get a list of three conversations and can tell by the `has_more` attribute that we have reached the end of the resultset.

=== "cURL"

    ```bash
    curl -G https://api.digivault.com/v1/conversations \
      -H "Authorization: Bearer {token}" \
      -d starting_after="s4WycXedwhQrEFuM" \
      -d limit=10
    ```

=== "JavaScript"

    ```javascript
    const client = new ApiClient(token)

    await client.conversations.list({
      starting_after: 's4WycXedwhQrEFuM',
      limit: 10
    })
    ```

=== "Python"

    ```python
    client = ApiClient(token)

    client.conversations.list(
      starting_after='s4WycXedwhQrEFuM',
      limit=10
    )
    ```

=== "PHP"

    ```php
    $client = new \DigiVault\ApiClient($token);

    $client->conversations->list([
      'starting_after' => 's4WycXedwhQrEFuM',
      'limit' => 10
    ]);
    ```

### Response

```json
{
  "has_more": false,
  "data": [
    {
      "id": "WAz8eIbvDR60rouK",
      "contact_id": "WAz8eIbvDR60rouK",
      "group_id": null,
      "last_active_at": 705103200,
      "last_opened_at": 705103200,
      "created_at": 692233200,
      "archived_at": null
    },
    {
      "id": "hSIhXBhNe8X1d8Et",
      // ...
    },
    {
      "id": "fbwYwpi9C2ybt6Yb",
      // ...
    }
  ]
}
```

## Pagination Parameters

All list endpoints support the following pagination parameters:

| Parameter | Type | Description |
|-----------|------|-------------|
| `limit` | integer | A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. |
| `starting_after` | string | A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. |
| `ending_before` | string | A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. |

!!! tip "Best Practices"
    - Use reasonable page sizes (10-50 items) for optimal performance
    - Cache pagination responses when possible
    - Handle the `has_more` flag to know when to stop fetching
    - Use `starting_after` for forward pagination
    - Use `ending_before` for backward pagination

## Iterating Through Pages

Here's an example of how to iterate through all pages:

=== "JavaScript"

    ```javascript
    async function getAllConversations() {
      const allConversations = [];
      let hasMore = true;
      let startingAfter = null;

      while (hasMore) {
        const response = await client.conversations.list({
          limit: 100,
          starting_after: startingAfter
        });

        allConversations.push(...response.data);
        hasMore = response.has_more;
        
        if (hasMore) {
          startingAfter = response.data[response.data.length - 1].id;
        }
      }

      return allConversations;
    }
    ```

=== "Python"

    ```python
    def get_all_conversations():
        all_conversations = []
        has_more = True
        starting_after = None

        while has_more:
            response = client.conversations.list(
                limit=100,
                starting_after=starting_after
            )

            all_conversations.extend(response['data'])
            has_more = response['has_more']
            
            if has_more:
                starting_after = response['data'][-1]['id']

        return all_conversations
    ```

