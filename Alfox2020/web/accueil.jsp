
<!DOCTYPE html>
<html>
    <head>
        <title>Accueil</title> 
        <%@ include file="/includes/header.jspf" %>  
    </head>
    <body>

        <div data-role="page" id="page1">
            <div class="header" data-role="header" data-id="main-header" data-tap-toggle="false" 
                 data-theme="a" data-position="fixed" data-fullscreen="true">
                <h1>
                    <img id="logoHeader" src="images/alcisLogo.png"/>
                    <form id="btnDeconnection" method="post" action="index.jsp">
                        <input name="action" id="logout" type="hidden" value="logout"/>
                        <button type="submit" id="submitOK" name="submitOK">
                            <img id="white" src="css/themes/images/icons-png/power-white.png" >
                            <img id="black" src="css/themes/images/icons-png/power-black.png" >
                        </button>
                    </form>
                </h1>
            </div>

            <div role="main" class="ui-content">
                <center>
                    <br/><br/><br/> 
                    <h1>Tableau de bord</h1>
                    <br/><br/>
                    <div class="grid">
                        <div class="card">
                            <div class="cardTitre">Nombre de véhicules</div>
                            <div class="container">
                                <div id="cnv" class="cardValeur">
                                    10
                                </div>
                                <div class="cardUnite">Véhicules</div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="cardTitre">Nombre de véhicules hors zone</div>
                            <div class="container">
                                <div id="cnvhz" class="cardValeur">
                                    2
                                </div>
                                <div class="cardUnite">Véhicules</div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="cardTitre">Age moyen</div>
                            <div class="container">
                                <div id="cam" class="cardValeur">
                                    160
                                </div>
                                <div class="cardUnite">Jours</div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="cardTitre">Kilométrage moyen</div>
                            <div class="container">
                                <div id="ckm" class="cardValeur">
                                    60000
                                </div>
                                <div class="cardUnite">Km</div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="cardTitre">Kilométrage mensuel moyen</div>
                            <div class="container">
                                <div id="ckmm" class="cardValeur">
                                    1540
                                </div>
                                <div class="cardUnite">Km/mois</div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="cardTitre">Conso. mensuelle moyenne</div>
                            <div class="container">
                                <div id="ccmm" class="cardValeur">
                                    5.5
                                </div>
                                <div class="cardUnite">l/100km</div>
                            </div>
                        </div>
                    </div>

                    <br/><br/><br/><br/><br/>
                    <p class="mini">V3.1 - Mars 2020<br/>Développement : BTS SNIR Lycée V.Hugo Colomiers</p>
                    <br/><br/><br/>
                </center>
            </div>
            <%@include file="/includes/footer.jspf"%>
        </div>
    </body>
</html>