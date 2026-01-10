# SDKs

<p class="lead">DigiVault provides official SDKs for popular programming languages to make integration seamless and efficient. Choose your preferred language and get started quickly.</p>

## Official libraries {#official-libraries}

Our official SDKs are designed to provide a consistent developer experience across different programming languages while following each language's best practices and conventions.

### JavaScript / TypeScript

The DigiVault JavaScript SDK works in both Node.js and browser environments.

```bash
npm install @digivault/sdk --save
```

```javascript
import { DigiVaultClient } from '@digivault/sdk';

const client = new DigiVaultClient({
  apiKey: 'your-api-key'
});

// Make requests
const conversations = await client.conversations.list();
```

[:material-nodejs: View JavaScript SDK Documentation](#){ .md-button }

### Python

The DigiVault Python SDK supports Python 3.7 and above.

```bash
pip install digivault-sdk
```

```python
from digivault_sdk import Client

client = Client(api_key='your-api-key')

# Make requests
conversations = client.conversations.list()
```

[:material-language-python: View Python SDK Documentation](#){ .md-button }

### PHP

The DigiVault PHP SDK requires PHP 7.4 or higher.

```bash
composer require digivault/sdk
```

```php
<?php

use DigiVault\Client;

$client = new Client([
    'api_key' => 'your-api-key'
]);

// Make requests
$conversations = $client->conversations->list();
```

[:material-language-php: View PHP SDK Documentation](#){ .md-button }

### Ruby

The DigiVault Ruby SDK requires Ruby 2.7 or higher.

```bash
gem install digivault-sdk
```

```ruby
require 'digivault'

client = DigiVault::Client.new(api_key: 'your-api-key')

# Make requests
conversations = client.conversations.list
```

[:material-language-ruby: View Ruby SDK Documentation](#){ .md-button }

### Go

The DigiVault Go SDK requires Go 1.18 or higher.

```bash
go get github.com/digivault/sdk-go
```

```go
package main

import (
    "github.com/digivault/sdk-go"
)

func main() {
    client := digivault.NewClient("your-api-key")
    
    // Make requests
    conversations, err := client.Conversations.List()
}
```

[:material-language-go: View Go SDK Documentation](#){ .md-button }

## Community SDKs

In addition to our official SDKs, the community has created SDKs for other languages. While we don't officially maintain these, they may be helpful:

- **Rust**: [digivault-rs](#)
- **Java**: [digivault-java](#)
- **.NET**: [DigiVault.NET](#)

!!! info "Contributing"
    If you've built an SDK for DigiVault in another language, please [let us know](#) so we can add it to this list!

## SDK Features

All official DigiVault SDKs include:

- ✅ Full API coverage
- ✅ Type-safe responses
- ✅ Automatic retry logic
- ✅ Built-in rate limiting
- ✅ Webhook signature verification
- ✅ Comprehensive error handling
- ✅ Detailed documentation
- ✅ Regular updates and maintenance

## Getting Help

If you need help with any of our SDKs:

1. Check the SDK-specific documentation
2. Browse our [API Reference](index.md)
3. Join our [Discord community](#)
4. Open an issue on GitHub

