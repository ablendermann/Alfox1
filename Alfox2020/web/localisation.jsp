
<!DOCTYPE html>
<html>
    <head>
        <title>Localisation</title> 
        <%@ include file="/includes/header.jspf" %>
        <%-- force le rechargement du script (no cache) --%>
        <script type="text/javascript" src="js/map.js?ts=
                <% out.print(System.currentTimeMillis());%>"
                >
        </script>
        <%-- appelle la function JS initialize --%>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAteLjItiBvWdZJNOm97mU-jWaqtJ857Fc&callback=initMap"></script>
    </head>
    <body>

        <div data-role="page" id="page1">
            <div class="header" data-role="header" data-id="main-header" data-tap-toggle="false" 
                 data-theme="a" data-position="fixed" data-fullscreen="true">
                <h1>
                    <img id="logoHeader" src="images/alcisLogo.png"/>
                    Localisation  

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
                <br/><br/><br/>
                <div id="test1"></div>
                <div id="test2"></div>
                <!-- map google -->
                <div id="map"></div>
                <script>

                    function initMap() {


                        var Toulouse = {lat: 43.600000, lng: 1.433333};
                        var map = new google.maps.Map(document.getElementById('map'), {
                            zoom: 10,
                            center: Toulouse
                        });
                        var marker = new google.maps.Marker({
                            position: Toulouse,
                            map: map,
                            title: 'Ceci est un test'
                        });
                    }
                </script>         
                <br/><br/><br/>
            </div>        




            <div class="footer" data-role="footer" data-theme="a" data-tap-toggle="false"
                 data-id="main-footer" data-position="fixed" data-fullscreen="true">
                <div data-role='navbar' data-grid='c'>
                    <ul>
                        <li><a href='accueil.jsp' data-ajax='false' id='navbarhome' data-icon='home'>Accueil</a></li>
                        <li><a href='localisation.jsp' data-ajax='false' id='navbarSuivi' data-icon='location'>Localisation</a></li>
                        <li><a href='infos.jsp' data-ajax='false' id='navbarInfos' data-icon='info'>Infos</a></li>
                        <li><a href='gestion.jsp' data-ajax='false' id='navbarGestion' data-icon='edit'>Gestion</a></li>
                    </ul>
                </div>
                </body>
                </html>