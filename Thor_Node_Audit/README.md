# Thor Node Audit
-------------------

### Findings

The audit in the Thor Node revealed several Low-Medium security risks within the smart contract. The locations of the flaws are as followed:

Medium: 1849
        1850
        1986
        
Low:    5
        19
        93
        323
        911
        1101
        
       
Below are the Smart Contract Weakness Classifications [Smart Contract Weakness](https://swcregistry.io/)

-------------------


## SWC-109: Uninitialized Storage Pointer
Dangerous use of uninitialized storage variables.
Uninitialized storage variables can point to unexpected storage locations. Initialize variable "_node" or set the storage attribute "memory".

### Severity: Medium

### Code
```
1846 |              uint256 newClaimTime = block.timestamp;
1847 |              uint256 nodesCount;
1848 |              uint256 claims = 0;
1849 |              NodeEntity[] storage nodes;
1850 |  >>>         NodeEntity storage _node;
 <<<
```
        
        
        
## SWC-103: Floating Pragma
A floating pragma is set.
The current pragma Solidity setting is ""^0.8.0"". It is recommended to specify a fixed compiler version to ensure that the bytecode produced doesn't vary between the builds. This is important if you rely on bytecode-level verification of code.

### Severity: Low

### Code
```
1561 |      }
1562 |      
1563 |      // OpenZeppelin Contracts v4.3.2 (finance/PaymentSplitter.sol)
1564 |      
1565 |  >>> pragma solidity ^0.8.0;
 <<<
```
        
