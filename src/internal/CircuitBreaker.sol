// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8;

abstract contract CircuitBreaker {
    event Stop(); 

    //live 
    bool public live;

    modifier not_supported(){
        require(live, "stopped");
        _;
    }

    constructor(){
        live = true;
    }

    //cage 
    function _stop() internal{
        require(live, "stopped");
        live = false;
        emit Stop();
    }
}
