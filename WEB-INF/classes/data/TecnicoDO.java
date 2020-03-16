package data;

public class TecnicoDO {
  private int _id_tecnico;
  private int _id_clube;
  private String _nome_tecnico;
  private String _sobrenome_tecnico;
  private String _rg_tecnico;
  private String _cpf_tecnico;
  private String _data_nascimento_tecnico;
  
  
  public int getIdTecnico() {
     return _id_tecnico;
  } // getId

  public void setIdTecnico(int id) {
    _id_tecnico = id;
  } // setId

  public int getIdClube(){
      return _id_clube;
  }
  
  public void setIdClube(int id){
      _id_clube=id;
  } 
  
  public String getNomeTecnico() {
    return _nome_tecnico;
  } // obterNome

  public void setNomeTecnico(String nome) {
    _nome_tecnico = nome;
  } // setNome
  
  public String getSobrenomeTecnico() {
    return _sobrenome_tecnico;
  } // getSobrenome

  public void setSobrenomeTecnico(String sobrenome) {
    _sobrenome_tecnico = sobrenome;
  } // setSobrenome


  public String getRgTecnico() {
    return _rg_tecnico;
  } // getRgTecnico

  public void setRgTecnico(String rg) {
    _rg_tecnico = rg;
  } // setRgTecnico

  public String getCpfTecnico() {
    return _cpf_tecnico;
  } // getCpfTecnico

  public void setCpfTecnico(String cpf) {
    _cpf_tecnico = cpf;
  } // setCpfTecnico

  public String getDataNascimentoTecnico() {
    return _data_nascimento_tecnico;
  } // getDataNascimentoTecnico

  public void setDataNascimentoTecnico(String data) {
    _data_nascimento_tecnico = data;
  } // setDataNascimentoTecnico


} // TecnicoDO