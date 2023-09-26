package com.foodexpress.model.dao;
import com.foodexpress.model.dto.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class teste {
    public static void main(String[] args) throws SQLException {
        PedidoDAO dao = PedidoDAO.getInstance();
        
        dao.confirmarPedido(234, "2023-09-26 15:15:27");
        
        List<ItemPedidoDTO> itens = new ArrayList<>();
        itens.add(new ItemPedidoDTO(134, 5, 22.5));
        itens.add(new ItemPedidoDTO(114, 1, 4.5));
        itens.add(new ItemPedidoDTO(114, 1, 4.5));
        
        dao.realizarPedido(new PedidoDTO(24, "merezendep06@gmail.com", "2023-09-22 18:31:45", "hall p20", 0, "Pendente"), itens);
    }
}