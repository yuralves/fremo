/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

/**
 *
 * @author erich
 */
public class ResultadosDO {
  private int _id_evento;
  private String _nome_do_evento;
  private String _nome_da_prova;
  private String _nome_atleta;
  private String _sobrenome_atleta;
  private int _colocacao;
  private float _resultado;

  public int getId_evento() {
     return _id_evento;
  } // 

  public void setId_evento(int id_evento) {
    _id_evento = id_evento;
  } // 

  public String getnome_do_evento() {
    return _nome_do_evento;
  } //

  public void setnome_do_evento(String nome_do_evento) {
    _nome_do_evento = nome_do_evento;
  } // 

  public String getnome_da_prova() {
    return _nome_da_prova;
  } // 

  public void setnome_da_prova(String nome_da_prova) {
    _nome_da_prova = nome_da_prova;
  } //
  
   public String getnome_atleta() {
    return _nome_atleta;
  } // 

  public void setnome_atleta(String nome_atleta) {
    _nome_atleta = nome_atleta;
  } // 
  
   public String getsobrenome_atleta() {
    return _sobrenome_atleta;
  } // 

  public void setsobrenome_atleta(String sobrenome_atleta) {
    _sobrenome_atleta = sobrenome_atleta;
  } // 
  
   public int getcolocacao() {
    return _colocacao;
  } // 

  public void setcolocacao(int colocacao) {
    _colocacao = colocacao;
  } // 
  
  public float getresultado() {
    return _resultado;
  } // 

  public void setresultado(float resultado) {
    _resultado = resultado;
  } // 
}

