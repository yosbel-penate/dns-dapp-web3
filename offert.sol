pragma solidity ^0.8.7;
contract OffertDNS{

    address public owner;
    mapping(address=>string) private UrlNameByUser;

    constructor(){
        owner = msg.sender;
    }

    function setURL(string memory _urlName)external{
        UrlNameByUser[msg.sender]=_urlName;
    }
}