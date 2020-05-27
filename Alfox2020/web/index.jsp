<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Accueil</title> 
        <%@ include file="/includes/header.jspf" %>
    </head>
    <body>
        <div data-role="page" id="page1">
            <div class="header" data-role="header" data-id="main-header" data-tap-toggle="false" 
                 data-theme="a" data-position="fixed" data-fullscreen="true">
                <h1><img id="logoHeader" src="images/alcisLogo.png"/>Accueil</h1>
            </div>
            <div role="main" class="ui-content">
                <center>
                    <br/><br/><br/>
                    <h2>Suivi et maintenance d'une flotte de véhicules V3.1</h2>
                    <br/><br/>
                    <div class="logo"><img src="images/logo.png"/></div>  
                    <br/>
                    <div>
                    </div>
                    <br/><br/><br/>
                    <form id="formLogin" class="form" method="post" action="accueil.jsp">
                        <div data-role="fieldcontain">
                            <label for="mdp">Mot de passe:</label>
                            <input type="password" name="mdp" id="mdp"/>
                        </div>
                        <input name="action" id="login" type="hidden" value="login_req"/><br/>
                        <button type="submit" id="submitOK" name="submitOK">OK</button>
                    </form>
                    <p class="mini">V3.1 - Mars 2020<br/>Développement : BTS SNIR Lycée V.Hugo Colomiers</p>
                </center>
            </div>
        </div>
    </body>
</html>
