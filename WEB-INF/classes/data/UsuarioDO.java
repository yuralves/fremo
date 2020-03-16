package data;

public class UsuarioDO {
  private int _id_USER;
  private String _email_USER;
  private String _password;
  private boolean _habilitado_ADMIN;
  private boolean _habilitado_FEDERACAO;
  private boolean _habilitado_CLUBE;
  private boolean _habilitado_TECNICO;
  private boolean _habilitado_ATLETA;
  
  public int getID_USER() {
     return _id_USER;
  } // getId_USER

  public void setID_USER(int id) {
    _id_USER = id;
  } // setId_USER

  public String getEmail_User() {
    return _email_USER;
  } // obter email

  public void setEmail_User(String email) {
    _email_USER = email;
  } // set email
  
  public String getPassword() {
    return _password;
  } // obter senha

  public void setPassword(String password) {
    _password = password;
  } // set senha
  
  public boolean getHabilitado_ADMIN() {
    return _habilitado_ADMIN;
  } // obter admin

  public void setHabilitado_ADMIN(boolean habilitado) {
    _habilitado_ADMIN = habilitado;
  } // set admin
  
  public boolean getHabilitado_FEDERACAO() {
    return _habilitado_FEDERACAO;
  } // obter federação

  public void setHabilitado_FEDERACAO(boolean habilitado) {
    _habilitado_FEDERACAO = habilitado;
  } // set federação
  
  public boolean getHabilitado_CLUBE() {
    return _habilitado_CLUBE;
  } // obter clube

  public void setHabilitado_CLUBE(boolean habilitado) {
    _habilitado_CLUBE = habilitado;
  } // set clube
  
  public boolean getHabilitado_TECNICO() {
    return _habilitado_TECNICO;
  } // obter técnico

  public void setHabilitado_TECNICO(boolean habilitado) {
    _habilitado_TECNICO = habilitado;
  } // set técnico
  
  public boolean getHabilitado_ATLETA() {
    return _habilitado_ATLETA;
  } // obter atleta

  public void setHabilitado_ATLETA(boolean habilitado) {
    _habilitado_ATLETA = habilitado;
  } // set atleta

} // ContatoDO