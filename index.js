// Pass the repo name
const recipe = "collection-for-holding-nfts";

//Generate paths of each code file to render
const contractPath = `${recipe}/cadence/contract.cdc`;
const transactionPath = `${recipe}/cadence/transaction.cdc`;

//Generate paths of each explanation file to render
const smartContractExplanationPath = `${recipe}/explanations/contract.txt`;
const transactionExplanationPath = `${recipe}/explanations/transaction.txt`;

export const collectionForHoldingNfts = {
  slug: recipe,
  title: "Collection for Holding NFTs",
  description: "",
  createdAt: Date(2022, 9, 14),
  author: "Flow Blockchain",
  playgroundLink:
    "https://play.onflow.org/41befd2d-31f3-47f0-ae30-aad776961e31?type=tx&id=88850298-bed1-4bb9-b77e-4df200f76278&storage=none",
  excerpt:
    "This resource holds your NFTS in a collection in your account.",
  smartContractCode: contractPath,
  smartContractExplanation: smartContractExplanationPath,
  transactionCode: transactionPath,
  transactionExplanation: transactionExplanationPath,
};
