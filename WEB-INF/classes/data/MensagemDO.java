package data;

public class MensagemDO {
  private int _id;
  private int _id_clube;
  private String _email;
  private String _texto;

  public int getId() {
     return _id;
  } // getId

  public void setId(int id) {
    _id = id;
  } // setId

  
  public int getId_clube() {
    return _id_clube;
  } // getId_clube
  
  public void setId_clube(int id_clube) {
    _id_clube = id_clube;
  }// setId_clube

  public String getEmail() {
    return _email;
  } // obterNome

  public void setEmail(String email) {
    _email = email;
  } // setNome
  
 public String getTexto() {
    return _texto;
  } // getTelefone

  public void setTexto(String texto) {
    _texto = texto;
  } // setTelefone


} // ContatoDO