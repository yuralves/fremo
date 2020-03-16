/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

/**
 *
 * @author danielmsverde
 */
public class AtletasDevedoresDO {
    
    private String _email_do_atleta;
    private String _nome_do_atleta;
    private int _mensalidade;
    
    public String getEmail_Do_Atleta() {
        return _email_do_atleta;
    } // obterEmail_Do_Clube

    public void setEmail_Do_Atleta(String email_do_atleta) {
        _email_do_atleta = email_do_atleta;
    } // setEmail_Do_Clube
    
    public String getNome_Do_Atleta() {
        return _nome_do_atleta;
    } // obterNome_Do_Clube

    public void setNome_Do_Atleta(String nome_do_atleta) {
        _nome_do_atleta = nome_do_atleta;
    } // setNome_Do_Clube
    
    public int getMensalidade() {
        return _mensalidade;
    } // obterMensalidade

    public void setMensalidade(int mensalidade) {
        _mensalidade = mensalidade;
    } // setMensalidade
    
}
