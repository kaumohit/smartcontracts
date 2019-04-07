pragma solidity ^0.4.18;


import './limitedTransferSmartToken.sol';

contract TestSmartToken is LimitedTransferSmartToken {

    string public name = "TEST TOKEN";

    string public symbol = "TEST";

    uint8 public decimals = 18;

    function TestSmartToken() public {
        NewSmartToken(address(this));
    }
}
