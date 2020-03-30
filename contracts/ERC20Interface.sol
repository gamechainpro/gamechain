pragma solidity ^0.4.11;

contract ERC20Interface {
      // 获取总的支持量
      function totalSupply() constant returns (uint256 totalSupply);
      // 获取其他地址的余额
      function balanceOf(address _owner) constant returns (uint256 balance);
      // 向其他地址发送token
      function transfer(address _to, uint256 _value) returns (bool success);
      // 从一个地址想另一个地址发送余额
      function transferFrom(address _from, address _to, uint256 _value) returns (bool success);
      //允许_spender从你的账户转出_value的余额，调用多次会覆盖可用量。某些DEX功能需要此功能
      function approve(address _spender, uint256 _value) returns (bool success);
      // 返回_spender仍然允许从_owner退出的余额数量
      function allowance(address _owner, address _spender) constant returns (uint256 remaining);
      // token转移完成后出发
      event Transfer(address indexed _from, address indexed _to, uint256 _value);
      // approve(address _spender, uint256 _value)调用后触发
      event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}