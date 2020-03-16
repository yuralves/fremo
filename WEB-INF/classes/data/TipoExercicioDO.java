package data;

public class TipoExercicioDO {
  private int _id_tipo_exercicio;
  private String _nome_exercicio;

  public int getIdTipoExercicio() {
     return _id_tipo_exercicio;
  } // getIdTipoExercicio

  public void setIdTipoExercicio(int id) {
    _id_tipo_exercicio = id;
  } // setIdTipoExercicio

  public String getNomeExercicio() {
    return _nome_exercicio;
  } // obterNomeExercicio

  public void setNomeExercicio(String nome) {
    _nome_exercicio = nome;
  } // setNomeExercicio

} // TipoExercicioDO