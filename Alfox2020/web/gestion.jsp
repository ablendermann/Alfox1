
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


            <table data-role="table" id="table-custom-2" data-mode="columntoggle" class="ui-body-d ui-shadow table-stripe ui-responsive" data-column-btn-theme="b" data-column-btn-text="Columns to display..." data-column-popup-theme="a">
                <thead>
                    <tr class="ui-bar-d">
                         <th data-priority="2">Informations detaillées du vehicule choisi</th>
                         <th>Valeurs</th>

                         </tr>
                </thead>
                <tbody>
                     <tr>
                         <th>1</th>
                        <td><a href="http://en.wikipedia.org/wiki/Citizen_Kane" data-rel="external">Citizen Kane</a></td>
                         
                         </tr>
                     <tr>
                         <th>2</th>
                         <td><a href="http://en.wikipedia.org/wiki/Casablanca_(film)" data-rel="external">Casablanca</a></td>
                         
                         </tr>
                     <tr>
                         <th>3</th>
                         <td><a href="http://en.wikipedia.org/wiki/The_Godfather" data-rel="external">The Godfather</a></td>

                         </tr>
                     <tr>
                         <th>4</th>
                        <td><a href="http://en.wikipedia.org/wiki/Gone_with_the_Wind_(film)" data-rel="external">Gone with the Wind</a></td>

                         </tr>
                     <tr>
                         <th>5</th>
                        <td><a href="http://en.wikipedia.org/wiki/Lawrence_of_Arabia_(film)" data-rel="external">Lawrence of Arabia</a></td>
                         
                         </tr>
                     <tr>
                         <th>6</th>
                         <td><a href="http://en.wikipedia.org/wiki/Dr._Strangelove" data-rel="external">Bomb</a></td>

                         </tr>
                     <tr>
                         <th>7</th>
                         <td><a href="http://en.wikipedia.org/wiki/The_Graduate" data-rel="external">The Graduate</a></td>

                         </tr>
                     <tr>
                         <th>8</th>
                         <td><a href="http://en.wikipedia.org/wiki/The_Wizard_of_Oz_(1939_film)" data-rel="external">The Wizard of Oz</a></td>

                    </tr>
                     <tr>
                         <th>9</th>
                         <td><a href="http://en.wikipedia.org/wiki/Singin%27_in_the_Rain" data-rel="external">Singin' in the Rain</a></td>
                         
                         </tr>
                     <tr>
                         <th>10</th>
                         <td class="title"><a href="http://en.wikipedia.org/wiki/Inception" data-rel="external">Inception</a></td>
                         
                         </tr>
                     </tbody>
                 </table>
                <%@include file="/includes/footer.jspf"%>
        </div>
    </body>
</html>