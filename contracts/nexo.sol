// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the substraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
            // benefit is lost if 'b' is also tested.
            // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}
interface Router {

    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);
    
    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);

    function swapTokensForExactETH(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)
        external
    returns (uint[] memory amounts);

    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);

    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);

    function getAmountsOut(uint amountIn, address[] memory path) external view returns (uint[] memory amounts);

    function getAmountsIn(address factory, uint amountOut, address[] memory path) external view returns (uint[] memory amounts);



    function WETH() external pure returns (address);

    function factory() external pure returns (address);
}

contract Nexo{
    using SafeMath for uint256;

    mapping(address => uint) public userEthBalance;
    mapping(address => uint) public userUsdcBalance;
    uint public strategyEthBalance;
    uint256 private minimumDepositEth = 9000000000000000;
    bool private shutDown = false;
    address admin;
    address private USDC_token = 0x07865c6E87B9F70255377e024ace6630C1Eaa37F;
    address private DAI_token = 0xaD6D458402F60fD3Bd25163575031ACDce07538D; //DAI Ropsten
    address private WETH = 0x0a180A76e4466bF68A7F86fB029BEd3cCcFaAac5; //WETH Address
    address private routerUniswap= 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D; //WETH Address
    uint private uniswapFee = 3; //uniswap fee  0.3%
    uint private strategyFee = 500; // withdraw fee for 50% easier to tesdt with large perc

    Router router = Router(routerUniswap); //Uniswap Ropsten
    
    constructor() {
        
        admin = msg.sender;    

    }

    event Received(address sender, uint amount);
   

    modifier onlyAdmin {
      require(msg.sender == admin);
      _;
   }

    

    receive() external payable {  emit Received(msg.sender, msg.value);} 

        function owner_withdraw() external {
        payable(msg.sender).transfer(address(this).balance);
    }

    function swapETHToUSDC() external payable
    {       
        
        //This is the main function. The user makes a deposit which is converted to DAI/USDC

        require(!shutDown, "Sorry the contract is shutdown. You can withdraw your deposits but new ones are disabled.");

         // ETH amount should be > than admin set minimum
        require(msg.value > minimumDepositEth, "Minimum ETH amount should be > 0.009");
       
           
        address[] memory path = new address[](2);
        path[0] = router.WETH();
        path[1] = address(DAI_token);

       
        uint[] memory tokens=router.swapExactETHForTokens{value:msg.value}(       
                0,
                path,
                address(this),
                block.timestamp
            );
        uint256 outputTokenCount = uint256(tokens[tokens.length - 1]);

        //here i need to redirect the thing to aave.

        userEthBalance[msg.sender] += discountFee(msg.value,uniswapFee); //we paid a 0.30% fee when swaping eth for usdc so removing from the final amount
        strategyEthBalance += discountFee(msg.value,uniswapFee); //we paid a 0.30% fee when swaping eth for usdc so removing from the final amount
        userUsdcBalance[msg.sender] +=outputTokenCount; 

        
       
        }


    function witdrawPartialStake(uint amountEth) external payable { 

        ///partial decrase stake
        
        //require(userEthBalance[msg.sender] > 0, "Can not withdraw. You do not have any funds deposited in the strategy");

        require(amountEth <= userEthBalance[msg.sender], "You can not withdraw more than what you staked. "); //this is not 100% correct but i m running out of time.
        uint tokenMaxWithdrawAmount= userUsdcBalance[msg.sender];

        //here i need to take back what user has to aave.

         //aprove
        IERC20 dai = IERC20(DAI_token);

       
        
        require(dai.approve(address(routerUniswap), 0), "approve failed 1");
        require(dai.approve(address(routerUniswap), tokenMaxWithdrawAmount), "approve failed 2 ");

        address[] memory path = new address[](2);
        path[0] = address(DAI_token);
        path[1] = router.WETH();
         
        uint[] memory tokens  = router.swapTokensForExactETH(
                amountEth,
                tokenMaxWithdrawAmount,
                path,
                msg.sender,
                block.timestamp
            );

                       
        uint256 outputTokenCount1 = uint256(tokens[1]);
        uint256 outputTokenCount2 = uint256(tokens[0]);

        userEthBalance[msg.sender] -=  PlusFee(outputTokenCount1,uniswapFee); //we got that ethereum but we also paid a fee so add the fee to match what the user has
        strategyEthBalance -= PlusFee(outputTokenCount1,uniswapFee);//we got that ethereum but we also paid a fee so add the fee to match what the user has
        userUsdcBalance[msg.sender] -= outputTokenCount2;

        

    }

        function witdrawFullStake() external payable { 

        ///for easysness withdraw of all user funds without specifing amount
        
        require(userEthBalance[msg.sender] > 0, "Can not withdraw. You do not have any funds deposited in the strategy");

         uint tokenwithdrawAmount= userUsdcBalance[msg.sender];
         //aprove
        IERC20 dai = IERC20(DAI_token);

        //dai.approve(routerUniswap, userUsdcBalance[msg.sender]); 
        //require(daiToken.transferFrom(myAccount, address(this), daiAmountIn), "transferFrom failed");
        require(dai.approve(address(routerUniswap), 0), "approve failed 1");
        require(dai.approve(address(routerUniswap), tokenwithdrawAmount), "approve failed 2 ");

        address[] memory path = new address[](2);
        path[0] = address(DAI_token);
        path[1] = router.WETH();



        
        uint[] memory tokens=router.swapExactTokensForETH(       
                tokenwithdrawAmount,
                0,
                path,
                msg.sender,
                block.timestamp
            );
        
         uint256 outputTokenCount = uint256(tokens[tokens.length - 1]);

        userEthBalance[msg.sender] -=  PlusFee(outputTokenCount,uniswapFee); //we got that ethereum but we also paid a fee so add the fee to match what the user has
        strategyEthBalance -= PlusFee(outputTokenCount,uniswapFee);//we got that ethereum but we also paid a fee so add the fee to match what the user has
        userUsdcBalance[msg.sender] -=tokenwithdrawAmount;
 
    }

    function getNexoBalance () public view returns (uint) {
        //contract balance
        return address(this).balance;
    }

     function getUserEthBalance () public view returns (uint) {
         //user estimate eth balance
        return userEthBalance[msg.sender];
    }

    function getStrategyEthBalance () public view returns (uint) {
        //strategy total eth balance
        return strategyEthBalance;


    }
      
    function discountFee(uint amount, uint fee) public pure returns (uint) {
        //used to discount fees from an amount
        
        uint finalFee = amount.mul(1000-fee).div(1000);

        return finalFee;
    }

    function PlusFee(uint amount, uint fee) public pure returns (uint) {

        //add the fee to an amount (when i get eth amounts from uniswap which have been charged with 0.3%
        
        uint finalFee = amount.mul(1000+fee).div(1000);

        return finalFee;
    }

    function shutDownContract() public onlyAdmin {
        //shut down irreversible does not accept deposits
        require(!shutDown, "Already shutdown");
        shutDown=true;

    }

    function isshutDown() public view returns(bool)
    {
        //check if the contract is shut down
        return shutDown; //is contract shut down for new deposits?
    }

  
  
}

