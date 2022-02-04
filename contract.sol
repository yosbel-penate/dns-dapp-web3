pragma solidity ^0.8.7;

contract DnsProvider{
    //-->Variables
    address payable public owner;
    uint constant public handlingCost =  1800000000000000;
    mapping(address=>string[]) private URLsByOwners;
    mapping(string=>string[]) private nameOnions;
    mapping(string => bool) public nameExist;
    mapping(address=>uint) private userBalance;
    uint public totalSupply;
    bool private lockBalances;
    //-->End Variables
    //-->Events
    event Deposit(address sender, uint amount, uint balance);
    event WithdrawBalance( address user,uint amount, uint totalSupply);
    //-->End Events
    constructor()payable{
        owner = payable(msg.sender);
    }
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
        URLsByOwners[msg.sender].push(_urlName);
        nameExist[_urlName] = true;
    }
    function getURLs() view external returns(string[] memory){
        return URLsByOwners[msg.sender];
    }
    function deleteURLs(string memory _urlName)external{
        require(nameExist[_urlName]);
        string[] memory urlNames = URLsByOwners[msg.sender];
        for(uint i=0; i<urlNames.length; i++){
            if(memcmp(bytes(urlNames[i]), bytes(_urlName))){
                delete URLsByOwners[msg.sender][i];
                delete nameOnions[_urlName];
                delete nameExist[_urlName];
            }
        }
     }
     function transferURLs(address _to, string memory _urlName)external{
        require(nameExist[_urlName]);
        string[] memory urlNames = URLsByOwners[msg.sender];
        for(uint i=0; i<urlNames.length; i++){
            if(memcmp(bytes(urlNames[i]), bytes(_urlName))){
                delete nameOnions[_urlName];
                delete URLsByOwners[msg.sender][i];
                URLsByOwners[_to].push(_urlName);
            }
        }
     }
    function setOnions( string memory _urlName, string[] memory _onions)external{
        require(userBalance[msg.sender]>=handlingCost);
        require(nameExist[_urlName]);
        string[] memory urlNames = URLsByOwners[msg.sender];
        for(uint i=0; i<urlNames.length; i++){
            if(memcmp(bytes(urlNames[i]), bytes(_urlName))){
                require(runThePayment());
                nameOnions[urlNames[i]]=_onions;
            }
        }
    }
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