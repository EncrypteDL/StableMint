// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8;

contract Proxy{
    address public owner;
    event SetOwner(address indexed owner);

    modifier auth() {
        require(msg.sender == owner, "not authorized");
        _;
    }

    constructor(address _owner){
        owner = _owner;
        emit SetOwner(_owner);
    }

    receive() external payable {}

    // function set_owner(address _owner) external auth{
    //     owner = _owner
    //     emit SetOwner(_owner);
    // }

    function set_owner(address _owner) external auth {
        owner = _owner;
        emit SetOwner(_owner);
    }

    function execute(address target, bytes calldata data)
        external
        payable
        auth
        returns (bytes memory res)
    {
        bool ok;
        (ok, res) = target.delegatecall(data);
        require(ok, "execute failed");
    }

}