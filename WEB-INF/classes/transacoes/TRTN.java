package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class TRTN {

public Vector NomeExercicio() {
     Transacao tr = new Transacao();
     try {
	    tr.beginReadOnly();
            TipoExercicioData TEData = new TipoExercicioData();
            Vector vetortipoex = TEData.Exercicios(tr);
            tr.commit();
            return vetortipoex;
     } catch(Exception e) {
         e.printStackTrace();
     }
     return null;
  } //vetor exercicios
     
  
          public Vector NomeTreino() {
     Transacao tr = new Transacao();
     try {
	    tr.beginReadOnly();
            TreinoData TRData = new TreinoData();
            Vector vetortreino = TRData.Treinos(tr);
            tr.commit();
            return vetortreino;
     } catch(Exception e) {
         e.printStackTrace();
     }
     return null;
  } // vetor treinos
  
               public Vector NomeAtleta() {
     Transacao tr = new Transacao();
     try {
	    tr.beginReadOnly();
            AtletaData ATLData = new AtletaData();
            Vector vetoratleta = ATLData.Atletas(tr);
            tr.commit();
            return vetoratleta;
     } catch(Exception e) {
         e.printStackTrace();
     }
     return null;
  } // vetor atletas
  
     public boolean criar_tipoexercicio (TipoExercicioDO tipoexercicio) throws Exception{
     // efetuando a transacao
     Transacao tr = new Transacao();
     try {
       tr.begin();
         TipoExercicioData TEdata = new TipoExercicioData();
         TEdata.incluir(tipoexercicio, tr);
       tr.commit();
       return true;
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " + tipoexercicio.getNomeExercicio());
         e.printStackTrace();
     }
     return false;
  } // incluir
               
               public boolean incluir_Treino_a_Atleta (AtletaHasTreinoDO usuario) throws Exception{
     // efetuando a transacao
     Transacao tr = new Transacao();
     try {
       tr.begin();
         AtletaHasTreinoData AHTdata = new AtletaHasTreinoData();
         AHTdata.incluir(usuario, tr);
       tr.commit();
       return true;
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " + usuario.getId_TREINO());
         e.printStackTrace();
     }
     return false;
  } // incluir
               
     public boolean incluir_Treino (TreinoDO treino) throws Exception{
     // efetuando a transacao
     Transacao tr = new Transacao();
     try {
       tr.begin();
         TreinoData Tdata = new TreinoData();
         Tdata.incluir(treino, tr);
       tr.commit();
       return true;
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " + treino.getId_TREINO());
         e.printStackTrace();
     }
     return false;
  } // incluir 
     
     public boolean incluir_exercicio (ExercicioDO exercicio) throws Exception{
     // efetuando a transacao
     Transacao tr = new Transacao();
     try {
       tr.begin();
         ExercicioData Edata = new ExercicioData();
         Edata.incluir(exercicio, tr);
       tr.commit();
       return true;
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " + exercicio.getIdExercicio());
         e.printStackTrace();
     }
     return false;
  } // incluir    

     public TreinoDO busca_ultimo_treino() throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     TreinoData TData = new TreinoData();
	     TreinoDO tl = TData.buscar_ultimo(tr);
	   tr.commit();
	   return tl;
	 } catch (Exception e) {
	   tr.rollback();
	   e.printStackTrace();
	 }
	 return null;
  }
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

                          public Vector vetor_tipos_exercicio() {
     Transacao tr = new Transacao();
     try {
	    tr.beginReadOnly();
            TipoExercicioData TEdata = new TipoExercicioData();
            Vector vetor = TEdata.Exercicios(tr);
            tr.commit();
            return vetor;
     } catch(Exception e) {
                  System.out.println("erro ao incluir ");
         e.printStackTrace();
     }
     return null;
  } // pesquisar
                          
                              public TipoExercicioDO Busca_TipoEx_por_Id(int idobj) {
    Transacao tr = new Transacao();
    try {
        tr.beginReadOnly();
        TipoExercicioData TEdata = new TipoExercicioData();
        TipoExercicioDO tipo_exercicio = TEdata.buscar(idobj, tr);
        tr.commit();
        return tipo_exercicio;
     } catch(Exception e) {
                  System.out.println("erro ao incluir ");
         e.printStackTrace();
     }
     return null;
  } // pesquisar
                              
  public Vector vetor_instanciaexercicio_atleta(int idatl, int idex) {
    Transacao tr = new Transacao();
    try {
        tr.beginReadOnly();
        InstanciaExercicioData IEdata = new InstanciaExercicioData();
        Vector vetor = IEdata.buscarPorId_TipoExercicio_Atleta(idatl, idex, tr);
        tr.commit();
        return vetor;
     } catch(Exception e) {
                  System.out.println("erro ao incluir ");
         e.printStackTrace();
     }
     return null;
  } // pesquisar
  
    public Vector vetor_treino_idatleta(int idobj) {
    Transacao tr = new Transacao();
    try {
        tr.beginReadOnly();
        AtletaHasTreinoData AHTdata = new AtletaHasTreinoData();
        Vector vetor = AHTdata.buscar_por_id_atleta(idobj, tr);
        tr.commit();
        return vetor;
     } catch(Exception e) {
                  System.out.println("erro ao incluir ");
         e.printStackTrace();
     }
     return null;
  } // pesquisar
    
        public Vector vetor_exercicio_idtreino(int idobj) {
    Transacao tr = new Transacao();
    try {
        tr.beginReadOnly();
        ExercicioData Edata = new ExercicioData();
        Vector vetor = Edata.buscar_por_id_treino(idobj, tr);
        tr.commit();
        return vetor;
     } catch(Exception e) {
                  System.out.println("erro ao incluir ");
         e.printStackTrace();
     }
     return null;
  } // pesquisar
        
          public boolean criar_instancia_exercicio(InstanciaExercicioDO instancia) throws Exception{
     // efetuando a transacao
     Transacao tr = new Transacao();
     try {
       tr.begin();
         InstanciaExercicioData IEdata = new InstanciaExercicioData();
         IEdata.incluir(instancia, tr);
       tr.commit();
       return true;
     } catch(Exception e) {
         tr.rollback();
         e.printStackTrace();
     }
     return false;
  } // incluir
    
} // TRTN