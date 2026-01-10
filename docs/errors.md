# Errors

<p class="lead">In this guide, we will talk about what happens when something goes wrong while you work with the API. Mistakes happen, and mostly they will be yours, not ours. Let's look at some status codes and error types you might encounter.</p>

You can tell if your request was successful by checking the status code when receiving an API response. If a response comes back unsuccessful, you can use the error type and error message to figure out what has gone wrong and do some rudimentary debugging (before contacting support).

## Status codes {#status-codes}

Here is a list of the different categories of status codes returned by the DigiVault API:

| Status Code | Description |
|-------------|-------------|
| **2xx** | A 2xx status code indicates a successful response. |
| **4xx** | A 4xx status code indicates a client error — this means something was wrong with your request. |
| **5xx** | A 5xx status code indicates a server error — you won't see many of these. |

### Common Status Codes

| Code | Name | Description |
|------|------|-------------|
| `200` | OK | The request was successful. |
| `201` | Created | The resource was successfully created. |
| `204` | No Content | The request was successful but there is no content to return. |
| `400` | Bad Request | The request was malformed or invalid. |
| `401` | Unauthorized | Your API key is missing or invalid. |
| `403` | Forbidden | You don't have permission to access this resource. |
| `404` | Not Found | The requested resource doesn't exist. |
| `422` | Unprocessable Entity | The request was well-formed but contains semantic errors. |
| `429` | Too Many Requests | You've hit the rate limit. |
| `500` | Internal Server Error | Something went wrong on our end. |
| `503` | Service Unavailable | We're temporarily offline for maintenance. |

## Error types {#error-types}

Whenever a request is unsuccessful, the DigiVault API will return an error response with an error type and message. You can use this information to understand better what has gone wrong and how to fix it.

### Error Response Format

```json
{
  "type": "api_error",
  "message": "The requested resource was not found.",
  "documentation_url": "https://api.digivault.com/docs/errors#not_found"
}
```

### Error Types

| Error Type | Description |
|------------|-------------|
| `api_error` | This means that we made an error, which is usually not the case. |
| `invalid_request` | This means that you made an error, which is much more likely. |
| `rate_limit_error` | You've exceeded the rate limit. |
| `authentication_error` | Your API key is invalid or missing. |
| `permission_error` | You don't have permission to perform this action. |
| `not_found_error` | The resource you're looking for doesn't exist. |
| `validation_error` | The data you provided failed validation. |

## Example Error Responses

### Invalid Request

```json
{
  "type": "invalid_request",
  "message": "Missing required parameter: 'name'",
  "param": "name",
  "documentation_url": "https://api.digivault.com/docs/errors#invalid_request"
}
```

### Authentication Error

```json
{
  "type": "authentication_error",
  "message": "Invalid API key provided",
  "documentation_url": "https://api.digivault.com/docs/errors#authentication_error"
}
```

### Rate Limit Error

```json
{
  "type": "rate_limit_error",
  "message": "Too many requests. Please slow down.",
  "retry_after": 60,
  "documentation_url": "https://api.digivault.com/docs/errors#rate_limit_error"
}
```

### Validation Error

```json
{
  "type": "validation_error",
  "message": "Validation failed",
  "errors": {
    "email": ["The email field must be a valid email address."],
    "password": ["The password must be at least 8 characters."]
  },
  "documentation_url": "https://api.digivault.com/docs/errors#validation_error"
}
```

## Handling Errors

Here are some best practices for handling errors:

!!! tip "Error Handling Best Practices"
    - Always check the status code before processing the response
    - Log error messages and types for debugging
    - Implement exponential backoff for rate limit errors
    - Show user-friendly error messages in your application
    - Monitor error rates to catch issues early

### Example Error Handling

=== "JavaScript"

    ```javascript
    try {
      const conversation = await client.conversations.retrieve('WAz8eIbvDR60rouK');
    } catch (error) {
      if (error.status === 404) {
        console.log('Conversation not found');
      } else if (error.status === 429) {
        console.log('Rate limited. Retry after:', error.retry_after);
        // Implement retry logic
      } else {
        console.error('API error:', error.message);
      }
    }
    ```

=== "Python"

    ```python
    from bitvault_sdk import ApiError, RateLimitError, NotFoundError

    try:
        conversation = client.conversations.retrieve('WAz8eIbvDR60rouK')
    except NotFoundError:
        print('Conversation not found')
    except RateLimitError as e:
        print(f'Rate limited. Retry after: {e.retry_after}')
        # Implement retry logic
    except ApiError as e:
        print(f'API error: {e.message}')
    ```

## Rate Limiting

The DigiVault API uses rate limiting to prevent abuse. You can make:

- **100 requests per minute** for standard API endpoints
- **10 requests per minute** for write operations (POST, PUT, DELETE)

Rate limit information is included in response headers:

```
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 95
X-RateLimit-Reset: 1609459200
```

When you exceed the rate limit, you'll receive a `429 Too Many Requests` response with a `Retry-After` header indicating how long to wait before making another request.

