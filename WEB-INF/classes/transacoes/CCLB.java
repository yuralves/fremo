package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class CCLB {

    public boolean inserir_mensalidade_clube(MensalidadeClubesDO clube) throws Exception {
        Transacao tr = new Transacao();
	try{
	// inserir validacoes de regras de negocio
            tr.begin();
  	    MensalidadeClubesData Cdata = new MensalidadeClubesData();
	    Cdata.incluir(clube, tr);
	    tr.commit();
	    return true;
	} catch (Exception e) {
            tr.rollback();
            e.printStackTrace();
	}
	return false;
    } // incluir mensalidade clube
    
    public Vector clube_federacao(int id_federacao) {
        Transacao tr = new Transacao();
        try {
	    tr.beginReadOnly();
            ClubeData CData = new ClubeData();
            Vector vetor = CData.pesquisarClubes(id_federacao, tr);
            tr.commit();
            return vetor;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    } // Controle pagamentos de clubes
    
    public Vector cobrar_clubes(int id_federacao, String mes, int ano) {
        Transacao tr = new Transacao();
        try {
	    tr.beginReadOnly();
            ClubesDevedoresData CDData = new ClubesDevedoresData();
            Vector vetor = CDData.pesquisarDevedores(id_federacao, mes, ano, tr);
            tr.commit();
            return vetor;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    } // Controle pagamentos de clubes
    
    public boolean atualizar_mensalidade_clube(int idclube, int mensalidade) throws Exception {
        Transacao tr = new Transacao();
	try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	   ClubeData Cdata = new ClubeData();
	   Cdata.atualizar_mensalidade(idclube, mensalidade, tr);
	   tr.commit();
	   return true;
	} catch (Exception e) {
	   tr.rollback();
	   e.printStackTrace();
	}
	return false;
    } // atualizar mensalidade clube
    
    
} // CCLB