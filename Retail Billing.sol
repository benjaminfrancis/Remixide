pragma solidity ^0.8.0;

contract RetailBilling {
    string public supermarketName;
    uint256 public totalAmount;
    
    event ItemPurchased(string itemDescription, uint256 quantity, uint256 itemPrice, uint256 itemAmount);
    
    constructor(string memory _supermarketName) {
        supermarketName = _supermarketName;
    }
    
    function itemPurchase(string memory itemDescription, uint256 quantity, uint256 itemPrice) public {
        uint256 itemAmount = quantity * itemPrice;
        totalAmount += itemAmount;
        emit ItemPurchased(itemDescription, quantity, itemPrice, itemAmount);
    }
    
    function printTotalAmount(string memory reasonForTotal) public view returns (uint256) {
        uint256 discountAmount = (totalAmount * 5) / 100;
        uint256 netTotalAmount = totalAmount - discountAmount;
        uint256 gstTax = (netTotalAmount * 7) / 100;
        uint256 cgstTax = (netTotalAmount * 7) / 100;
        uint256 totalWithTax = netTotalAmount + gstTax + cgstTax;
        
        // Print Total Amount
        return totalWithTax;
    }
}

†========
Supermarket Name: [Name]

Item Description     Quantity    Item Price    Amount
-----------------------------------------------------
[Item 1]             [Qty 1]     [Price 1]     [Amount 1]
[Item 2]             [Qty 2]     [Price 2]     [Amount 2]
...
[Item n]             [Qty n]     [Price n]     [Amount n]

Gross Total Amount: [Total Amount]
Discount (5%):      [Discount Amount]
Total Amount after discount: [Net Total Amount]

GST (7%):            [GST Tax]
CGST (7%):           [CGST Tax]

Net Total Amount:    [Total Amount with Tax]
