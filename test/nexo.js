const { expect } = require("chai");

describe("Nexo defi contract", function () {
  it("Get Balance contract", async function () {
    const [owner] = await ethers.getSigners();

    const Nexo = await ethers.getContractFactory("Nexo");

    const hardhatNexo = await Nexo.deploy();

    const ownerBalance = await hardhatNexo.getNexoBalance();
   
  });
});