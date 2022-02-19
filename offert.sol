pragma solidity ^0.8.7;
contract OffertDNS{
    address payable public owner;
    mapping(address=>string) private UrlNameByUser;
    constructor()payable{
        owner = payable(msg.sender);
    }
    function setURL(string memory _urlName)external{
        UrlNameByUser[msg.sender]=_urlName;
    }
}