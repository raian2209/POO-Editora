package Models.DAO;

import java.sql.SQLException;
import java.sql.ResultSet;

import Errors.ValidationException;

public interface BaseInterDAO<VO> {
public abstract void insert(VO entity) throws SQLException,ValidationException;
public abstract void update(VO entity) throws SQLException;
public abstract void delete(VO entity) throws SQLException;
public abstract void findAll(VO entity) throws SQLException;
public abstract void findById(VO entity) throws SQLException;
}
