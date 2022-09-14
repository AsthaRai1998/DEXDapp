
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./Token.sol";

contract DEX{

  mapping (address => bool) public tokenAddressess;
    Token public token1;
    address public owner1;
    uint public amount1;
    Token public token2;
    address public owner2;
    uint public amount2;

    constructor(
        address _token1,
        address _owner1,
        uint _amount1,
        address _token2,
        address _owner2,
        uint _amount2
    ) {
        token1 = Token(_token1);
        owner1 = _owner1;
        amount1 = _amount1;
        token2 = Token(_token2);
        owner2 = _owner2;
        amount2 = _amount2;

    }

    function Register(address TAddress) public {
        tokenAddressess[TAddress]=  true ;
    }

     function trade() public {
      

        _safeTransferFrom(token1, owner1, owner2, amount1);
        _safeTransferFrom(token2, owner2, owner1, amount2);
    }
    function _safeTransferFrom(
        Token token,
        address sender,
        address recipient,
        uint amount
    ) private {
        bool sent = token.transferFrom(sender, recipient, amount);
        require(sent, "Token transfer failed");
    }
    

  //  function PriceOfToken(address NumeratorAddress, address DenominatorAddress) public returns(uint256){
  //     Token token1 = Token(NumeratorAddress);
  //     Token token2 = Token(DenominatorAddress);

  //     uint256 price= token1.balanceOf(NumeratorAddress)/token2.balanceOf(DenominatorAddress);
  //     return(price);
  //  }
  // 
     

}
