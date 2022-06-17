require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-ethers");
require("@nomiclabs/hardhat-etherscan");
/**
 * @type import('hardhat/config').HardhatUserConfig
*/
const Private_Key = "17f708ff8cc8344e7896fb7135aa0c238a21c53d8259f10f75087cf898331850"
const Private_Key_Ropsten = "17f708ff8cc8344e7896fb7135aa0c238a21c53d8259f10f75087cf898331850"
module.exports = {
  solidity: "0.8.6",
  defaultNetwork: "ropsten",
   networks: {
  	ropsten: {
  		url: `https://ropsten.infura.io/v3/d81b9afadfb24ff9ab476239cc4a988d`,
  		accounts: [`0x${Private_Key}`]
  	}
  },
 etherscan: {
     apiKey: 'B4513921RMMQBY1VFY4KH79KVW11SJ895G'
  },
};
