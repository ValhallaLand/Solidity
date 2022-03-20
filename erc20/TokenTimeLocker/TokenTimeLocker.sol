// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

import "./IERC20.sol";
import "./SafeERC20.sol";
import "./Context.sol";

contract TokenTimeLocker is Context
{
    using SafeERC20 for IERC20;

    address public constant _marketingWallet = 0xE72E3D8017064934F054290E8eDb2E321cE62Da5;
    address public constant _teamWallet = 0x3fD8B95f2dB23B17C4c2275E04A73803390f1482;
    address public constant _seedWallet = 0x2991CD5c95B089dFb09B44D2f8687C9dEA2C4aDd;
    address public constant _privateWallet = 0xAA58939a62ACb293e152E59F21Ce3b7aAADa9707;

    uint256 private constant _partLockAmount = 500000e18;

    struct TokenLock {
        uint256 amount;
        uint256 deadline;
    }

    mapping (address => TokenLock[]) public _holders;
    mapping (address => uint256) private _indexesLocks;

    IERC20 private _token;

    event Released(address indexed beneficiary, uint256 amount);

    constructor(address token) {
        require(token != address(0), "Zero address for token");
        _token = IERC20(token);

        addLock(0xCCc1921491c55B7321d384b0CF2F504F94b81EF9, _partLockAmount, block.timestamp + 3 * 30 days);
        addLock(0xCCc1921491c55B7321d384b0CF2F504F94b81EF9, _partLockAmount, block.timestamp + 6 * 30 days);
        addLock(0xCCc1921491c55B7321d384b0CF2F504F94b81EF9, _partLockAmount, block.timestamp + 9 * 30 days);

        addLock(0xf86A54fEe000f8A2F521F83202e1056A0486DE09, _partLockAmount, block.timestamp + 3 * 30 days);
        addLock(0xf86A54fEe000f8A2F521F83202e1056A0486DE09, _partLockAmount, block.timestamp + 6 * 30 days);
        addLock(0xf86A54fEe000f8A2F521F83202e1056A0486DE09, _partLockAmount, block.timestamp + 9 * 30 days);

        addLock(0x1644A35e915F4dDbfE088E7A7C1c77595CF77067, _partLockAmount, block.timestamp + 3 * 30 days);
        addLock(0x1644A35e915F4dDbfE088E7A7C1c77595CF77067, _partLockAmount, block.timestamp + 6 * 30 days);
        addLock(0x1644A35e915F4dDbfE088E7A7C1c77595CF77067, _partLockAmount, block.timestamp + 9 * 30 days);   

        addLock(_marketingWallet, 1000000e18, block.timestamp + 4 * 30 days);
        addLock(_marketingWallet, 500000e18, block.timestamp + 5 * 30 days);
        addLock(_marketingWallet, 500000e18, block.timestamp + 6 * 30 days);
        addLock(_marketingWallet, 500000e18, block.timestamp + 7 * 30 days);
        addLock(_marketingWallet, 500000e18, block.timestamp + 8 * 30 days);
        addLock(_marketingWallet, 500000e18, block.timestamp + 9 * 30 days);
        addLock(_marketingWallet, 500000e18, block.timestamp + 10 * 30 days);
        addLock(_marketingWallet, 500000e18, block.timestamp + 11 * 30 days);
        addLock(_marketingWallet, 500000e18, block.timestamp + 12 * 30 days);
        addLock(_marketingWallet, 500000e18, block.timestamp + 13 * 30 days);
        addLock(_marketingWallet, 500000e18, block.timestamp + 14 * 30 days);
        addLock(_marketingWallet, 500000e18, block.timestamp + 15 * 30 days);
        addLock(_marketingWallet, 500000e18, block.timestamp + 16 * 30 days);
        addLock(_marketingWallet, 500000e18, block.timestamp + 17 * 30 days);
        addLock(_marketingWallet, 500000e18, block.timestamp + 18 * 30 days);
        addLock(_marketingWallet, 500000e18, block.timestamp + 19 * 30 days);
        addLock(_marketingWallet, 500000e18, block.timestamp + 20 * 30 days);
        addLock(_marketingWallet, 500000e18, block.timestamp + 21 * 30 days);
        addLock(_marketingWallet, 500000e18, block.timestamp + 22 * 30 days);        
        
        addLock(_teamWallet, 1200000e18, block.timestamp + 12 * 30 days);
        addLock(_teamWallet, 600000e18, block.timestamp + 15 * 30 days);
        addLock(_teamWallet, 600000e18, block.timestamp + 18 * 30 days);
        addLock(_teamWallet, 600000e18, block.timestamp + 21 * 30 days);
        addLock(_teamWallet, 600000e18, block.timestamp + 24 * 30 days);
        addLock(_teamWallet, 600000e18, block.timestamp + 27 * 30 days);
        addLock(_teamWallet, 600000e18, block.timestamp + 30 * 30 days);
        addLock(_teamWallet, 600000e18, block.timestamp + 33 * 30 days);
        addLock(_teamWallet, 600000e18, block.timestamp + 36 * 30 days);
        
        addLock(_seedWallet, 750000e18, block.timestamp + 3 * 30 days);
        addLock(_seedWallet, 750000e18, block.timestamp + 6 * 30 days);
        addLock(_seedWallet, 750000e18, block.timestamp + 9 * 30 days);
        addLock(_seedWallet, 750000e18, block.timestamp + 12 * 30 days);
        addLock(_seedWallet, 750000e18, block.timestamp + 15 * 30 days);
        addLock(_seedWallet, 750000e18, block.timestamp + 18 * 30 days);
        addLock(_seedWallet, 500000e18, block.timestamp + 21 * 30 days);

        addLock(_privateWallet, 3600000e18, block.timestamp + 3 * 30 days);
        addLock(_privateWallet, 3600000e18, block.timestamp + 6 * 30 days);
        addLock(_privateWallet, 3600000e18, block.timestamp + 9 * 30 days);
        addLock(_privateWallet, 3600000e18, block.timestamp + 12 * 30 days);
        addLock(_privateWallet, 3600000e18, block.timestamp + 15 * 30 days);
        addLock(_privateWallet, 2400000e18, block.timestamp + 18 * 30 days);
        
    }

    function release() external {
        uint256 unreleased = currentReleasableAmount(_msgSender());
        require(unreleased > 0, "Insufficient token amount to realise");
        require(_token.balanceOf(address(this)) >= unreleased, "Insufficient token amount to realise");

        _token.safeTransfer(_msgSender(), unreleased);

        emit Released(_msgSender(), unreleased);

        completedRelease(_msgSender());
    }

    function totalLock(address beneficiary) external view returns(uint256) {
        uint256 totalAmount = 0;

        for (uint256 i = _indexesLocks[beneficiary]; i < _holders[beneficiary].length; i++) {
            totalAmount += _holders[beneficiary][i].amount;
        }

        return totalAmount;
    }

    function currentReleasableAmount(address beneficiary) public view returns(uint256) {
        uint256 amount = 0;
        uint256 currentIndex = _indexesLocks[beneficiary];

        if (currentIndex < _holders[beneficiary].length && _holders[beneficiary][currentIndex].deadline <= block.timestamp && _holders[beneficiary][currentIndex].amount > 0) {         
            amount = _holders[beneficiary][currentIndex].amount;
        }

        return amount;
    }

    function addLock(address beneficiary, uint256 amount, uint256 deadline) private {
        require(beneficiary != address(0), "Zero address");

        TokenLock memory tl = TokenLock({
                                    amount: amount,
                                    deadline: deadline
                                });
                                
        _holders[beneficiary].push(tl);
    }

    function completedRelease(address beneficiary) private {
        uint256 currentIndex = _indexesLocks[beneficiary];

        _holders[beneficiary][currentIndex].amount = 0;
        _indexesLocks[beneficiary]++;
    }
    
}