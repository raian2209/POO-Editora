package Models.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import Models.VO.UsuarioVO;

public interface UsuarioInterDAO<VO extends UsuarioVO> extends BaseInterDAO<VO> {
    // Buscar
    public abstract  ResultSet acharTodos(VO entity) throws SQLException;
    public abstract  ResultSet acharPorCpf(VO entity) throws SQLException;
    public abstract  ResultSet acharPorNome(VO entity) throws SQLException;
    public abstract  ResultSet acharPorObra(VO entity) throws SQLException;
    // Cadastrar
    public abstract  ResultSet cadastrar(VO entity) throws SQLException;
    // Alterar
    public abstract  ResultSet alterar(VO entity) throws SQLException;
    // Excluir
    public abstract  ResultSet excluir(VO entity) throws SQLException;

}
