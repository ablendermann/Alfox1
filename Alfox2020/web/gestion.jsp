
<!DOCTYPE html>
<html>
    <head>
        <title>Gestion</title> 
        <%@ include file="/includes/header.jspf" %>
    </head>
    <body>
        <div data-role="page" id="page1">
            <div class="header" data-role="header" data-id="main-header" data-tap-toggle="false" 
                 data-theme="a" data-position="fixed" data-fullscreen="true">
                <h1>
                    <img id="logoHeader" src="images/alcisLogo.png"/>
                    Gestion  

                    <form id="btnDeconnection" method="post" action="index.jsp">
                        <input name="action" id="logout" type="hidden" value="logout"/>
                        <button type="submit" id="submitOK" name="submitOK">
                            <img id="white" src="css/themes/images/icons-png/power-white.png" >
                            <img id="black" src="css/themes/images/icons-png/power-black.png" >
                        </button>
                    </form>
                </h1>
            </div>
            <br><br>
            <div>
                Veuillez choisir un véhicule:
                <fieldset data-role="controlgroup" data-type="horizontal">

                     <label for="select-custom-11">Select A</label>
                     <select name="select-custom-11" id="select-custom-11" data-native-menu="false">
                         <option value="#">ZD-555-ED</option>
                         <option value="#">GG-999-ER</option>
                         <option value="#">HH-444-ER</option>
                         </select>
                </fieldset>
            </div>
                CDC A DEFINIR PLUS TARD!
                <%@include file="/includes/footer.jspf"%>
        </div>
    </body>
</html>