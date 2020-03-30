pragma solidity ^0.4.11;
import '../node_modules/zeppelin-solidity/contracts/token/ERC20/StandardToken.sol';
contract GC is StandardToken{
	string public name='Game Chain';
	string public symbol='GC';
	uint public decimals=9;
  uint public INITIAL_SUPPLY=1000000000000000000;
  uint award = 100000000;
  uint start;
  event Award(address to,uint256 val);
  
  /**
   * @dev Contructor that gives msg.sender all of existing tokens.
   */
  function GC() {
    totalSupply_ = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
    start = now;
  }

  function transferEther(address to, uint256 ratio,uint256 sum,uint256 amount) public view returns(bool) {
    require(amount>0 && ratio>0 && sum>0 && sum>ratio);
    uint256 val = amount.mul(ratio).div(sum);
    require (val>0 && this.balance>=val);
    to.transfer(val);
    return true;
  }

  function batchTransferEther(address[] addrs,uint256[] scores,uint256 sum,uint256 amount) public view returns(bool) {
    require(sum>0 && amount>0 && addrs.length>0 && addrs.length==scores.length);
    for(uint j=0;j<addrs.length;j++){
      uint256 val = amount.mul(scores[j]).div(sum);

      require (val>0 && this.balance>=val);
      
      addrs[j].transfer(val);
      Award(addrs[j],val);
    }
    
    return true;
  }


  function deposit() payable public{

  }

  function transferToken(address to, uint256 ratio,uint256 sum,uint256 amount) public view returns(bool){
    require(amount>0 && ratio>0 && sum>0 && sum>ratio);
    uint256 val = amount.mul(ratio).div(sum);
    require(val>0 && balances[msg.sender]>=val);
    balances[msg.sender] = balances[msg.sender].sub(val);
    balances[to] = balances[to].add(val);
    return true;
  }

  function batchTransferToken(address[] addrs,uint256[] scores,uint256 sum,uint256 amount) public view returns(bool) {
    require(sum>0 && amount>0 && addrs.length>0 && addrs.length==scores.length);
    for(uint j=0;j<addrs.length;j++){
      uint256 val = amount.mul(scores[j]).div(sum);
      require (val>0 && balances[msg.sender]>=val); 
      balances[msg.sender] = balances[msg.sender].sub(val);
      balances[addrs[j]] = balances[addrs[j]].add(val);
    }
    
    return true;
  }

  function getAward() public constant returns(uint256){
    uint min = (now-start)/1 minutes ;
    return award/(2**min);
  }

  function getBalance() public constant returns(uint256){
    return this.balance;
  }
}
