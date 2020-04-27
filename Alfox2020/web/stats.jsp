<html>
    <head>
        <title>Statistiques</title> 
        <%@ include file="/includes/header.jspf" %>

    </head>
    <body>
        <div data-role="page" id="page1">
            <div class="header" data-role="header" data-id="main-header" data-tap-toggle="false" 
                 data-theme="a" data-position="fixed" data-fullscreen="true">
                <h1>
                    <img id="logoHeader" src="images/alcisLogo.png"/>
                    Statistiques  

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
                    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
                    <script type="text/javascript">
                        google.charts.load('current', {packages: ['corechart']});
                        google.charts.setOnLoadCallback(drawChart1);
                        google.charts.setOnLoadCallback(drawChart2);
                        google.charts.setOnLoadCallback(drawChart3);
                        google.charts.setOnLoadCallback(drawChart4);
                        google.charts.setOnLoadCallback(drawChart5);

                        function drawChart1() {
                            var data = new google.visualization.DataTable();
                            data.addColumn('string', 'Element');
                            data.addColumn('number', 'Km');
                            data.addRows([
                                ['01', 66],
                                ['02', 72],
                                ['03', 35],
                                ['04', 48],
                                ['05', 54],
                                ['06', 48]
                            ]);
                            // Instantiate and draw the chart.
                            var chart = new google.visualization.ColumnChart(document.getElementById('stat1'));
                            var options = {
                                width: 300,
                                height: 300,
                                legend: 'none',
                                colors: ['#E8972C'],
                                backgroundColor: '#EEEEEE'
                            };
                            chart.draw(data, options);
                        }
                        function drawChart2() {
                            var data = new google.visualization.DataTable();
                            data.addColumn('string', 'Element');
                            data.addColumn('number', 'Conso');
                            data.addRows([
                                ['01', 1200],
                                ['02', 1300],
                                ['03', 700],
                                ['04', 950],
                                ['05', 2000],
                                ['06', 1335]
                            ]);
                            // Instantiate and draw the chart.
                            var chart = new google.visualization.ColumnChart(document.getElementById('stat2'));
                            var options = {
                                width: 300,
                                height: 300,
                                legend: 'none',
                                colors: ['#E8972C'],
                                backgroundColor: '#EEEEEE'
                            };
                            chart.draw(data, options);
                        }
                        function drawChart3() {
                            var data = new google.visualization.DataTable();
                            data.addColumn('string', 'Element');
                            data.addColumn('number', 'VitM');
                            data.addRows([
                                ['01', 5.6],
                                ['02', 5.9],
                                ['03', 6.7],
                                ['04', 6.2],
                                ['05', 5.9],
                                ['06', 6.1]
                            ]);
                            // Instantiate and draw the chart.
                            var chart = new google.visualization.ColumnChart(document.getElementById('stat3'));
                            var options = {
                                width: 300,
                                height: 300,
                                legend: 'none',
                                colors: ['#E8972C'],
                                backgroundColor: '#EEEEEE'
                            };
                            chart.draw(data, options);
                        }
                        function drawChart4() {
                            var data = new google.visualization.DataTable();
                            data.addColumn('string', 'Element');
                            data.addColumn('number', 'VitMoy');
                            data.addRows([
                                ['01', 5.6],
                                ['02', 5.9],
                                ['03', 6.7],
                                ['04', 6.2],
                                ['05', 5.9],
                                ['06', 6.1]
                            ]);
                            // Instantiate and draw the chart.
                            var chart = new google.visualization.ColumnChart(document.getElementById('stat4'));
                            var options = {
                                width: 300,
                                height: 300,
                                legend: 'none',
                                colors: ['#E8972C'],
                                backgroundColor: '#EEEEEE'
                            };
                            chart.draw(data, options);
                        }


                        function drawChart5() {
                            var data = google.visualization.arrayToDataTable([
                                ['Year', 'Sales'],
                                ['2004', 1000],
                                ['2005', 1170],
                                ['2006', 660],
                                ['2007', 1030]
                            ]);

                            var options = {
                                width: 300,
                                height: 300,
                                legend: 'none',
                                colors: ['#E8972C'],
                                backgroundColor: '#EEEEEE',
                                curveType: 'function',
                            };

                            var chart = new google.visualization.LineChart(document.getElementById('stat5'));

                            chart.draw(data, options);
                        }


                    </script>
                    <br><br>
                    <div data-role='navbar' data-grid='b'>
                        <ul>
                            <li><a href='accueil.jsp' data-ajax='false' id='navbarHome1' data-icon='info'>Infos</a></li>
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
                    <br/><br/><br/>
                    <div class="grid">
                        <div class="card">
                            <div class="graphTitre">Kilomètrage</div>
                            <div id="stat1"></div>
                        </div>
                        <div class="graph">
                            <div class="graphTitre">Consommation Moyenne</div>
                            <div id="stat2"></div>
                        </div>
                        <div class="graph">
                            <div class="graphTitre">Vitesse Maximale</div>
                            <div id="stat3"></div>
                        </div>
                        <div class="graph">
                            <div class="graphTitre">Vitesse Moyenne</div>
                            <div id="stat4"></div>
                        </div>
                        <div class="graph">
                            <div class="graphTitre">Consommation annuelle</div>
                            <div id="stat5"></div>
                        </div>
                    </div>              
                    <br>
                    <br>
                </center>
            </div>
            <%@include file="/includes/footer.jspf"%>
        </div>
    </body>
</html>