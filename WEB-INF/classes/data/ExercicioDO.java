package data;

public class ExercicioDO {
  private int _id_exercicio;
  private int _id_treino;
  private int _id_tipo_exercicio;
  private int _n_series;
  private int _n_repeticoes;
  private String _carga_ou_tempo;
 

  public int getIdExercicio() {
     return _id_exercicio;
  } // getIdExercicio

  public void setIdExercicio(int idexercicio) {
    _id_exercicio = idexercicio;
  } // setIdExercicio

  public int getIdTreino() {
    return _id_treino;
  } // getIdTreino

  public void setIdTreino(int idtreino) {
    _id_treino = idtreino;
  } // setIdTreino

  public int getIdTipoExercicio() {
    return _id_tipo_exercicio;
  } // getIdTipoExercicio

  public void setIdTipoExercicio(int idtipoexerc) {
    _id_tipo_exercicio = idtipoexerc;
  } // setIdTipoExercicio
  
    public int getNSeries() {
    return _n_series;
  } // getNSeries

  public void setNSeries(int nseries) {
    _n_series = nseries;
  } // setNSeries

    public int getNRepeticoes() {
    return _n_repeticoes;
  } // getNRepeticoes   

  public void setNRepeticoes(int nrepeticoes) {
    _n_repeticoes = nrepeticoes;
  } // setNRepeticoes

  public String getCargaOuTempo() {
    return _carga_ou_tempo;
  } // getCargaOuTempo

  public void setCargaOuTempo(String cargaoutempo) {
    _carga_ou_tempo = cargaoutempo;
  } // setCargaOuTempo

}//ExercicioDO
