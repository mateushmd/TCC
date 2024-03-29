<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FoodExpress</title>
        <link rel="stylesheet" type="text/css" href="styles/main/main.css">
        <link rel="stylesheet" type="text/css" href="styles/inicio.css">
        <link rel="stylesheet" type="text/css" href="styles/carrossel.css">
        <link rel="stylesheet" type="text/css" href="styles/main/header.css">
        <link rel="stylesheet" type="text/css" href="styles/main/footer.css">
        <link rel="stylesheet" type="text/css" href="styles/slider.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="icon" type="image/png" href="imgs/icon.png"/>
    </head>
    <body>
        <c:set var="usuario" value="${sessionScope.usuario}"/>
        <c:set var="sacola" value="${sessionScope.sacola}"/>
        <c:set var="acessibilidade" value="${sessionScope.acessibilidade}"/>
        <c:set var="gruposLojas" value="${sessionScope.gruposLojas}"/>
        <c:set var="lojas" value="${sessionScope.lojas}" />
        <c:set var="temMaisLoja" value="${sessionScope.temMaisLoja}" />

        <header id="navbar">
            <img id="navbar-logo" src="imgs/logo3.png" alt="Logo">
            <div id="navbar-menu">
                <a class="navbar-link" href="inicio.jsp">Início</a>
                <a class="navbar-link" href="meus-favoritos">Favoritos</a>
                <a class="navbar-link" href="#">Sobre</a>
            </div>
            <div id="search-bar">
                <img src="imgs/lupa-azul.svg" alt="">
                <input type="text" placeholder="Pesquisar...">
            </div>
            <div id="navbar-icons">
                <div id="profile">
                    <img id="profile-pic" class="modal-trigger" data-modal-index="0" src="imgs/header/icone-perfil.png"
                         alt="Perfil">
                </div>
                <div id="orders">
                    <img id="orders-pic" src="imgs/header/sacola.svg" class="slider-trigger" data-slider-index="0" alt="Pedidos">
                    <div id="orders-info">
                        <p>R$ <span id="orders-preco"><fmt:formatNumber value="${sacola.total}" type="number" pattern="0.00" /></span></p>
                        <p><span id="orders-quantidade">${sacola.quantidade}</span> ${sacola.quantidade eq 1 ? 'item' : 'itens'}</p>
                    </div>
                </div>
            </div>
        </header>

        <div id="modal-perfil" class="modal hidden" data-modal-index="0">
            <button class="close-modal styled">
                <img src="imgs/x-symbol.svg" alt="">
            </button>
            <div>
                <h2>Olá ${usuario.nome}</h2>
                <ul>
                    <li><a href="dados.jsp"><img src="imgs/header/engrenagem.svg" alt="">Dados</a></li>
                    <li><a href="meus-pedidos"><img src="imgs/header/pedido.svg" alt="">Pedidos</a></li>
                    <li><a href="meus-favoritos"><img src="imgs/header/coracao.svg" alt="">Favoritos</a></li>
                    <li><a href="acessibilidade.jsp"><img src="imgs/header/acessibilidade.svg" alt="">Acessibilidade</a>
                    </li>
                    <li><a href="logout"><img src="imgs/header/sair.svg" alt="">Sair</a></li>
                </ul>
            </div>
        </div>

        <header id="navbar-responsive" class="hidden">
            <div>
                <img src="imgs/header/house.svg" alt="">
                <p>Início</p>
            </div>
            <div>
                <img src="imgs/lupa-azul.svg" alt="">
                <p>Buscar</p>
            </div>
            <div class="slider-trigger" data-slider-index="0">
                <img src="imgs/header/sacola.svg" alt="">
                <p>Sacola</p>
            </div>
            <div class="modal-trigger" data-modal-index="0">
                <img src="imgs/header/icone-perfil.png" alt="">
                <p>Perfil</p>
            </div>
        </header>

        <main>
            <section class="content">
                <c:forEach items="${gruposLojas}" var="grupo">
                    <h1>${grupo.titulo}</h1>
                    <div class="carousel-container realign" data-items="2">
                        <div class="arrow arrow-rounded left-arrow"><img alt="" src="imgs/carrossel/seta.svg"></div>
                        <div class="carousel" data-index="0" >
                            <c:forEach items="${grupo.lojas}" var="loja">
                                <div class="item item-loja loja" data-id="${loja.id}">
                                    <div class="img-container">
                                        <img src="imgs/teste/teste.png" alt="${loja.idUser}" id="imgLojaF">
                                    </div>
                                    <div class="info-container">
                                        <h2>${loja.nome}</h2>
                                        <div class="disponibilidade ${loja.aberto ? 'aberto' : 'fechado'}">
                                            <svg viewBox="0 0 100 100" fill="${loja.aberto ? 'green' : 'red'}" xmlns="http://www.w3.org/2000/svg">
                                                <circle cx="50" cy="50" r="50"></circle>
                                            </svg>
                                            <p>${loja.aberto ? 'Aberto' : 'Fechado'}</p>
                                        </div>
                                        <div class="avaliacao">
                                            <img src="imgs/star.svg" alt="">
                                            <p><fmt:formatNumber value="${loja.avaliacao}" type="number" pattern="#,##0.0" /></p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="arrow arrow-rounded right-arrow"><img src="imgs/carrossel/seta.svg" alt=""></div>
                    </div>
                </c:forEach>
                <h1>LOJAS</h1>
                <div class="lojas-container">
                    <div class="loja clone hidden">
                        <img src="imgs/teste/teste.png" class="img-loja" alt="">
                        <div class="loja-body">
                            <h2></h2>
                            <div class="avaliacao">
                                <img src="imgs/star.svg" alt="">
                                <p></p>
                            </div>
                            <div class="disponibilidade">
                                <svg viewBox="0 0 100 100" fill="" xmlns="http://www.w3.org/2000/svg">
                                    <circle cx="50" cy="50" r="50"></circle>
                                </svg>
                                <p></p>
                            </div>
                        </div>
                    </div>

                    <div class="lojas-infinite">
                        <c:forEach items="${lojas}" var="loja">
                            <div class="loja lojas" data-id="${loja.id}">
                                <img src="imgs/teste/teste.png" class="img-loja" alt="${loja.idUser}">
                                <div class="loja-body">
                                    <h2>${loja.nome}</h2>
                                    <div class="avaliacao">
                                        <img src="imgs/star.svg" alt="">
                                        <p>${loja.avaliacao}</p>
                                    </div>
                                    <div class="disponibilidade ${loja.aberto ? 'aberto' : 'fechado'}">
                                        <svg viewBox="0 0 100 100" fill="${loja.aberto ? 'green' : 'red'}" xmlns="http://www.w3.org/2000/svg">
                                            <circle cx="50" cy="50" r="50"></circle>
                                        </svg>
                                        <p>${loja.aberto ? 'Aberto' : 'Fechado'}</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <c:if test="${temMaisLoja}">
                        <button class="carregar-mais-lojas" data-call="1">Ver mais</button>
                    </c:if>
                </div>
            </section>
        </main>
        <footer>
            <div class="container-footer">
                <div class="row-footer">
                    <div class="footer-col">
                        <h4>Menu</h4>
                        <ul>
                            <li><a href="inicio.jsp"> Inicio</a></li>
                            <li><a href="dados.jsp">Perfil</a></li>
                            <li><a href="sobre.jsp">Sobre</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>Obter ajuda</h4>
                        <ul>
                            <li><a href="faq.jsp">FAQ</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>Informações</h4>
                        <ul>
                            <li><a href="privacidade.jsp">Politica de privacidade</a></li>
                            <li><a href="uso.jsp">Politica de uso</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>Inscreva-se!</h4>

                        <div class="medias-socias">

                            <a href="https://www.instagram.com/cfoodexpress/"> <i class="fa fa-instagram"></i> </a>
                            <a href="https://twitter.com/CFoodExpress_"> <i class="fa fa-twitter"></i> </a>
                        </div>

                    </div>
                </div>
            </div>
            <div class="main_footer_copy">
                <p class="m-b-footer"> FoodExpress - 2023, todos os direitos reservados.</p>
            </div>
        </footer>

        <div id="slider">
            <button id="close-slider">
                <img src="imgs/x-symbol.svg" alt="">
            </button>

            <div class="slider-content">
                <div class="slider-container">
                    <div id="bag">
                        <div id="empty-bag" class="${empty sacola.itens ? '' : 'hidden'}">
                            <div id="empty-bag-img-container">
                                <img src="imgs/header/sacola.svg" alt="">
                                <img src="imgs/x-symbol.svg" alt="">
                            </div>
                            <h2>Sua sacola está vazia</h2>
                            <p>Adicione itens para comprar</p>
                        </div>
                        <div id="bag-container" class="${empty sacola.itens ? 'hidden' : ''}">
                            <div id="bag-header">
                                <p>Seu pedido</p>
                                <div>
                                    <h2>${sacola.nomeLoja}</h2>
                                    <a href="loja?id=${sacola.idLoja}">Ir para a loja</a>
                                </div>
                            </div>
                            <div id="bag-body">
                                <div class="bag-produtos">
                                    <p>Produtos</p>
                                    <c:forEach items="${sacola.itens}" var="item">
                                        <div class="bag-produto" data-id-produto="${item.produtoId}" data-id-item="${item.itemSacolaId}">
                                            <div class="bag-produto-header">
                                                <p><span class="bag-produto-quantidade">${item.quantidade}</span>x <span class="bag-produto-nome">${item.produtoNome}</span></p>
                                                <p class="preco">R$ <span class="bag-produto-preco"><fmt:formatNumber value='${item.precoTotal}' pattern='0.00' /></span></p>
                                            </div>
                                            <div class="bag-produto-body">
                                                <p class="bag-produto-descricao">${item.produtoDescricao}</p>
                                            </div>
                                            <div class="bag-produto-footer">
                                                <input type="submit" value="Remover" class="bag-remover-produto">
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div id="bag-footer">
                                <div>
                                    <p>Total</p>
                                    <p class="preco">R$ <span id="bag-preco"><fmt:formatNumber value='${sacola.total}' pattern='0.00'/></span></p>
                                </div>
                                <div id="opcoes-pedido">
                                    <button id="fazer-pedido">
                                        <p>Pedir</p>
                                    </button>
                                    <div id="select">
                                        <select name="" id="pontos-pedido">
                                            <c:choose>
                                                <c:when test="${sacola.pontos eq null}">
                                                    <option value="-2">Loja fechada</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:choose>
                                                        <c:when test="${empty sacola.pontos}">
                                                            <option value="-1">Sem ponto de encontro</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:forEach items="${sacola.pontos}" var="ponto" varStatus="loop">
                                                                <option value="${ponto.id}" ${loop.index eq 0 ? 'selected' : ''}>${ponto.nome}</option>
                                                            </c:forEach>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:otherwise>
                                            </c:choose>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="module">
            import { initializeApp } from "https://www.gstatic.com/firebasejs/9.23.0/firebase-app.js";
            import { getStorage, ref, getDownloadURL } from "https://www.gstatic.com/firebasejs/9.23.0/firebase-storage.js";
            const firebaseConfig = {
                apiKey: "AIzaSyC6E9U_uW78MMsIf9oQKBTm5LjvRp6OB2A",
                authDomain: "restricted-d6b24.firebaseapp.com",
                databaseURL: "https://restricted-d6b24-default-rtdb.firebaseio.com",
                projectId: "restricted-d6b24",
                storageBucket: "restricted-d6b24.appspot.com",
                messagingSenderId: "351037789777",
                appId: "1:351037789777:web:5a43c6cd09be7a53d70a70",
                measurementId: "G-G0VFKP7XGK"
            };
            const app = initializeApp(firebaseConfig);
            function getImageUrlByName() {
                const storage = getStorage(app); // Corrigido para usar 'app' em vez de 'firebaseApp'
                let e = document.getElementById("imgLojaF");
                const imgElements = document.querySelectorAll('.img-container img');
                imgElements.forEach(async imgElement => {
                    const altText = imgElement.getAttribute('alt');
                    console.log(altText);

                    const storageRef = ref(storage, 'lojaBanner/' + altText);

                    try {
                        const imageUrl = await getDownloadURL(storageRef);
                        if (imageUrl) {
                            imgElement.src = imageUrl;
                        } else {
                            console.log("Erro ao carregar a imagem para o email:", altText);
                        }
                    } catch (error) {
                        console.error('Erro ao obter URL de download:', error);
                    }
                });
            }

            document.addEventListener("DOMContentLoaded", async function () {
                getImageUrlByName();
            });
        </script>
        <script type="module">
            import { initializeApp } from "https://www.gstatic.com/firebasejs/9.23.0/firebase-app.js";
            import { getStorage, ref, getDownloadURL } from "https://www.gstatic.com/firebasejs/9.23.0/firebase-storage.js";
            const firebaseConfig = {
                apiKey: "AIzaSyC6E9U_uW78MMsIf9oQKBTm5LjvRp6OB2A",
                authDomain: "restricted-d6b24.firebaseapp.com",
                databaseURL: "https://restricted-d6b24-default-rtdb.firebaseio.com",
                projectId: "restricted-d6b24",
                storageBucket: "restricted-d6b24.appspot.com",
                messagingSenderId: "351037789777",
                appId: "1:351037789777:web:5a43c6cd09be7a53d70a70",
                measurementId: "G-G0VFKP7XGK"
            };
            const app = initializeApp(firebaseConfig);
            function getImageUrlByName() {
                const storage = getStorage(app); // Corrigido para usar 'app' em vez de 'firebaseApp'
                const imgElements = document.querySelectorAll('.loja.lojas img');
                imgElements.forEach(async imgElement => {
                    const altText = imgElement.getAttribute('alt');
                    console.log(altText);

                    const storageRef = ref(storage, 'lojaPerfil/' + altText);

                    try {
                        const imageUrl = await getDownloadURL(storageRef);
                        if (imageUrl) {
                            imgElement.src = imageUrl;
                        } else {
                            console.log("Erro ao carregar a imagem para o email:", altText);
                        }
                    } catch (error) {
                        console.error('Erro ao obter URL de download:', error);
                    }
                });
            }

            document.addEventListener("DOMContentLoaded", async function () {
                getImageUrlByName();
            });
        </script>
        <script>
            const configuracoesAcessibilidade = [
                '${acessibilidade.temaEscuro}' !== 'false',
                '${acessibilidade.contraste}' !== 'false',
                '${acessibilidade.visibilidadeTexto}' !== 'false',
                (parseInt('${acessibilidade.tamanhoTexto}') / 100)
            ];
        </script>

        <script src="scripts/jquery/jquery.js"></script>
        <script type="module" src="scripts/sacola/removerSacola.js"></script>
        <script type="module" src="scripts/sacola/fazerPedido.js"></script>
        <script src="scripts/carrossel.js"></script>
        <script src="scripts/usuario/acessibilidade/acessibilidade.js"></script>
        <script src="scripts/janelas-modais/slider.js"></script>
        <script type="module" src="scripts/janelas-modais/modal.js"></script>
        <script src="scripts/busca.js"></script>
        <script type="module" src="scripts/loja/acessar.js"></script>
        <script type="module" src="scripts/inifiniteScroll.js"></script>
        <script src="scripts/responsiveNavBar.js"></script>
    </body>
</html>

