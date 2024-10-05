// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8;

interface IAccessConrol {
    //can
    function can(address owner, address user) external view returns (bool);
    //hope 
    function allow_account_modification(address user ) external;
    //nope 
    function deny_account_modification(address user) external;
    //wish 
    function can_modify_account(address owner, address user)
        external
        view
        returns (bool);
    
}