// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/Context.sol";

contract BurnBaby is Context {
    using SafeERC20 for IERC20;

    address public constant burnAddress =
        0x000000000000000000000000000000000000dEaD;

    event Burn(
        address indexed token,
        address indexed from,
        address indexed to,
        uint256 amount
    );

    function burn(address token, uint256 value) public returns (bool) {
        require(token != address(0), "Burn: allowence from the zero address");

        IERC20(token).safeTransferFrom(_msgSender(), burnAddress, value);

        emit Burn(token, _msgSender(), burnAddress, value);
        return true;
    }
}
