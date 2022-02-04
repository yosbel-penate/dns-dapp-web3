pragma solidity ^0.8.7;

contract Payabel{
    uint constant public handlingCost =  1800000000000000;
    struct URL{
        string name;
        string[] onions;
    }
    address payable public owner;
    mapping(address=>URL[]) public URLsByOwner;
    mapping(string=>string[]) public nameOnions;
    mapping(string => bool) public nameExist;
    constructor()payable{
        owner = payable(msg.sender);
    }
    mapping(address=>uint) public userBalance;
    uint public totalSupply;
    event Deposit(address sender, uint amount, uint balance);
    function deposit() payable external {
        require(!lockBalances);
        lockBalances = true;
            userBalance[msg.sender]+=msg.value;
            totalSupply += msg.value;
        lockBalances = false;
        assert(address(this).balance >= totalSupply);
        emit Deposit(msg.sender, msg.value, userBalance[msg.sender]);
    }
    fallback() external payable {
       require(msg.data.length == 0); 
    }
    event WithdrawBalance( address user,uint amount, uint totalSupply);
    function withdrawBalance() public {
        require(!lockBalances);
        lockBalances = true;
            uint amountToWithdraw = userBalance[msg.sender];
            userBalance[msg.sender] = 0;
            totalSupply -= amountToWithdraw;
            bool success = payable(msg.sender).send(amountToWithdraw);
        lockBalances = false;
        require(success);
        emit WithdrawBalance( msg.sender, amountToWithdraw, totalSupply);
    }
    function getBalance()external view returns(uint){
        return address(this).balance;
    }
    function setURL(string memory _urlName)external{
        require(!nameExist[_urlName]);
        require(runThePayment());
        URL memory newURL;
        newURL.name=_urlName;
        URLsByOwner[msg.sender].push(newURL);
        nameExist[_urlName] = true;
    }
    function getURL() view external{

    }
    function setOnions( string memory _urlName, string[] memory _onions)external{
        require(userBalance[msg.sender]>=handlingCost);
        require(nameExist[_urlName]);
        URL[] memory urls = URLsByOwner[msg.sender];
        for(uint i=0; i<urls.length; i++){
            if(memcmp(bytes(urls[i].name), bytes(_urlName))){
                require(runThePayment());
                urls[i].onions=_onions;
                nameOnions[urls[i].name]=_onions;
            }
        }
    }
    bool private lockBalances;
    function runThePayment() internal returns(bool){
         require(!lockBalances);
         lockBalances = true;
            require(userBalance[msg.sender]>=handlingCost);
            userBalance[msg.sender]-=handlingCost;
            totalSupply -= handlingCost;
            bool success = owner.send(handlingCost);
         lockBalances = false;
         return success;
    }
    function getOnions(string memory _urlName)external view returns(string[] memory){
        string[] memory onions = nameOnions[_urlName];
        return onions;
    }
    function withdrawSurplus()public onlyOwner{
        require(!lockBalances);
        lockBalances = true;
            uint amountToWithdraw = address(this).balance - totalSupply;
            bool success = owner.send(amountToWithdraw);
        lockBalances = false;
        require(success);
        emit WithdrawBalance( msg.sender, amountToWithdraw, address(this).balance);
    }
    modifier onlyOwner(){
            require(msg.sender == owner);
            _;
    }
    function memcmp(bytes memory a, bytes memory b) internal pure returns(bool){
        return (a.length == b.length) && (keccak256(a) == keccak256(b));
    }

}