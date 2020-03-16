package data;

public class ListaAtletasDO {
  private int _id_ATLETA;
  private int _id_PROVA;
  private int _id_CLUBE;
  private float _resultado;
  private String _colocacao;
  private int _pontuacao;
  private boolean _inscricao_aprovada;
  
    public int getId_ATLETA() {
        return _id_ATLETA;
    }

    public void setId_ATLETA(int _id_ATLETA) {
        this._id_ATLETA = _id_ATLETA;
    }

    public int getId_CLUBE() {
        return _id_CLUBE;
    }

    public void setId_CLUBE(int _id_CLUBE) {
        this._id_CLUBE = _id_CLUBE;
    }

    public String getColocacao() {
        return _colocacao;
    }

    public void setColocacao(String _colocacao) {
        this._colocacao = _colocacao;
    }

    public int getId_PROVA() {
        return _id_PROVA;
    }

    public void setId_PROVA(int _id_PROVA) {
        this._id_PROVA = _id_PROVA;
    }

    public float getResultado() {
        return _resultado;
    }

    public void setResultado(float _resultado) {
        this._resultado = _resultado;
    }

    public int getPontuacao() {
        return _pontuacao;
    }

    public void setPontuacao(int _pontuacao) {
        this._pontuacao = _pontuacao;
    }

    public boolean getInscricao_Aprovada() {
        return _inscricao_aprovada;
    }

    public void setInscricao_Aprovada(boolean _inscricao_aprovada) {
        this._inscricao_aprovada = _inscricao_aprovada;
    }
  
} // ListaAtletaDO