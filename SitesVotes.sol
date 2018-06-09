pragma solidity ^0.4.0;
contract SistVotes{
    mapping (int=>bool) registro;
    mapping (int=>int) voto;
    mapping (address=>int) escrutinio;
    
    function registroVotante(int CC) public {
        registro[CC] = true;
        voto[CC] = 1;
    }
    
    function hacerVoto(int CC, address escru) public {
        if(registro[CC] && voto[CC]==1){
            escrutinio[escru]=1;
            voto[CC]-=1;
        }
    }
    
    function votantesResgistrados(int CC) public view returns(bool){
        return registro[CC];
    }
    
    function balanceEscrutinio(address escru) public view returns(int totalVotos){
        return escrutinio[escru];
    } 
    
}