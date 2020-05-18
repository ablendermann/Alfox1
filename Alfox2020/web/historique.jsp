<html>
    <head>
        <title>Historique</title> 
        <%@ include file="/includes/header.jspf" %>

        <%-- appelle la function JS initialize --%>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAteLjItiBvWdZJNOm97mU-jWaqtJ857Fc&callback=initMap"></script>
        <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
   $( function() {
    $( "#datepicker1" ).datepicker({ maxDate: -0});
  } );
 
  </script>
    </head>
    <body>
        <div data-role="page" id="page1">
            <div class="header" data-role="header" data-id="main-header" data-tap-toggle="false" 
                 data-theme="a" data-position="fixed" data-fullscreen="true">
                <h1>
                    <img id="logoHeader" src="images/alcisLogo.png"/>
                    Historique 

                    <form id="btnDeconnectionLocalisation" method="post" action="index.jsp">
                        <input name="action" id="logout" type="hidden" value="logout"/>
                        <button type="submit" id="submitOK" name="submitOK">
                            <img id="white" src="css/themes/images/icons-png/power-white.png" >
                            <img id="black" src="css/themes/images/icons-png/power-black.png" >
                        </button>
                    </form>

                </h1>
                <div data-role='navbar' data-grid='b'>
                    <ul>
                        <li><a href='infos.jsp' data-ajax='false' id='navbarHome1' data-icon='info'>Infos</a></li>
                        <li><a href='stats.jsp' data-ajax='false' id='navbarLoc' data-icon='grid'>Stats</a></li>
                        <li><a href='historique.jsp' data-ajax='false' id='navbarInfos1' data-icon='clock'>Historique</a></li>

                    </ul>
                </div>
                <a href="#panelInfo" 
                   class="ui-btn ui-btn-icon-notext ui-corner-all ui-icon-location ui-btn-left">
                </a>
                <a href="#panelDate" 
                   class="ui-btn ui-btn-icon-notext ui-corner-all ui-icon-bars ui-btn-right">
                </a>
            </div>
            <br><br>
            <div role="main" class="ui-content">
                <br/><br/><br/>
                <div id="test1"></div>
                <div id="test2"></div>
                <!-- map google -->
                <div id="map"></div>
                <script>

                    function initMap() {
                        var map = new google.maps.Map(document.getElementById('map'), {
                            zoom: 15,
                            center: {lat: 43.585140, lng: 1.304779}
                        });

                        setMarkers(map);

                        var PlanCoordinates = [
                            {lat: 43.582866, lng: 1.306572},
                            {lat: 43.586455, lng: 1.316915},
                            {lat: 43.598238, lng: 1.328816}
                        ];
                        var Path = new google.maps.Polyline({
                            path: PlanCoordinates,
                            geodesic: true,
                            strokeColor: '#FF0000',
                            strokeOpacity: 1.0,
                            strokeWeight: 2
                        });

                        Path.setMap(map);
                    }


                    function setMarkers(map) {
                        var shape = {
                            coords: [1, 1, 1, 20, 18, 20, 18, 1],
                            type: 'poly'
                        };
                        var marker = new google.maps.Marker({
                            position: {lat: 43.582866, lng: 1.306572},
                            map: map,
                            label: 'Maison de Axel',
                            icon: {
                                path: google.maps.SymbolPath.CIRCLE,
                                scale: 10,
                                fillOpacity: 1,
                                fillColor: '#000000',
                                strokeColor: '#000000'

                            },
                            shape: shape,
                        });


                        var marker3 = new google.maps.Marker({
                            position: {lat: 43.598238, lng: 1.328816},
                            map: map,
                            icon: {
                                //path: google.maps.SymbolPath.CIRCLE,
                                scale: 10,
                                fillOpacity: 1,
                                fillColor: '#0042FF',
                                strokeColor: '#0042FF'
                            },
                            shape: shape,
                        });
                    }
                </script>         
                <br/><br/><br/>
            </div>

            <%@include file="/includes/footer.jspf"%>
            <!-- panel d'infos -->
            <div id="panelInfo" data-role="panel" data-position="left"  
                 data-position-fixed="true" data-display="push">
                <ol id="listeInfo" data-role="listview" data-icon="false">
                    <li data-role="list-divider">Informations sur le véhicule</li>
                    <li id=""><a href='#'></a></li>
                    <li id=""><a href='#'></a></li>
                    <li id=""><a href='#'></a></li>
                </ol>
            </div>

            <!-- panel de véhicules -->
            <div id="panelDate" data-role="panel" data-position="right"  
                 data-position-fixed="true" data-display="push">
                <ol id="listeInfo" data-role="listview" data-icon="false">
                    <li data-role="list-divider">Dates:</li>
                    <p>Du: <input type="text" id="datepicker"></p>
                    <p>Au: <input type="text" id="datepicker1"></p>
                </ol>
            </div>
        </div>
    </body>
</html>