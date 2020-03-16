package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class VSTN {
    
      public boolean adicionar_mensagem(MensagemDO mensagem) throws Exception{
      Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     MensagemData Mdata = new MensagemData();
             Mdata.incluir(mensagem, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
           tr.rollback();
	   e.printStackTrace();
	 }
      return false;
  } 
      
    public Vector todos_clubes(){
     Transacao tr = new Transacao();
     try {
	    tr.beginReadOnly();
            ClubeData clubes = new ClubeData();
            Vector vetor = clubes.todosClubes(tr);
            tr.commit();
            return vetor;
     } catch(Exception e) {
         e.printStackTrace();
     }
     return null;
  }
    
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
        
        public NewsletterDO buscar_newsletter_email(String email) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     NewsletterData Udata = new NewsletterData();
	     NewsletterDO u = Udata.buscar(email, tr);
	   tr.commit();
	   return u;
	 } catch (Exception e) {
	   tr.rollback();
	   e.printStackTrace();
	 }
	 return null; 
  } // buscar_newletter_email
        
              public boolean incluir_newsletter_email (NewsletterDO newsletter) throws Exception{

    // validacao das regras de negocio
     if (isEmpty(newsletter.getEmail())) {
       return false;
     }
          
     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

        tr.begin();
        NewsletterData cdata = new NewsletterData();
        cdata.incluir(newsletter, tr);
        tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " + newsletter.getEmail());
         e.printStackTrace();
     }
     return false;
  } // incluir_newsletter_email
              
  private boolean isEmpty(String s) {
     if (null == s)
       return true;
     if (s.length() == 0)
       return true;
     return false;
  }
  
         public boolean excluir_newsletter_email(NewsletterDO newsletter) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     NewsletterData Ndata = new NewsletterData();
	     Ndata.excluir(newsletter, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao atualizar" + newsletter.getEmail());
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar

public MensagemDO buscar_email_id(int email_id) throws Exception{
        Transacao tr = new Transacao();
        try{
            tr.begin();
             MensagemData Udata = new MensagemData();
	     MensagemDO u = Udata.buscar_email_id(email_id, tr);
            tr.commit();
            return u;
        }
        catch (Exception e){
            tr.rollback();
            e.printStackTrace();
            
        }
        return null;
    
    }         

    public boolean excluir_mensagem(int idobj) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     MensagemData Ndata = new MensagemData();
	     Ndata.excluir(idobj, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   e.printStackTrace();
	 }
	 return false;
  }
    
        public Vector buscar_email_clube(int clube_id) throws Exception{
        Transacao tr = new Transacao();
        try{
            tr.begin();
             MensagemData Udata = new MensagemData();
	     Vector u = Udata.buscar_emails(clube_id, tr);
            tr.commit();
            return u;
        }
        catch (Exception e){
            tr.rollback();
            e.printStackTrace();
            
        }
        return null;
    
    }
         
} // Contato