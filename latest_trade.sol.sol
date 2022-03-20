pragma solidity ^0.5.0;

contract latestTrade {
    string coin = "XRP";
    uint price;
    bool  isBuyOrder;

    function undateTrade(string memory new_coin, uint new_price, bool is_buy) public {
    coin = new_coin;
    price = new_price;
    is_buy_order = is_buy;
    }

    function getTrade() public returns (string memory, uint, bool) {
    return (coin, price, is_buy_order);
    }

    function setTrade(string memory new_coin, uint new_price, bool is_buy) public {
     coin = new_coin;
    price = new_price;
    is_buyorder = is_buy;
    }
contract PersonalSavings {
    address payable public public_savings = 0x081304bbda303b81c01f16f12ab59ee26dd73bc684dad5f6a0efa1e1ca0029bb
    address payable private_savings = 0xd8d55d7eca398dc213bfe30a2a24059693e2fa3c0e008fb075d5f492118a7d26
    string account_holder = "SBI Holdings"
}
    function withdrawl(uint amount, address payable recipient) public {
        return recipient.transfer(amount);
    }
    function deposit() public payable {

    }
}