<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FoodExpress</title>
        <link rel="stylesheet" type="text/css" href="styles/main/main.css">
        <link rel="stylesheet" type="text/css" href="styles/style.css">
        <link rel="icon" type="image/png" href="imgs/icon.png"/>
    </head>
    <body>
        <div class="main">
            <div class="fundo"></div>
            <div class="containerLogin">
                <img src="imgs/logo-sem-fundo.png" class="logoLog" alt="">
                <div class="form">
                    <section class="campo">
                        <label for="email" class="label">E-MAIL:</label>
                        <input type="email" id="email" name="email">
                    </section>

                    <section class="campo">
                        <label for="password" class="label">SENHA:</label>
                        <input type="password" id="password" name="password">
                        <a href="recuperar-conta.jsp" id="senhaBtn">  Esqueci minha senha</a>
                    </section>

                    <div class="botao">
                        <input type="submit" value="LOGAR" style="cursor: pointer; font-family: 'Oswald', sans-serif;" id="login" data-key="13">
                        <p class="parag">Não tem cadastro? <a href="cadastro.html" id="cadastroBtn">Cadastrar</a></p>
                    </div>
                </div>
            </div>
        </div>

        <script src="scripts/jquery/jquery.js"></script>

        <script src="scripts/autenticacao/login.js"></script>
        <script src="scripts/keyListener.js"></script>
    </body>
</html>

