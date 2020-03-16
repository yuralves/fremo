package data;

public class EventoDO {
  private int _id;
  private String _nome_do_evento;
  private int _id_tipo_do_evento;
  private int _id_federacao;
  private String _localizacao;
  private String _data_inicio;
  private String _data_termino;
  private float _preco_inscricao;
  private boolean _flag_inscricao;

  public int getId() {
     return _id;
  } // getId

  public void setId(int id) {
    _id = id;
  } // setId

  public String getNome_Do_Evento() {
    return _nome_do_evento;
  } // obterNome_Do_Evento

  public void setNome_Do_Evento(String nome_do_evento) {
    _nome_do_evento = nome_do_evento;
  } // setNome_Do_Evento

  public int getId_Tipo_Do_Evento() {
     return _id_tipo_do_evento;
  } // getId_Tipo_Do_Evento

  public void setId_Tipo_Do_Evento(int id_tipo_do_evento) {
    _id_tipo_do_evento = id_tipo_do_evento;
  } // setId_Tipo_Do_Evento

  public int getId_Federacao() {
     return _id_federacao;
  } // getId_Federacao

  public void setId_Federacao(int id_federacao) {
    _id_federacao = id_federacao;
  } // setId_Federacao

  public String getLocalizacao() {
    return _localizacao;
  } // obterLocalizacao

  public void setLocalizacao(String localizacao) {
    _localizacao = localizacao;
  } // setLocalizacao

  public String getData_Inicio() {
    return _data_inicio;
  } // obterData_Inicio

  public void setData_Inicio(String data_inicio) {
    _data_inicio = data_inicio;
  } // setData_Inicio

  public String getData_Termino() {
    return _data_termino;
  } // obterData_Termino

  public void setData_Termino(String data_termino) {
    _data_termino = data_termino;
  } // setData_Termino
  
  public float getPreco_Inscricao(){
    return _preco_inscricao;
  }

  public void setpreco_Inscricao(float preco_inscricao){
    _preco_inscricao = preco_inscricao;
  }

  public boolean getFlag_Inscricao(){
    return _flag_inscricao;
  }

  public void setFlag_Inscricao(boolean flag_inscricao){
    _flag_inscricao = flag_inscricao;
  }

} // EventoDO
