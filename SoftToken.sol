pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/SafeERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/crosschain/interfaces/IInterchain.sol";

contract SoftToken is AccessControl, IInterchain {
    using SafeERC20 for uint256;

    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(string memory _name, string memory_symbol, uint8 _decimals, uint256 _totalSupply) public {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _totalSupply;
        balanceOf[msg.sender] = _totalSupply;
    }

    function _transfer(address from, address to, uint256 value) internal {
        require(from != address(0));
        require(to != address(0));

        require(balanceOf[from] >= value);
        require(balanceOf[to] + value >= balanceOf[to]);

        emit Transfer(from, to, value);

    }
    
    function transfer(address to, uint256 value) public virtual {
        require(checkAccess(msg.sender));
        _transfer(msg.sender, to, value);
    }

    function transferFrom(address from, address to, uint256 value) public virtual {
        require(checkAccess(from));
        require(to != address(0));

        require(balanceOf[from] >= value);
        require(balanceOf[to] + value >= balanceOf[to]);
        require(allowance[from][msg.sender] >= value);

        emit Transfer(from, to, value);

    }

    function setInterchain(address _interchain) public virtual {
        require(checkAccess(msg.sender));
        IInterchain(_interchain).transfer(address(this), _recipient, _value);
    }

}
