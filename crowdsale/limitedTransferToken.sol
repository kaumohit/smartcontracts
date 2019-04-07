pragma solidity ^0.4.18;

import "./ERC20.sol";

contract LimitedTransferToken is ERC20 {

  modifier canTransfer(address _sender, uint256 _value) {
   require(_value <= transferableTokens(_sender, uint64(now)));
   _;
  }

  function transfer(address _to, uint256 _value) canTransfer(msg.sender, _value) public returns (bool) {
    return super.transfer(_to, _value);
  }

  function transferFrom(address _from, address _to, uint256 _value) canTransfer(_from, _value) public returns (bool) {
    return super.transferFrom(_from, _to, _value);
  }

  function transferableTokens(address holder, uint64 time) public view returns (uint256) {
    return balanceOf(holder);
  }
}