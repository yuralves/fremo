package data;

public class FederacaoDO {
  private int _id_FEDERACAO;
  private String _nome_FEDERACAO;
  private String _endereco_FEDERACAO;
  private String _site_FEDERACAO;
  private String _url_IMG_FEDERACAO;

  public int getIdFEDERACAO() {
     return _id_FEDERACAO;
  } // getId

  public void setIdFEDERACAO(int id) {
    _id_FEDERACAO = id;
  } // setId

  public String getNomeFEDERACAO() {
    return _nome_FEDERACAO;
  } // obterNome

  public void setNomeFEDERACAO(String nome) {
    _nome_FEDERACAO = nome;
  } // setNome

  public String getEnderecoFederacao() {
    return _endereco_FEDERACAO;
  } // getEndereço

  public void setEnderecoFederacao(String endereco) {
    _endereco_FEDERACAO = endereco;
  } // setEndereço
  
  public String getSiteFederacao() {
    return _site_FEDERACAO;
  } // getSite

  public void setSiteFederacao(String site) {
    _site_FEDERACAO = site;
  } // setSite
  
  public String getImgUrl() {
    return _url_IMG_FEDERACAO;
  } // getImgURL

  public void setImgUrl(String url_img) {
    _url_IMG_FEDERACAO = url_img;
  } // setImgURL

} // FederacaoDO