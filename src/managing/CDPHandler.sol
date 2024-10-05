// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8;

import {ICDPEngine} from "../interface/ICDPEngine.sol";

contract CDPHandler {
    constructor(address cdp_engine) {
        ICDPEngine(cdp_engine).allow_account_modification(msg.sender);
    }
}

