const CryptoJS = require("crypto-js");

function MerkleRoot(addresses) {
  return addresses.reduce(
    (hashes, address) => CryptoJS.SHA256(address).toString(CryptoJS.enc.Hex),
    ""
  );
}

function verifyMerkleRootAdd(merkleRoot, addressToVerify, addresses) {
  return (
    addresses.includes(addressToVerify) && merkleRoot === MerkleRoot(addresses)
  );
}

const addresses = [
  "0x111111111111111111111111111111111",
  "0x2222222222222222222222222222222222222222",
  "0x3333333333333333333333333333333333333333",
  "0x4444444444444444444444444444444444444444444444",
  "0x5555555555555555555555555555555555555555",
];

const merkleRoot = MerkleRoot(addresses);
console.log("Merkle Root:", merkleRoot);

const addressToVerify = "0x3333333333333333333333333333333333333333";
const isAddressInMerkleRoot = verifyMerkleRootAdd(
  merkleRoot,
  addressToVerify,
  addresses
);

console.log(
  `Address ${addressToVerify} ${
    isAddressInMerkleRoot ? "is" : "is NOT"
  } part of the Merkle root.`
);
