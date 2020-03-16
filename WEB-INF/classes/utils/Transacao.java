package utils;

import java.sql.*;


public class Transacao {

  // connection data
  private Connection _conexao = null;
  private boolean _readOnly = false;

  public void begin() throws Exception{
      Class.forName("com.mysql.jdbc.Driver");
      _conexao =DriverManager.getConnection("jdbc:mysql://localhost:3306/fremo?" +"user=root&password=pmr2490");
      _conexao.setAutoCommit(false);
      _readOnly = false;
  } // begin

  public void beginReadOnly() throws Exception{
      Class.forName("com.mysql.jdbc.Driver");
      _conexao =DriverManager.getConnection("jdbc:mysql://localhost:3306/fremo?" +"user=root&password=pmr2490");
      _readOnly = true;
  } // begin

  public void commit() throws Exception {
      if ( !_readOnly) {
         _conexao.commit();
      }
      _conexao.close();
  } // commit

  public void rollback() throws Exception {
      if ( !_readOnly) {
         _conexao.rollback();
      }
      _conexao.close();
  } // rollback

  public Connection obterConexao() {
      return _conexao;
  } // obterConexao
  

} // Transacao
