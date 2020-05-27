
<!DOCTYPE html>
<html>
    <head>
        <title>Informations</title> 
        <%@ include file="/includes/header.jspf" %>
    </head>
    <script>
        $(function () {
            $("#datepicker").datepicker();
        });
        $(function () {
            $("#datepicker1").datepicker({maxDate: -0});
        });
    </script>
    <body>
            <div class="header" data-role="header" data-id="main-header" data-tap-toggle="false" 
                 data-theme="a" data-position="fixed" data-fullscreen="true">
                <h1>
                    <img id="logoHeader" src="images/alcisLogo.png" alt="alcisLogo"/>
                    Informations
                    <button type="submit" id="submitOK" name="submitOK">
                        <img id="white" src="css/themes/images/icons-png/power-white.png" alt="power-withe">
                        <img id="black" src="css/themes/images/icons-png/power-black.png" alt="power-black">
                    </button>
                    </form>
                </h1>
                <br><br>
                <div data-role='navbar' data-grid='b'>
                    <ul>
                        <li><a href='infos.jsp' data-ajax='false' id='navbarHome1' data-icon='info'>Infos</a></li>
                        <li><a href='stats.jsp' data-ajax='false' id='navbarLoc' data-icon='grid'>Stats</a></li>
                        <li><a href='historique.jsp' data-ajax='false' id='navbarInfos1' data-icon='clock'>Historique</a></li>
                    </ul>
                </div>
                <a href="#panelInfo" 
                   class="ui-btn ui-btn-icon-notext ui-corner-all ui-icon-action ui-btn-left">
                </a>
                <a href="#panelDate" 
                   class="ui-btn ui-btn-icon-notext ui-corner-all ui-icon-bars ui-btn-right">
                </a>
                <form id="btnDeconnectionLocalisation" method="post" action="index.jsp">
                    <input name="action" id="logout" type="hidden" value="logout"/>
                    <button type="submit" id="submitOK" name="submitOK">
                        <img id="white" src="css/themes/images/icons-png/power-white.png" alt="power-withe">
                        <img id="black" src="css/themes/images/icons-png/power-black.png" alt="power-black">
                    </button>
                </form>
                <a href="#panelInfo" 
           class="ui-btn ui-btn-icon-notext ui-corner-all ui-icon-action ui-btn-left">
        </a>
        <a href="#panelDate" 
           class="ui-btn ui-btn-icon-notext ui-corner-all ui-icon-bars ui-btn-right">
        </a>
            </div>    
        <div data-role="page" id="page1">
    <div role="main" class="ui-content">
        <center>
            <br/><br/><br/> 
            <br/><br/>
            <br/><br/>
            <br/><br/>
            <div class="grid">
                <div class="card">
                    <div class="cardTitre">Immatriculation</div>
                    <div class="container">
                        <div id="cnv" class="cardValeur">
                            AM-ZZZ-22
                        </div>

                    </div>
                </div>
                <div class="card">
                    <div class="cardTitre">Zone</div>
                    <div class="container">
                        <div id="cnvhz" class="cardValeur">
                            2
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="cardTitre">Age du véhicule</div>
                    <div class="container">
                        <div id="cam" class="cardValeur">
                            160
                        </div>
                        <div class="cardUnite">Jours</div>
                    </div>
                </div>
                <div class="card">
                    <div class="cardTitre">Kilométrage</div>
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
        </center>
    </div>
    <%@include file="/includes/footer.jspf"%>
    <!-- panel d'infos -->
    <div id="panelInfo" data-role="panel" data-position="left"  
         data-position-fixed="true" data-display="push">
        <ol id="listeInfo" data-role="listview" data-icon="false">
            <li data-role="list-divider">Séléctionnez des dates:</li>
            <p>Du: <input type="text" id="datepicker"></p>
            <p>Au: <input type="text" id="datepicker1"></p>
        </ol>
    </div>
    <!-- panel de véhicules -->
    <div id="panelDate" data-role="panel" data-position="right"  
         data-position-fixed="true" data-display="push">
        <ol id="listeInfo" data-role="listview" data-icon="false">
            <li data-role="list-divider">Séléctionnez un véhicule</li>
            <li id=""><a href='#'>ZD-555-ED</a></li>
            <li id=""><a href='#'>GG-999-ER</a></li>
            <li id=""><a href='#'>HH-444-ER</a></li>
        </ol>
    </div>
</div>
</body>
</html>