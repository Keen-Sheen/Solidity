pragma solidity ^0.5.0;

contract TradeController {
    uint previousPrice;
    string tradeType;

    function makeTrade (uint currentPrice, bool buyAnyway) public{
        if (currentPrice < previousPrice || buyAnyway) {
             tradeType = "Buy";
             previousPrice = currentPrice;
        }
        else if (currentPrice > previousPrice) {
            tradeType = "Sell";
            previousPrice = currentPrice;   
        }

        else {
            tradeType = "Hold";
        }
    }
}