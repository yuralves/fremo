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
public class ClubesDevedoresDO {
    
    private String _email_do_clube;
    private String _nome_do_clube;
    private int _mensalidade;
    
    public String getEmail_Do_Clube() {
        return _email_do_clube;
    } // obterEmail_Do_Clube

    public void setEmail_Do_Clube(String email_do_clube) {
        _email_do_clube = email_do_clube;
    } // setEmail_Do_Clube
    
    public String getNome_Do_Clube() {
        return _nome_do_clube;
    } // obterNome_Do_Clube

    public void setNome_Do_Clube(String nome_do_clube) {
        _nome_do_clube = nome_do_clube;
    } // setNome_Do_Clube
    
    public int getMensalidade() {
        return _mensalidade;
    } // obterMensalidade

    public void setMensalidade(int mensalidade) {
        _mensalidade = mensalidade;
    } // setMensalidade
    
}
