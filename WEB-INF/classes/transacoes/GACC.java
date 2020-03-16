package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class GACC {
    
    public UsuarioDO buscar_usuario_email(String email) throws Exception{
        Transacao tr = new Transacao();
        try{
            tr.beginReadOnly();
  	    UsuarioData Udata = new UsuarioData();
	    UsuarioDO u = Udata.buscarPorEmail(email, tr);
            tr.commit();
            return u;
        } 
        catch (Exception e) {
            tr.rollback();
            e.printStackTrace();
	}
	return null;
    } // buscar_usuario_email
    
        public UsuarioDO busca_usuario_por_ID(int idobj) throws Exception{
    Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     UsuarioData UData = new UsuarioData();
	     UsuarioDO ulb = UData.buscar(idobj, tr);
	   tr.commit();
	   return ulb;
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

            public boolean atualizar_usuario(UsuarioDO usuario) throws Exception{
      Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     UsuarioData Udata = new UsuarioData();
	     Udata.atualizar(usuario, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   e.printStackTrace();
	 }
	 return false;
  }
            
              public Vector buscar_clubes_por_ID_federacao(int id_federacao) throws Exception{
      Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     ClubeData CData = new ClubeData();
	     Vector clubes = CData.pesquisarClubes(id_federacao, tr);
	   tr.commit();
	   return clubes;
	 } catch (Exception e) {
	   tr.rollback();
	   e.printStackTrace();
	 }
	 return null;
  }
              
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

  public TecnicoDO busca_tecnico_por_ID_tecnico(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     TecnicoData TData = new TecnicoData();
	     TecnicoDO tec = TData.buscarTecnico(idobj, tr);
	   tr.commit();
	   return tec;  
	 } catch (Exception e) {
	   tr.rollback();
	   e.printStackTrace();
	 }
	 return null;
  }        
  
    public boolean atualizar_info_atleta(AtletaDO atleta) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     AtletaData Adata = new AtletaData();
	     Adata.atualizar(atleta, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar
    
            public Vector vetor_atletas_Id_clube(int idobj) {
      Transacao tr = new Transacao();
      try {
  	    tr.beginReadOnly();
            AtletaData Adata = new AtletaData();
            Vector vetor = Adata.buscarPorId_Clube(idobj, tr);
            tr.commit();
             return vetor;
      } catch(Exception e) {
          e.printStackTrace();
      }
      return null;
    } // pesquisar

  public Vector busca_tecnico_por_ID_clube(int id_clube) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     TecnicoData TData = new TecnicoData();
	     Vector tecnicos = TData.pesquisarPorClube(id_clube, tr);
	   tr.commit();
	   return tecnicos;
	 } catch (Exception e) {
	   tr.rollback();
	   e.printStackTrace();
	 }
	 return null;
  }            
  
 public boolean atualizar_clube(ClubeDO clube) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     ClubeData Cdata = new ClubeData();
	     Cdata.atualizar(clube, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar
 
 public boolean atualizar_Tecnico(TecnicoDO tecnico) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     TecnicoData Tdata = new TecnicoData();
	     Tdata.atualizarTecnico(tecnico, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar
 
      public boolean criar_federacao (FederacaoDO federacao) throws Exception{
     // efetuando a transacao
     Transacao tr = new Transacao();
     try {
       tr.begin();
         FederacaoData Fdata = new FederacaoData();
         Fdata.incluir(federacao, tr);
       tr.commit();
       return true;
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " + federacao.getNomeFEDERACAO());
         e.printStackTrace();
     }
     return false;
  } // incluir federacao

    public boolean criar_clube(ClubeDO clube) throws Exception {
        // efetuando a transacao
        Transacao tr = new Transacao();
        try {
            tr.begin();
            ClubeData Cdata = new ClubeData();
            Cdata.incluirClube(clube, tr);
            tr.commit();
            return true;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao incluir " + clube.getNomeClube());
            e.printStackTrace();
        }
        return false;
    } // incluir clube

        public boolean criar_tecnico(TecnicoDO tecnico) throws Exception {
        // efetuando a transacao
        Transacao tr = new Transacao();
        try {
            tr.begin();
            TecnicoData Tdata = new TecnicoData();
            Tdata.incluirTecnico(tecnico, tr);
            tr.commit();
            return true;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao incluir " + tecnico.getNomeTecnico());
            e.printStackTrace();
        }
        return false;
    } // incluir técnico

    public boolean criar_atleta(AtletaDO atleta) throws Exception {
        // efetuando a transacao
        Transacao tr = new Transacao();
        try {
            tr.begin();
            AtletaData Adata = new AtletaData();
            Adata.incluir(atleta, tr);
            tr.commit();
            return true;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao incluir " + atleta.getNOME_ATLETA());
            e.printStackTrace();
        }
        return false;
    } // incluir atleta
     
     public boolean criar_usuario (UsuarioDO usuario) throws Exception{
     // efetuando a transacao
     Transacao tr = new Transacao();
     try {
       tr.begin();
         UsuarioData Udata = new UsuarioData();
         Udata.incluir(usuario, tr);
       tr.commit();
       return true;
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " + usuario.getEmail_User());
         e.printStackTrace();
     }
     return false;
  } // incluir usuario
     
         public Vector vetor_clubes_Id_federacao(int idobj) {
      Transacao tr = new Transacao();
      try {
  	    tr.beginReadOnly();
            ClubeData Cdata = new ClubeData();
            Vector vetor = Cdata.pesquisarClubes(idobj, tr);
            tr.commit();
             return vetor;
      } catch(Exception e) {
          e.printStackTrace();
      }
      return null;
    } // pesquisar clubes pelo id da federacao
         
             public Vector vetor_tecnicos_Id_clube(int idobj) {
      Transacao tr = new Transacao();
      try {
  	    tr.beginReadOnly();
            TecnicoData Tdata = new TecnicoData();
            Vector vetor = Tdata.pesquisarPorClube(idobj, tr);
            tr.commit();
             return vetor;
      } catch(Exception e) {
          e.printStackTrace();
      }
      return null;
    } // pesquisar tecnicos pelo id do clube
             
                      public Vector vetor_atletas_Id_tecnico(int idobj) {
       Transacao tr = new Transacao();
       try {
  	    tr.beginReadOnly();
              AtletaData Adata = new AtletaData();
              Vector vetor = Adata.buscarPorId_Tecnico(idobj, tr);
              tr.commit();
              return vetor;
       } catch(Exception e) {
                    System.out.println("erro ao incluir ");
           e.printStackTrace();
       }
       return null;
    } // pesquisar
                      
   public FederacaoDO busca_federacao_por_ID_federacao(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     FederacaoData FData = new FederacaoData();
	     FederacaoDO atl = FData.buscar(idobj, tr);
	   tr.commit();
	   return atl;
	 } catch (Exception e) {
	   tr.rollback();
	   e.printStackTrace();
	 }
	 return null;
  }
   
   public boolean atualizar_federacao(FederacaoDO federacao) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     FederacaoData Fdata = new FederacaoData();
	     Fdata.atualizar(federacao, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar
            
} // Contato