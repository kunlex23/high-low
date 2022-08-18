// SPDX-License-Identifier:MIT
pragma solidity >=0.7.0 <0.9.0;

contract high_low {

    uint totalContractBalance = 0;
    uint randNumb = 20;
    uint counter = 0;

    function getAccountBalance() public view returns(uint){
        return totalContractBalance;
    }
    
    mapping(address => uint) balances;
    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);

    function addBalance() public payable {
        balances[msg.sender] = msg.value;
        totalContractBalance = totalContractBalance + msg.value;
    }


    function roller () public {
        if (counter == 10){
            counter = 0;
            randNumb = 20;
        }
        if (counter < 7){
            randNumb = (randNumb * 2) - 15;
        } 
        else if (counter == 7 ){
            randNumb = 416;
        }
        else if (counter == 8 ){
            randNumb = 712;
        }
        else if (counter == 9 ){
            randNumb = 986;
        }

        counter = counter + 1; 
    }
    function callRoll () public view returns(uint256){
        return randNumb;}

     function transfer(address _to, uint256 _amount) public returns (bool success) {
        balanceOf[msg.sender] -= _amount;
        balanceOf[_to] += _amount;
        emit Transfer(msg.sender, _to, _amount);
        return true;
    }
    
}
