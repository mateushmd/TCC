package com.foodexpress.model.dto;

public class LojaDTO {
    private int id;
    private String nome;
    private String descricao;
    private double avaliacao;
    private String idUser;

    public LojaDTO(int id, String nome, String descricao, double avaliacao, String idUser) {
        this.id = id;
        this.nome = nome;
        this.descricao = descricao;
        this.avaliacao = avaliacao;
        this.idUser = idUser;
    }
    
    public LojaDTO(){
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public double getAvaliacao() {
        return avaliacao;
    }

    public void setAvaliacao(double avaliacao) {
        this.avaliacao = avaliacao;
    }

    public String getIdUser() {
        return idUser;
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }
}
