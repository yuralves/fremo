package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class CATL {
    
    public boolean inserir_presenca(InstanciaExercicioDO exercicio) throws Exception {
        Transacao tr = new Transacao();
            try{
                // inserir validacoes de regras de negocio
                tr.begin();
                InstanciaExercicioData IEdata = new InstanciaExercicioData();
                IEdata.incluir(exercicio, tr);
                tr.commit();
                return true;
            } catch (Exception e) {
                tr.rollback();
                e.printStackTrace();
            }
            return false;
        } // atleta marca presenca    
    
    public boolean inserir_mensalidade_atleta(MensalidadeAtletasDO atleta) throws Exception {
        Transacao tr = new Transacao();
	try{
	   // inserir validacoes de regras de negocio
	    tr.begin();
  	    MensalidadeAtletasData Adata = new MensalidadeAtletasData();
	    Adata.incluir(atleta, tr);
	    tr.commit();
            return true;
	} catch (Exception e) {
	    tr.rollback();
            e.printStackTrace();
	}
	return false;
     } // incluir mensalidade atleta    
    
    public Vector atleta_clube(int id_clube) {
        Transacao tr = new Transacao();
        try {
	    tr.beginReadOnly();
            AtletaData AData = new AtletaData();
            Vector vetor = AData.pesquisarAtletas(id_clube, tr);
            tr.commit();
            return vetor;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    } // Controle pagamentos de atletas

    public Vector cobrar_atletas(int id_clube, String mes, int ano) {
        Transacao tr = new Transacao();
        try {
	    tr.beginReadOnly();
            AtletasDevedoresData ADData = new AtletasDevedoresData();
            Vector vetor = ADData.pesquisarDevedores(id_clube, mes, ano, tr);
            tr.commit();
            return vetor;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean atualizar_mensalidade_atleta(int idatleta, int mensalidade) throws Exception {
        Transacao tr = new Transacao();
	try{
	    // inserir validacoes de regras de negocio
	    tr.begin();
  	    AtletaData Adata = new AtletaData();
	    Adata.atualizar_mensalidade(idatleta, mensalidade, tr);
	    tr.commit();
	    return true;
	} catch (Exception e) {
	    tr.rollback();
            e.printStackTrace();
	}
	return false;
     } // atualizar mensalidade atleta
    
} // CATL