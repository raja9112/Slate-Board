# Boost Transactions

Based on the Fireblocks “Boost Transactions” guidance ([reference](https://developers.fireblocks.com/reference/boost-transactions)).

## Overview
Child Pays For Parent (CPFP) lets you speed up a stuck UTXO transaction by sending a child transaction with a higher fee that spends one of the parent’s outputs.

**Prerequisites**
- Parent tx not older than 10 days and visible in mempool.
- Parent is marked **Completed** in Fireblocks (unless you spend its change output).
- You know at least one output (txHash + index) from the parent to spend in the child.

**When to use CPFP vs RBF**
- CPFP: pay a new high fee on a child that spends the parent’s output.
- RBF (EVM): replace pending tx with higher fee instead.

## Steps to boost (CPFP)
1. Confirm parent tx age < 10 days; switch to **Completed** if needed.
2. Pick at least one parent output (txHash/index) to use as child input.
3. Set a high custom fee (sat/byte) for the child.
4. Build the child transaction:
   - `source`: the destination of the stuck parent (or any destination you choose).
   - `destination`: can be the same vault or another destination.
   - `amount`: sum (or less) of the selected parent outputs.
   - `fee`: custom high value (don’t use `feeLevel`).
   - `extraParameters.inputsSelection.inputsToSpend`: include the chosen parent outputs.
5. Submit the child transaction.

## Important notes
1. Parent older than 10 days → contact Support.
2. If parent not **Completed**, set confirmation threshold to zero or spend change output.
3. If parent not in mempool and source is yours, consider Transaction Replacement (RBF).

## Example (ts-sdk)
```ts
let txPayload = {
  assetId: "BTC_TEST",
  amount: "0.001",
  fee: "1000", // sat/byte
  source: { type: TransferPeerPathType.VaultAccount, id: "0" },
  destination: { type: TransferPeerPathType.VaultAccount, id: "1" },
  extraParameters: {
    inputsSelection: {
      inputsToSpend: [
        { txHash: "24f769af0c2b67965ae4b95583c049e0a8ba08f1c142676c9fc9fcaac5ad12a3", index: 0 },
      ],
    },
  },
  note: "Your CPFP transaction!",
};

const createTransaction = async (payload: TransactionRequest) => {
  try {
    const result = await fireblocks.transactions.createTransaction({
      transactionRequest: payload,
    });
    console.log(JSON.stringify(result.data, null, 2));
    return result.data;
  } catch (error) {
    console.error(error);
  }
};
createTransaction(txPayload);
```

## Summary checklist
- Parent tx < 10 days and in mempool.
- Mark parent **Completed** (unless using change output).
- Use custom high `fee`; avoid `feeLevel`.
- Specify parent outputs in `extraParameters.inputsSelection.inputsToSpend`.

