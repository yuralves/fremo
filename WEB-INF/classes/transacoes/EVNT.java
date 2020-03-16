package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class EVNT {
    
    public UsuarioDO buscar_usuario_email(String email) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    UsuarioData Udata = new UsuarioData();
	    UsuarioDO u = Udata.buscarPorEmail(email, tr);
	    tr.commit();
            return u;
	} catch (Exception e) {
	    tr.rollback();
            e.printStackTrace();
	}
	return null;
    } // buscar_usuario_email
    
    public boolean criar_evento (EventoDO evento) throws Exception{
        // efetuando a transacao
        Transacao tr = new Transacao();
        try {
            tr.begin();
            EventoData Edata = new EventoData();
            Edata.incluir(evento, tr);
            tr.commit();
            return true;
        } catch(Exception e) {
            tr.rollback();
            System.out.println("erro ao incluir " + evento.getNome_Do_Evento());
            e.printStackTrace();
        }
        return false;
    } // incluir evento

    public EventoDO busca_evento_nome(String nome_evento) throws Exception{
        Transacao tr = new Transacao();
	try{
	    tr.beginReadOnly();
  	    EventoData EData = new EventoData();
	    EventoDO e = EData.pesquisarPorNomeEvento(nome_evento, tr);
	    tr.commit();
	    return e;
	} catch (Exception e) {
	    tr.rollback();
            e.printStackTrace();
	}
	return null;
    }
    
    public Vector todas_provas() {
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            TipoProvaData Provas = new TipoProvaData();
            Vector vetor = Provas.todas_provas(tr);
            tr.commit();
            return vetor;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean criar_prova (ProvasDO prova) throws Exception{
        // efetuando a transacao
        Transacao tr = new Transacao();
        try {
            tr.begin();
            ProvasData Pdata = new ProvasData();
            Pdata.incluir(prova, tr);
            tr.commit();
            return true;
        } catch(Exception e) {
            tr.rollback();
            System.out.println("erro ao incluir " + prova.getId_Tipo_De_Prova());
            e.printStackTrace();
        }
        return false;
    } // incluir
    
    public Vector todos_eventos() {
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            TipoEventoData Eventos = new TipoEventoData();
            Vector vetor = Eventos.buscar(tr);
            tr.commit();
            return vetor;
        } catch(Exception e) {
           e.printStackTrace();
        }
        return null;
    }
    
    public EventoDO busca_evento_por_ID(int idobj) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    EventoData EData = new EventoData();
	    EventoDO elb = EData.buscar(idobj, tr);
            tr.commit();
	    return elb;
            } catch (Exception e) {
                tr.rollback();
                e.printStackTrace();
            }
            return null;
    } //buscar evento por ID

    public Vector busca_provas_por_ID(int idobj) throws Exception{
        Transacao tr = new Transacao();
        try{
	   tr.beginReadOnly();
  	   ProvasData PData = new ProvasData();
	   Vector vetor = PData.buscarPorID_Evento(idobj, tr);
	   tr.commit();
	   return vetor;
        } catch (Exception e) {
           e.printStackTrace();
        }
     return null;
  }
    
    public TipoProvaDO busca_tipo_prova_por_ID(int idobj) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    TipoProvaData TPData = new TipoProvaData();
            TipoProvaDO tplb = TPData.buscar(idobj, tr);
            tr.commit();
            return tplb;
	} catch (Exception e) {
            tr.rollback();
            e.printStackTrace();
	}
	return null;
    }
    
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
    
    public ProvasDO busca_prova_por_ID_evento_ID_tiporpova(int id_evento, int id_tipoprova) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    ProvasData PData = new ProvasData();
	    ProvasDO plb = PData.buscarPorID_Evento_e_ID_Tipoprova(id_evento, id_tipoprova, tr);
            tr.commit();
            return plb;
	} catch (Exception e) {
            tr.rollback();
            e.printStackTrace();
	}
            return null;
    }
    
    public ListaAtletasDO busca_listaatleta_por_ID_user_ID_prova(int id_user, int id_prova) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    ListaAtletasData LAData = new ListaAtletasData();
	    ListaAtletasDO lalb = LAData.buscarPor_ID_User_e_ID_Prova(id_user, id_prova, tr);
            tr.commit();
	    return lalb;
	} catch (Exception e) {
	    tr.rollback();
            e.printStackTrace();
	}
	return null;
    }
    
    public boolean criar_lista_atleta (ListaAtletasDO listaatleta) throws Exception{
        // efetuando a transacao
        Transacao tr = new Transacao();
        try {
            tr.begin();
            ListaAtletasData LAdata = new ListaAtletasData();
            LAdata.incluir(listaatleta, tr);
            tr.commit();
            return true;
        } catch(Exception e) {
            tr.rollback();
            System.out.println("erro ao incluir prova de ID: " + listaatleta.getId_PROVA());
            e.printStackTrace();
        }
        return false;
    } // incluir
    
    public ProvasDO busca_prova_por_ID(int idobj) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    ProvasData PData = new ProvasData();
            ProvasDO plb = PData.buscar(idobj, tr);
            tr.commit();
            return plb;
	} catch (Exception e) {
	   tr.rollback();
	   e.printStackTrace();
	}
	return null;
    }
    
    public Vector todos_eventos_() {
        Transacao tr = new Transacao();
        try {
	    tr.beginReadOnly();
            EventoData Eventos = new EventoData();
            Vector vetor = Eventos.buscarTodosEventos(tr);
            tr.commit();
            return vetor;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public Vector buscar_lista_atleta_por_IDProvas(int idobj) {
        Transacao tr = new Transacao();
        try {
	    tr.beginReadOnly();
            ListaAtletasData ListaAtletas = new ListaAtletasData();
            Vector vetor = ListaAtletas.pesquisarPorProvas(idobj, tr);
            tr.commit();
            return vetor;
        } catch(Exception e) {
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
    
    public boolean atualizar_resultado_ListaAtletas(ListaAtletasDO atleta) throws Exception {
        Transacao tr = new Transacao();
        try{
            // inserir validacoes de regras de negocio
            tr.begin();
  	    ListaAtletasData LAdata = new ListaAtletasData();
            LAdata.atualizar_resultado(atleta, tr);
            tr.commit();
            return true;
        } catch (Exception e) {
            tr.rollback();
            e.printStackTrace();
	}
	return false;
    } // atualizar
    
    public Vector eventos_por_ID_federacao(int id_federacao) {
        Transacao tr = new Transacao();
        try {
	    tr.beginReadOnly();
            EventoData EData = new EventoData();
            Vector vetor = EData.pesquisarPorFederacao(id_federacao, tr);
            tr.commit();
            return vetor;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    } // eventos_por_ID_federacao
    
    public boolean atualizar_inscricao_ListaAtletas(ListaAtletasDO atleta) throws Exception {
        Transacao tr = new Transacao();
	try{
            // inserir validacoes de regras de negocio
            tr.begin();
  	    ListaAtletasData LAdata = new ListaAtletasData();
            LAdata.atualizar_inscricao(atleta, tr);
            tr.commit();
            return true;
	} catch (Exception e) {
	   tr.rollback();
	   e.printStackTrace();
	}
	return false;
    } // atualizar
    
    public Vector provas_de_evento(int id_evento) {
        Transacao tr = new Transacao();
        try {
	    tr.beginReadOnly();
            ProvasData PData = new ProvasData();
            Vector vetor = PData.buscarPorID_Evento(id_evento, tr);
            tr.commit();
            return vetor;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    } // provas_de_evento
    
    public Vector provas_de_tipo_prova(int id_tipo_prova) {
        Transacao tr = new Transacao();
        try {
	    tr.beginReadOnly();
            ProvasData PData = new ProvasData();
            Vector vetor = PData.buscarPorID_TipoProva(id_tipo_prova, tr);
            tr.commit();
            return vetor;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    } // provas_de_tipo_prova
    
    public boolean excluir_evento_por_ID (int id_evento) throws Exception {
        Transacao tr = new Transacao();
        try {
            tr.begin();
            EventoData EData = new EventoData();
            EData.excluir(id_evento, tr);
            tr.commit();
            return true;        
        } catch (Exception e) {
            tr.rollback();
            e.printStackTrace();
        }
        return false;
    }   //excluir_evento
    
    public boolean atualizar_evento(EventoDO evento) throws Exception {
        Transacao tr = new Transacao();
	try{
	   tr.begin();
  	   EventoData EData = new EventoData();
	   EData.atualizar(evento, tr);
	   tr.commit();
	   return true;
	} catch (Exception e) {
	   tr.rollback();
	   e.printStackTrace();
	}
	return false;
    } // atualizar_evento
    
    public boolean excluir_prova_de_evento_por_ID (int id_prova) throws Exception {
        Transacao tr = new Transacao();
        try {
        tr.begin();
        ProvasData PData = new ProvasData();
        PData.excluir(id_prova, tr);
        tr.commit();
        return true;        
        } catch (Exception e) {
          tr.rollback();
	  e.printStackTrace();
        }
        return false;
    }   //excluir_prova_de_evento_por_ID
    
        public Vector resultados(int id_evento) {
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            ResultadosData RData = new ResultadosData();
            Vector vetor = RData.listaResultados(id_evento,tr);
            tr.commit();
            return vetor;
        } catch(Exception e){
            e.printStackTrace();
        }
        return null;
        
    }
        
         public Vector eventos_por_data(String data) {
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            EventoData EData = new EventoData();
            Vector vetor = EData.pesquisarPorData(data,tr);
            tr.commit();
            return vetor;
        } catch(Exception e){
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
    
} // EVNT