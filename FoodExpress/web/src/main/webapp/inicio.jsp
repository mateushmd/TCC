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
        <link rel="stylesheet" type="text/css" href="styles/rating.css">
        <link rel="stylesheet" type="text/css" href="styles/main/header.css">
        <link rel="stylesheet" type="text/css" href="styles/main/footer.css">
        <link rel="stylesheet" type="text/css" href="styles/slider.css">
        <link rel="icon" type="image/png" href="imgs/icon.png"/>
    </head>
    <body>
        <c:set var="usuario" value="${sessionScope.usuario}"/>
        <c:set var="sacola" value="${sessionScope.sacola}"/>
        <c:set var="acessibilidade" value="${sessionScope.acessibilidade}"/>
        <c:set var="lojas" value="${sessionScope.lojas}"/>

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
                    <div id="modal-perfil" class="modal hidden" data-modal-index="0">
                        <h2>Olá ${usuario.nome}</h2>
                        <ul>
                            <li><a href="dados.jsp"><img src="imgs/header/engrenagem.svg" alt="">Dados</a></li>
                            <li><a href=""><img src="imgs/header/pedido.svg" alt="">Pedidos</a></li>
                            

                        <li><a  id="conversasBtn"><img src="imgs/header/chat.svg" alt="">Conversas</a></li>
                                                    <input style="display: none" id="meuInput" value="${usuario.email}">
                            <script>
                            document.getElementById('conversasBtn').onclick = function () {
                                var valor = document.getElementById('meuInput').value;
                                window.location.href = 'conversas.jsp?valor=' + encodeURIComponent(valor);
                            };
                        </script>
                            <li><a href="meus-favoritos"><img src="imgs/header/coracao.svg" alt="">Favoritos</a></li>
                            <li><a href="acessibilidade.jsp"><img src="imgs/header/acessibilidade.svg" alt="">Acessibilidade</a></li>
                            <li><a href="logout"><img src="imgs/header/sair.svg" alt="">Sair</a></li>
                        </ul>
                    </div>
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

        <main>
            <section class="content">
                <h1>DESTAQUES</h1>
                <div class="carousel-container realign" data-items="2">
                    <div class="arrow arrow-rounded left-arrow"><img alt="" src="imgs/carrossel/seta.svg"></div>
                    <div class="carousel" data-index="0" >
                        <c:forEach items="${lojas}" var="loja">
                            <form action="loja" method="get">
                                <div class="item item-loja">
                                    <div class="img-container">
                                        <img src="imgs/teste/teste.jpg" alt="${loja.idUser}" id="imgLojaF">
                                    </div>
                                    <div class="info-container">
                                        <h2>${loja.nome}</h2>
                                        <div class="rating small process-rating" data-rating="<fmt:formatNumber value="${loja.avaliacao}" type="number" maxFractionDigits="0"/>">
                                            <label class="star-label" data-star="1"><img src="imgs/gray-star.svg" alt=""></label>

                                            <label class="star-label" data-star="2"><img src="imgs/gray-star.svg" alt=""></label>

                                            <label class="star-label" data-star="3"><img src="imgs/gray-star.svg" alt=""></label>

                                            <label class="star-label" data-star="4"><img src="imgs/gray-star.svg" alt=""></label>

                                            <label class="star-label" data-star="5"><img src="imgs/gray-star.svg" alt=""></label>
                                        </div>
                                        <div class="carousel-favorite">
                                            <button type="submit" value="FAVORITAR">♥</button>
                                        </div>
                                        <input type="hidden" name="id" value="${loja.id}" class="id">
                                    </div>
                                </div>
                            </form>
                        </c:forEach>
                    </div>
                    <div class="arrow arrow-rounded right-arrow"><img src="imgs/carrossel/seta.svg" alt=""></div>
                </div>
                <h1 style="margin-top: 50px;">NOVIDADES</h1>
                <div class="carousel-container realign" data-items="2">
                    <div class="arrow arrow-rounded left-arrow"><img src="imgs/carrossel/seta.svg" alt=""></div>
                    <div class="carousel" data-index="0" >
                        <c:forEach items="${lojas}" var="loja">
                            <form action="loja" method="post">
                                <div class="item item-loja">
                                    <div class="img-container">
                                        <img src="imgs/teste/teste.jpg" alt="${loja.idUser}" id="imgLojaF">
                                    </div>
                                    <div class="info-container">
                                        <h2>${loja.nome}</h2>
                                        <div class="rating small process-rating" data-rating="<fmt:formatNumber value="${loja.avaliacao}" type="number" maxFractionDigits="0"/>">
                                            <label class="star-label" data-star="1"><img src="imgs/gray-star.svg" alt=""></label>

                                            <label class="star-label" data-star="2"><img src="imgs/gray-star.svg" alt=""></label>

                                            <label class="star-label" data-star="3"><img src="imgs/gray-star.svg" alt=""></label>

                                            <label class="star-label" data-star="4"><img src="imgs/gray-star.svg" alt=""></label>

                                            <label class="star-label" data-star="5"><img src="imgs/gray-star.svg" alt=""></label>
                                        </div>
                                        <div class="carousel-favorite">
                                            <button type="submit" value="FAVORITAR">♥</button>
                                        </div>
                                        <input type="hidden" name="id" value="${loja.id}" class="id">
                                        <input type="hidden" name="submitAction" class="submit-action">
                                    </div>
                                </div>
                            </form>
                        </c:forEach>
                    </div>
                    <div class="arrow arrow-rounded right-arrow"><img src="imgs/carrossel/seta.svg" alt=""></div>
                </div>
                <h1 style="margin-top: 50px;">MAIS BEM AVALIADOS</h1>
                <div class="carousel-container realign" data-items="2">
                    <div class="arrow arrow-rounded left-arrow"><img src="imgs/carrossel/seta.svg" alt=""></div>
                    <div class="carousel" data-index="0" >
                        <c:forEach items="${lojas}" var="loja">
                            <form action="loja" method="post">
                                <div class="item item-loja">
                                    <div class="img-container">
                                        <img src="imgs/teste/teste.jpg" alt="${loja.idUser}" id="imgLojaF">
                                    </div>
                                    <div class="info-container">
                                        <h2>${loja.nome}</h2>
                                        <div class="rating small process-rating" data-rating="<fmt:formatNumber value="${loja.avaliacao}" type="number" maxFractionDigits="0"/>">
                                            <label class="star-label" data-star="1"><img src="imgs/gray-star.svg" alt=""></label>

                                            <label class="star-label" data-star="2"><img src="imgs/gray-star.svg" alt=""></label>

                                            <label class="star-label" data-star="3"><img src="imgs/gray-star.svg" alt=""></label>

                                            <label class="star-label" data-star="4"><img src="imgs/gray-star.svg" alt=""></label>

                                            <label class="star-label" data-star="5"><img src="imgs/gray-star.svg" alt=""></label>
                                        </div>
                                        <div class="carousel-favorite">
                                            <button type="submit" value="FAVORITAR">♥</button>
                                        </div>
                                        <input type="hidden" name="id" value="${loja.id}" class="id">
                                        <input type="hidden" name="submitAction" class="submit-action">
                                    </div>
                                </div>
                            </form>
                        </c:forEach>
                    </div>
                    <div class="arrow arrow-rounded right-arrow"><img src="imgs/carrossel/seta.svg" alt=""></div>
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
                            <li><a href="gerenciarperfil.jsp"> Perfil</a></li>
                            <li><a href="sobre.jsp">Sobre</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>Obter ajuda</h4>
                        <ul>
                            <li><a href="faq.jsp">FAQ</a></li>
                            <li><a href="ajuda.jsp">Ajuda</a></li>
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
                            <a href="#"> <i class="fa fa-facebook"></i> </a>
                            <a href="#"> <i class="fa fa-instagram"></i> </a>
                            <a href="#"> <i class="fa fa-twitter"></i> </a>
                            <a href="#"> <i class="fa fa-linkedin"></i> </a>
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
                                <button>
                                    <p>Realizar pedido</p>
                                </button>
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

                    const storageRef = ref(storage, 'lojaFoto/' + altText);

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
        <script src="scripts/carrossel.js"></script>
        <script src="scripts/rating.js"></script>
        <script src="scripts/acessibilidade/acessibilidade.js"></script>
        <script src="scripts/janelas-modais/slider.js"></script>
        <script src="scripts/janelas-modais/modal.js"></script>
    </body>
</html>
