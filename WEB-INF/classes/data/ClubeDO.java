package data;

public class ClubeDO {
  private int _id_clube;
  private int _id_federacao;
  private String _nome_clube;
  private String _endereco_clube;
  private String _img_url_clube;
  private String _site_clube;
  private int _mensalidade_clube;

  public int getIdClube() {
     return _id_clube;
  } // getIdClube

  public void setIdClube(int id) {
    _id_clube = id;
  } // setIdClube

  public int getIdFederacao() {
     return _id_federacao;
  } // getIdFederacao

  public void setIdFederacao(int id) {
    _id_federacao = id;
  } // setIdFederacao

  public String getNomeClube() {
    return _nome_clube;
  } // getNomeClube

  public void setNomeClube(String nome) {
    _nome_clube = nome;
  } // setNomeClube
  
  public String getEnderecoClube() {
    return _endereco_clube;
  } // getEnderecoClube

  public void setEnderecoClube(String endereco) {
    _endereco_clube = endereco;
  } // setEnderecoClube
  
  public void setImgUrlClube(String url) {
    _img_url_clube = url;
  } // setImgUrlClube
  
  public String getImgUrlClube() {
    return _img_url_clube;
  } // getImgUrlClube
  
  public void setSiteClube(String site) {
    _site_clube = site;
  } // setSiteClube
  
  public String getSiteClube() {
    return _site_clube;
  } // getSiteClube

  public int getMensalidadeClube() {
     return _mensalidade_clube;
  } // getMensalidadeClube

  public void setMensalidadeClube(int mensalidade) {
    _mensalidade_clube = mensalidade;
  } // setMensalidadeClube

} // ClubeDO