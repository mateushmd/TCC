package com.foodexpress.model.service;

import com.foodexpress.model.dao.LojaDAO;
import com.foodexpress.model.dao.ProdutoDAO;
import com.foodexpress.model.dto.LojaDTO;
import com.foodexpress.model.dto.ProdutoDTO;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LojaService {
    private LojaDAO ldao;
    
    private ProdutoDAO pdao;
    
    private static LojaService instance = null;
    
    private LojaService(){
        ldao = LojaDAO.getInstance();
        
        pdao = ProdutoDAO.getInstance();
    }
    
    public static LojaService getInstance(){
        if(instance == null)
            instance = new LojaService();
        
        return instance;
    }
    
    public int login(String idUser){
        int check = ldao.login(idUser);
        System.out.println(check);
        
        return check;
    }
    
    public LojaDTO getLoja(String idUser) {
        return ldao.getLoja(idUser);
    }
    
    public boolean updateNomeDescricao(LojaDTO obj){
        return ldao.updateND(obj);
    }
    
    public boolean updateAvaliacao(LojaDTO obj){
        return ldao.updateA(obj);
    }
    
    public void cadastrar(LojaDTO obj){
        ldao.cadastrar(obj);
    }
    
    public ArrayList<LojaDTO> listarLojas() {
        return (ArrayList) ldao.ListarLojas();
    }
    
    public LojaDTO getLoja(){
        return ldao.getLoja();
    }
    
    public boolean adicionarProduto(ProdutoDTO obj){
        return pdao.cadastrar(obj);
    }
    
    public ArrayList<ProdutoDTO> listarProdutos(int idLoja) {
        return (ArrayList) pdao.listar(idLoja);
    } 
    
    public boolean editarProduto(ProdutoDTO obj) {
        return pdao.update(obj);
    }
}
