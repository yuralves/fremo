package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class TATL {
    
      public boolean atualizar_clube_atleta(int id_atleta, int id_clube) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     AtletaData Adata = new AtletaData();
             Adata.atualizar_clube(id_atleta, id_clube, tr);
             TrocaAtletaData TData = new TrocaAtletaData();
             TData.excluir(id_atleta, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar
  
  public Vector vetor_atletas_nome(String nome) {
      Transacao tr = new Transacao();
      try {
  	    tr.beginReadOnly();
            AtletaData Adata = new AtletaData();
            Vector vetor = Adata.buscarPorNome(nome, tr);
            tr.commit();
             return vetor;
      } catch(Exception e) {
          e.printStackTrace();
      }
      return null;
    }
  
  public boolean incluir_troca (TrocaAtletaDO troca) throws Exception{
     // efetuando a transacao
     Transacao tr = new Transacao();
     try {
       tr.begin();
         TrocaAtletaData Tdata = new TrocaAtletaData();
         Tdata.incluir(troca, tr);
       tr.commit();
       return true;
     } catch(Exception e) {
         tr.rollback();
         e.printStackTrace();
     }
     return false;
  } // incluir
  
  public Vector vetor_troca_atletas_clube(int id_clube) {
     Transacao tr = new Transacao();
     try {
	    tr.beginReadOnly();
            TrocaAtletaData TAdata = new TrocaAtletaData();
            Vector vetor = TAdata.buscarPorClube(id_clube, tr);
            tr.commit();
            return vetor;
     } catch(Exception e) {
         e.printStackTrace();
     }
     return null;
  } // pesquisar
  
  public boolean aprovar_troca_clube_atleta(int id_atleta) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
             TrocaAtletaData TData = new TrocaAtletaData();
             TData.autorizar_clube(id_atleta, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar
  
    public boolean reprovar_troca_clube_atleta(int id_atleta) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
            tr.begin();
            TrocaAtletaData TData = new TrocaAtletaData();
            TData.excluir(id_atleta, tr);
            tr.commit();
            return true;
	} catch (Exception e) {
            tr.rollback();
            e.printStackTrace();
	}
	return false;
    } // atualizar
    
      public Vector vetor_troca_atletas() {
     Transacao tr = new Transacao();
     try {
	    tr.beginReadOnly();
            TrocaAtletaData TAdata = new TrocaAtletaData();
            Vector vetor = TAdata.buscarPorAprovacao(tr);
            tr.commit();
            return vetor;
     } catch(Exception e) {
         e.printStackTrace();
     }
     return null;
      } // pesquisar
      
      public AtletaDO busca_atleta_por_ID_atleta(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     AtletaData AData = new AtletaData();
	     AtletaDO atl = AData.buscarPorId_atleta(idobj, tr);
	   tr.commit();
	   return atl;
	 } catch (Exception e) {
	   tr.rollback();
	   e.printStackTrace();
	 }
	 return null;
  }
      
        public ClubeDO busca_clube_por_ID_clube(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     ClubeData CData = new ClubeData();
	     ClubeDO clb = CData.buscar(idobj, tr);
	   tr.commit();
	   return clb;
	 } catch (Exception e) {
	   tr.rollback();
	   e.printStackTrace();
	 }
	 return null;
  }


} // TATL