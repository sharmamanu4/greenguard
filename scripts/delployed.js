const hre = require("hardhat");

async function main() {
  const GreenGuard = await hre.ethers.getContractFactory("GreenGuard");
  const greenGuard = await GreenGuard.deploy();

  await greenGuard.deployed();
  console.log("GreenGuard deployed to:", greenGuard.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error("Error in deployment:", error);
    process.exit(1);
  });
