package data;

public class TipoEventoDO {
  private int _id_tipo_evento;
  private String _tipo_do_evento;

  public int getId() {
     return _id_tipo_evento;
  } // getId_tipo_evento

  public void setId(int id) {
    _id_tipo_evento = id;
  } // setId_tipo_evento
  
  public String getTipo_do_evento() {
    return _tipo_do_evento;
  } // getTipo_do_evento

  public void setTipo_do_evento(String nome) {
    _tipo_do_evento = nome;
  } // setTipo_do_evento

} // TipoEventoDO