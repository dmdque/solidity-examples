pragma solidity ^0.4.18;


import "truffle/Assert.sol";
import "../contracts/Contract.sol";


contract ExposedContract is Contract {
    function _identity(uint a) public returns (uint) {
        return identity(a);
    }
}


contract TestContract {
    ExposedContract e;
    function beforeEach() public {
        e = new ExposedContract();
    }
    function testIdentity() public {
        uint input = 5;
        uint output = e._identity(input);
        Assert.equal(output, input, "should equal input");
    }
}
