package Models.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import Models.VO.ObrasVO;

public interface ObrasInterDAO<VO extends ObrasVO> extends BaseInterDAO<VO> {
    // Buscar
    public abstract  ResultSet acharTodas(VO entity) throws SQLException;
    public abstract  ResultSet acharPorEscritor(VO entity) throws SQLException;
    public abstract  ResultSet acharPorTitulo(VO entity) throws SQLException;
    public abstract  ResultSet acharPorStatus(VO entity) throws SQLException;
    public abstract  ResultSet acharPorAno(VO entity) throws SQLException;
    // Cadastrar
    public abstract  void cadastrar(VO entity) throws SQLException;
    // Alterar
    public abstract  void atualisar(VO entity) throws SQLException;
    // Excluir
    public abstract  void excluir(VO entity) throws SQLException;
}
