@ECHO OFF
echo Hello there, this script is intented to help you setup your computer ot contribute to the multipaper worstserverever node, allowing us to keep the server alive!
pause
echo Ok lets start things off, what would you like this server to be named (please use a name that is orriginal and easily identifiable to avoid causing issues)
set /p node-name=name:
echo perfect, now do you have docker installed?
set /p dockerinstall=y/n: 
if %dockerinstall%==n echo the script cannot contine without docker installed, please install docker at https://www.docker.com/
if %dockerinstall%==n pause
if %dockerinstall%==n exit
echo Great, now the servers settings will be configured
set /p ramuse=ram to use in GB:
set /p vd=Viewdistance (max 16):
fart.exe docker-compose.yml cmdargram %ramuse%G -q
fart.exe docker-compose.yml cmdargvd %vd% -q
fart.exe docker-compose.yml cmdargnodename %node-name% -q
powershell -Command "Invoke-WebRequest https://nextcloud.insert.tk/s/cCZzbwXb5amrecS/download -OutFile serverfiles.zip
powershell Expand-Archive serverfiles.zip -DestinationPath data"
echo you will now be connected to the master server, open a support ticket on discord to add your machine to the server list
pause
docker-compose pull
docker-compose up
