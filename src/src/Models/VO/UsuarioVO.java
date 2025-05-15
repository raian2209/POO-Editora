package Models.VO;
import Errors.ValidationException;

public class UsuarioVO {
    private String nome;
    private String endereco;
    private String cpf;

    public void setNome(String nome) throws ValidationException{
        if(nome == null){
            throw new ValidationException("nome não pode ser nulo");
        }
        this.nome = nome;
    }

    public void setEndereco(String endereco) throws ValidationException {
        if(endereco == null){
            throw new ValidationException("endereco não pode ser nulo");
        }
        this.endereco = endereco;
    }

    public void setCpf(String cpf) throws ValidationException{
        if(cpf == null){
            throw new ValidationException("cpf não pode ser nulo");
        }
        if(cpf.length() != 11) {
            throw new ValidationException("cpf tem que ter 11 numeros.");
        }

        for (int ind=0 ; ind < cpf.length() ; ind++) {
            if (cpf.charAt(ind) < '0' || cpf.charAt(ind) > '9') {
                throw new ValidationException("cpf tem que ter apenas numeros.");
            }
        }
        this.cpf = cpf;
    }

    public String getNome() {
        return nome;
    }

    public String getEndereco() {
        return endereco;
    }

    public String getCpf() {
        return cpf;
    }
}
