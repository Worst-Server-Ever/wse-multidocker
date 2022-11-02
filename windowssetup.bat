@ECHO OFF
mkdir data
echo Hello there, this script is intented to help you setup your computer ot contribute to the multipaper worstserverever node, allowing us to keep the server alive!
echo if you've run this script before and haven't replaced any files you can spam enter without missing anything
pause
echo Ok lets start things off, what would you like this server to be named (please use a name that is orriginal and easily identifiable to avoid causing issues)
set /p node-name=name:
echo perfect, now do you have docker and tailscale installed?
set /p dockerinstall=y/n: 
if %dockerinstall%==n echo the script cannot contine without docker and tailscale installed, please install docker at https://www.docker.com/
if %dockerinstall%==n pause
if %dockerinstall%==n exit
echo if you have just installed tailscale do the following, when it prompts you to log in, and press log in with qr code, then send that qr code in a support ticket on discord alternatively if you already use tailscale you can generate a share link and send it to insert
echo Great, now the servers settings will be configured
set /p ramuse=ram to use in GB:
set /p vd=Viewdistance (max 16):
fart.exe docker-compose.yml cmdargram %ramuse%G -q
fart.exe docker-compose.yml cmdargvd %vd% -q
fart.exe docker-compose.yml cmdargnodename %node-name% -q
rd /s /q data
powershell -Command "Invoke-WebRequest https://nextcloud.insert.tk/s/cCZzbwXb5amrecS/download -OutFile serverfiles.zip"
powershell -Command "Expand-Archive serverfiles.zip -DestinationPath data"
del serverfiles.zip
echo you will now be connected to the master server, open a support ticket on discord to add your machine to the server list
pause
docker-compose pull
docker-compose up
