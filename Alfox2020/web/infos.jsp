
<!DOCTYPE html>
<html>
    <head>
        <title>Informations</title> 
        <%@ include file="/includes/header.jspf" %>
    </head>
    <body>

        <div data-role="page" id="page1">
            <div class="header" data-role="header" data-id="main-header" data-tap-toggle="false" 
                 data-theme="a" data-position="fixed" data-fullscreen="true">
                <h1>
                    <img id="logoHeader" src="images/alcisLogo.png" alt="alcisLogo"/>
                    Informations

                    <form id="btnDeconnection" method="post" action="index.jsp">
                        <input name="action" id="logout" type="hidden" value="logout"/>
                        <button type="submit" id="submitOK" name="submitOK">
                            <img id="white" src="css/themes/images/icons-png/power-white.png" alt="power-withe">
                            <img id="black" src="css/themes/images/icons-png/power-black.png" alt="power-black">
                        </button>
                    </form>

                </h1>


            </div>

            <br><br>
            <div data-role='navbar' data-grid='b'>
                <ul>
                    <li><a href='infos.jsp' data-ajax='false' id='navbarHome1' data-icon='info'>Infos</a></li>
                    <li><a href='stats.jsp' data-ajax='false' id='navbarLoc' data-icon='grid'>Stats</a></li>
                    <li><a href='hitorique.jsp' data-ajax='false' id='navbarInfos1' data-icon='clock'>Historique</a></li>

                </ul>
            </div>


            <form class="form" >
                <div class="ui-field-contain">
                    <label class="label" for="select-native-1">Véhicule :</label>
                    <select name="select-native-1" id="select-native-1">
                        <option value="#">ZD-555-ED</option>
                        <option value="#">GG-999-ER</option>
                        <option value="#">HH-444-ER</option>
                    </select>
                </div>
            </form>
            <form class="form">

                <p>Veuillez choisir la date:</p><input type="date" name="date-infos" min="2018-01-01" style="width:180px;" >

            </form>
            <%@include file="/includes/footer.jspf"%>
        </div>
    </body>
</html>