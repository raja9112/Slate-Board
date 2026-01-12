# Create Transactions

## Overview

Every transaction on the Fireblocks platform is initiated using the **Create a new transaction** API endpoint. Its default operation type is `TRANSFER`. Other valid `operation` values include:

- `TRANSFER`: Move funds between accounts. UTXO chains allow multi-input/output; account-based chains allow one source and one destination.
- `CONTRACT_CALL`: Call a smart contract method on any EVM chain.
- `PROGRAM_CALL`: Call Solana programs for Web3 operations.
- `TYPED_MESSAGE`: Sign an off-chain message (Ethereum Personal or EIP-712).
- `RAW`: Sign an arbitrary off-chain message (e.g., custom protocols).
- `MINT`: Increase token supply (Stellar, Ripple, EVM).
- `BURN`: Reduce token supply (Stellar, Ripple, EVM).

Sources/destinations can be OTAs, vault accounts, pre-whitelisted internal wallets, external/contract wallets, Fireblocks Network connections, or connected exchange/fiat accounts.

> Optional parameters can be added per asset/operation. Use `extraParameters` for contract calls, raw signing details, and UTXO selections. See the Optional parameters section below.

## Your first transaction

### Vault account to vault account (single destination, ETH)

```ts
const transactionPayload = {
  assetId: "ETH",
  amount: "0.001",
  source: { type: TransferPeerPathType.VaultAccount, id: "0" },
  destination: { type: TransferPeerPathType.VaultAccount, id: "1" },
  note: "Your first transaction!",
};

const createTransaction = async (transactionPayload: TransactionRequest) => {
  try {
    const res = await fireblocks.transactions.createTransaction({
      transactionRequest: transactionPayload,
    });
    console.log(JSON.stringify(res.data, null, 2));
    return res.data;
  } catch (e) {
    console.error(e);
  }
};

createTransaction(transactionPayload);
```

### Multiple-destination transfer (UTXO, BTC)

```ts
const transactionPayload = {
  assetId: "BTC",
  amount: "0.001",
  source: { type: TransferPeerPathType.VaultAccount, id: "1" },
  destinations: [
    { amount: "0.0005", destination: { type: TransferPeerPathType.VaultAccount, id: "2" } },
    { amount: "0.0005", destination: { type: TransferPeerPathType.VaultAccount, id: "3" } },
  ],
  note: "Your first multiple destination transaction!",
};

const createTransaction = async (transactionPayload: TransactionRequest) => {
  try {
    const res = await fireblocks.transactions.createTransaction({
      transactionRequest: transactionPayload,
    });
    console.log(JSON.stringify(res.data, null, 2));
    return res.data;
  } catch (e) {
    console.error(e);
  }
};
createTransaction(transactionPayload);
```

### Vault account to one-time address (OTA, ETH)

```ts
const transactionPayload = {
  assetId: "ETH",
  amount: "0.001",
  source: { type: TransferPeerPathType.VaultAccount, id: "1" },
  destination: {
    type: TransferPeerPathType.OneTimeAddress,
    oneTimeAddress: { address: "0x13277a70e3F48EEAD9C8a8bab12EbEDbC3DB6446" },
  },
  note: "Your first OTA transaction!",
};

const createTransaction = async (transactionPayload: TransactionRequest) => {
  try {
    const res = await fireblocks.transactions.createTransaction({
      transactionRequest: transactionPayload,
    });
    console.log(JSON.stringify(res.data, null, 2));
    return res.data;
  } catch (e) {
    console.error(e);
  }
};
createTransaction(transactionPayload);
```

> API idempotency: use `externalTxId` to prevent duplicate processing.

### Contract Call Transaction (EVM)

```ts
import { readFileSync } from "fs";
import {
  Fireblocks,
  BasePath,
  TransactionOperation,
  TransferPeerPathType,
} from "@fireblocks/ts-sdk";

const fireblocks = new Fireblocks({
  apiKey: "<API_KEY>",
  basePath: BasePath.US,
  secretKey: readFileSync("<PATH_TO_YOUR_SECRET>", "utf8"),
});

(async () => {
  const contractAddress = "0x43506849D7C04F9138D1A2050bbF3A0c054402dd";
  const contractCallData =
    "0x095ea7b3000000000000000000000000d09971d8ed6c6a5e57581e90d593ee5b94e348d4ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff";

  try {
    const tx = await fireblocks.transactions.createTransaction({
      transactionRequest: {
        operation: TransactionOperation.ContractCall,
        assetId: "ETH",
        source: { type: TransferPeerPathType.VaultAccount, id: "0" },
        destination: {
          type: TransferPeerPathType.OneTimeAddress,
          oneTimeAddress: { address: contractAddress },
        },
        amount: "0",
        extraParameters: { contractCallData },
      },
    });
    console.log(JSON.stringify(tx, null, 2));
  } catch (e) {
    console.log(e);
  }
})();
```

## Optional parameters

### externalTxId

Use a unique `externalTxId` to ensure idempotency (max 255 chars). Duplicate calls with the same ID are ignored.

```ts
const transactionPayload = {
  assetId: "ETH",
  amount: "0.001",
  externalTxId: "UniqueIdentifier",
  source: { type: TransferPeerPathType.VaultAccount, id: "0" },
  destination: { type: TransferPeerPathType.VaultAccount, id: "1" },
  note: "Your first transaction!",
};
```

### treatAsGrossAmount

If `true`, the network fee is deducted from the requested amount (default `false`).

```ts
const transactionPayload = {
  assetId: "ETH",
  amount: "0.001",
  treatAsGrossAmount: true,
  source: { type: TransferPeerPathType.VaultAccount, id: "0" },
  destination: { type: TransferPeerPathType.VaultAccount, id: "1" },
  note: "Your first treat as gross transaction!",
};
```

### fee (UTXO per-byte fee)

```ts
const transactionPayload = {
  assetId: "BTC",
  amount: "0.001",
  fee: "15", // sat/byte
  source: { type: TransferPeerPathType.VaultAccount, id: "0" },
  destination: { type: TransferPeerPathType.VaultAccount, id: "1" },
  note: "Your first high fee transaction!",
};
```

### feeLevel

`LOW` | `MEDIUM` (default) | `HIGH` for Ethereum, Solana, UTXO.

```ts
const transactionPayload = {
  assetId: "ETH",
  amount: "0.001",
  feeLevel: TransactionRequestFeeLevelEnum.High,
  source: { type: TransferPeerPathType.VaultAccount, id: "0" },
  destination: { type: TransferPeerPathType.VaultAccount, id: "1" },
  note: "Your first high fee level transaction!",
};
```

### failOnLowFee

If `true`, and the chosen fee level exceeds what is acceptable, the transaction fails to avoid being stuck.

```ts
const transactionPayload = {
  assetId: "ETH",
  amount: "0.001",
  failOnLowFee: true,
  source: { type: TransferPeerPathType.VaultAccount, id: "0" },
  destination: { type: TransferPeerPathType.VaultAccount, id: "1" },
  note: "Your first failOnLowFee transaction",
};
```

---

Reference: [Fireblocks Create Transactions](https://developers.fireblocks.com/reference/create-transactions)

