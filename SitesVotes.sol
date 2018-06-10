pragma solidity ^0.4.0;
contract SistVotes{
    mapping (uint=>bool) registro;
    mapping (uint=>uint) voto;
    mapping (address=>uint) escrutinio;
    event Votar(uint indexed CC, address indexed escru);
    
    function registroVotante(uint CC) public {
        registro[CC] = true;
        voto[CC] = 1;
    }
    
    function votar(uint CC, address escru) public {
        if(registro[CC] && voto[CC]==1){
            escrutinio[escru]=1;
            voto[CC]-=1;
        }
    }
    
    function votantesResgistrados(uint CC) public view returns(bool){
        return registro[CC];
    }
    
    function balanceEscrutinio(address escru) public view returns(uint totalVotos){
        return escrutinio[escru];
    } 
    
}