const { expect } = require("chai");


describe("Hi this is Nexo test defi contract", function ()  {

    let Nexo, myNexo, owner, addr1, addr2;
 
    beforeEach ( async () => {

      
      const Nexo = await ethers.getContractFactory("Nexo");
      myNexo = await Nexo.deploy();
      

    })
     it("Making a deposit of 0.1 ethereum which will be swapped to DAI on Uniswap.", async function () {

      const [owner] = await ethers.getSigners();

       const deposit1Eth = await myNexo.connect(owner).swapETHToUSDC({value: ethers.utils.parseUnits("0.1", "ether").toHexString()});
   
    })

    it("Cheking Strategy Balance", async function () {

        const strategyBalance = await myNexo.getStrategyEthBalance();

    

    //console.log("Strategy Balance : ",strategyBalance);// User Eth deposits ;", userETHBalance); //returns big number 
   
    })

    it("Cheking User Eth Balance", async function () {

        const userEthBalance = await myNexo.getStrategyEthBalance();

    
    //console.log("User Eth Balance : ",formatEther(userEthBalance,18));// User Eth deposits ;", userETHBalance); //returns big number 
   
    })
      it("Initiating IRREVERSIBLE contract shutdown ", async function () {

        const WithdrawEth = await myNexo.connect(owner).shutDownContract();

    

    //console.log("User Eth Balance : ",formatEther(userEthBalance,18));// User Eth deposits ;", userETHBalance);
   
    })




      it("Withdrawing/decrasing Stake from the contract by ETH 0.01(Converted from DAI to ETH).", async function () {
        const [owner] = await ethers.getSigners();

        const WithdrawEth = await myNexo.connect(owner).witdrawPartialStake(ethers.utils.parseUnits("0.01", "ether").toHexString());

    

    //console.log("User Eth Balance : ",formatEther(userEthBalance,18));// User Eth deposits ;", userETHBalance);
   
    })

     



});