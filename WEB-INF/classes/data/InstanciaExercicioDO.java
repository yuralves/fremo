package data;

public class InstanciaExercicioDO {
  private int _id_exercicio;
  private int _id_ATLETA;
  private String _data_realizado;
  private int valor;

  public int getId_Exercicio() {
     return _id_exercicio;
  } // getId_Exercicio

  public void setId_Exercicio(int id) {
    _id_exercicio = id;
  } // setId_Exercicio
  
  public int getId_Atleta() {
    return _id_ATLETA;
  } // getId_Atleta

  public void setId_Atleta(int id) {
    _id_ATLETA = id;
  } // setId_Atleta

  public String getData_realizado() {
    return _data_realizado;
  } // getData_realizado

  public void setData_realizado(String data) {
    _data_realizado = data;
  } // setData_realizado
  
  public int getValor() {
    return valor;
  } // obter getValor

  public void setValor(int val) {
    valor = val;
  } // set setValor


} // InstanciaExercicioDO