
<!DOCTYPE html>
<html>
    <head>
        <title>Localisation</title> 
        <%@ include file="/includes/header.jspf" %>
        <%-- appelle la function JS initialize --%>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAteLjItiBvWdZJNOm97mU-jWaqtJ857Fc&callback=initMap"></script>
        <script>
            $(function () {
                $("#datepicker").datepicker();
            });
        </script>
    </head>
    <body>
        <div data-role="page" id="page1">
            <div class="header" data-role="header" data-id="main-header" data-tap-toggle="false" 
                 data-theme="a" data-position="fixed" data-fullscreen="true">
                <h1>
                    <img id="logoHeader" src="images/alcisLogo.png"/>
                    Localisation  
                    <form id="btnDeconnectionLocalisation" method="post" action="index.jsp">
                        <input name="action" id="logout" type="hidden" value="logout"/>
                        <button type="submit" id="submitOK" name="submitOK">
                            <img id="white" src="css/themes/images/icons-png/power-white.png" >
                            <img id="black" src="css/themes/images/icons-png/power-black.png" >
                        </button>
                    </form>
                </h1>
                <a href="#panelDate" 
                   class="ui-btn ui-btn-icon-notext ui-corner-all ui-icon-location ui-btn-right">
                </a>
            </div>
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
                        var contentString0 = '<div id="content">' +
                                '<div id="siteNotice">' +
                                '</div>' +
                                '<h1 id="firstHeading" class="firstHeading">Véhicule 1</h1>' +
                                '<div id="bodyContent">' +
                                '<p><b>Immatriculation</b></p>' +
                                '</div>' +
                                '</div>';
                        var infowindow0 = new google.maps.InfoWindow({
                            content: contentString0
                        });
                        var contentString1 = '<div id="content">' +
                                '<div id="siteNotice">' +
                                '</div>' +
                                '<h1 id="firstHeading" class="firstHeading">Véhicule 2</h1>' +
                                '<div id="bodyContent">' +
                                '<p><b>Immatriculation</b></p>' +
                                '</div>' +
                                '</div>';
                        var infowindow1 = new google.maps.InfoWindow({
                            content: contentString1
                        });
                        var shape = {
                            coords: [1, 1, 1, 20, 18, 20, 18, 1],
                            type: 'poly'
                        };
                        var marker0 = new google.maps.Marker({
                            position: {lat: 43.582866, lng: 1.306572},
                            map: map,
                            label: '1',
                            icon: {
                                path: google.maps.SymbolPath.CIRCLE,
                                scale: 10,
                                fillOpacity: 1,
                                fillColor: '#000000',
                                strokeColor: '#000000'
                            },
                            shape: shape,
                        });
                        marker0.addListener('mouseover', function () {
                            infowindow0.open(map, marker0)
                        });
                        marker0.addListener('mouseout', function () {
                            infowindow0.close(map, marker0)
                        });
                        marker0.addListener('click', function () {
                            infowindow0.open(map, marker0)
                        });
                        var marker1 = new google.maps.Marker({
                            position: {lat: 43.598238, lng: 1.328816},
                            map: map,
                            label: '2',
                            icon: {
                                path: google.maps.SymbolPath.CIRCLE,
                                scale: 10,
                                fillOpacity: 1,
                                fillColor: '#0042FF',
                                strokeColor: '#0042FF'
                            },
                            shape: shape,
                        });
                        marker1.addListener('mouseover', function () {
                            infowindow1.open(map, marker1)
                        });
                        marker1.addListener('mouseout', function () {
                            infowindow1.close(map, marker1)
                        });
                        marker1.addListener('click', function () {
                            infowindow1.open(map, marker1)
                        });
                    }
                </script>   
                <br/><br/><br/>
            </div>        
            <%@include file="/includes/footer.jspf"%>
            <!-- panel de véhicules -->
            <div id="panelDate" data-role="panel" data-position="right"  
                 data-position-fixed="true" data-display="push">
                <ol id="liste>Histo" data-role="listview" data-icon="false">
                    <li data-role="list-divider">Informations sur le véhicule</li>
                    <li id=""><a href='#'></a></li>
                    <li id=""><a href='#'></a></li>
                    <li id=""><a href='#'></a></li>
                    <li id=""><a href='#'></a></li>
                </ol>
            </div>
    </body>
</html>