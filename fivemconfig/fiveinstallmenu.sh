#!bin/bash
firstop="firstoption"

menu ()
{
 while true do $firstop !="firstoption"
 do
 clear

 echo "===================================="
 echo "= 1 - Instalar artefatos do Five M ="
 echo "= 2 - Instalar o XAMPP 8.0.3       ="
 echo "= 3 - Baixar Sv-Data Original      ="
 echo "= 4 - Sair do Menu                 ="
 echo "===================================="
 
 case $firstop in
 
     1)
	  #Criando Pasta na Home
	  username="username"
	  echo "Digite o nome de usuario onde deseja baixar os artefatos:"
	  read $username
	  echo "Criando pastar no diretório home do usuario: ($username)"
	  mkdir -p /home/$username/FXServer/
	  mkdir -p /home/$username/FXServer/server
	  echo ""
	  
	  ##Baixando Artefatos
	  linkart="linkartefato"
	  echo "Acesse o link a seguir, copie o link referente a versão desejada e cole a seguir:"
	  echo "https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/"
	  echo "Cole Aqui:"
	  read linkart
	  echo "Acessando pasta criada e baixando artefatos..."
	  cd /home/$username/FXServer/server
	  wget $linkart
	  echo "Checando se você possui o descompactador...."
	  sleep 2
	  sudo apt-get update
	  sudo apt-get install xz-utils
    tar xf fx.tar.xz
	  sleep 1
	  rm -r fx.tar.xz
	  ##Executando o Artefato para Configuração do servidor
	  bash /home/$username/FXServer/server/run.sh
	  sleep 1
	 echo "=========================="
	 ;;
	 
	 2)
	  ##Instalando XAMPP
	  echo " Baixando e Configurando Cliente MySql: XAMPP"
	  echo ""
	  cd ~/
	  echo "Usaremos a versão 8.0.3 Caso precise atualize manualmente."
	  wget https://www.apachefriends.org/xampp-files/8.0.3/xampp-linux-x64-8.0.3-0-installer.run
	  chmod +x xampp-linux-x64-8.0.3-0-installer.run
	  ./xampp-linux-x64-8.0.3-0-installer.run
	  sleep 2
	  rm -r xampp-linux-x64-8.0.3-0-installer.run
	  /opt/lampp/xampp startmysql
	  sleep 2
	 echo "=========================="
	 ;;
	 
	 3)
	  ##Baixando Server Data
	  git clone https://github.com/citizenfx/cfx-server-data.git /home/$username/FXServer/server/server-data-original
	  cd /home/$username/FXServer/server/server-data-original
	  echo bash /home/$username/FXServer/server/run.sh +exec server.cfg > start.sh
	  echo "Iniciando o Script de Criação da CFG!!!"
	  sleep 2
	  
	  #Script da CFG
	  #!bin/sh
	  ps="portaservidor"
	  nomesv="serverhostname"
	  shk="scripthook"
	  src="senharcon"
	  tgs="tagserver"
	  idsv="idiomasv"
	  pjn="projectname"
	  dcsv="descsv"
	  onesync="onesync"
	  slots="slots"
	  steamkey="steamkey"
	  licensekey"licensekey"

	  echo " Bem Vindo ao Script de Criação da CFG"
	  echo "Desenvolvido por: Cybernetic_Spectre"

	  echo ""
	  echo ""
	  echo "Digite a porta que você ira usar no servidor:"
	  read ps
	  echo '#Porta Do Servidor.' > server.cfg
	  echo endpoint_add_tcp " 0.0.0.0:$ps " >> server.cfg
	  echo endpoint_add_udp " 0.0.0.0:$ps " >> server.cfg
	  echo '' >> server.cfg

	  echo ""
	  echo ""
	  echo "Habilitar ScriptHook no Servidor?"
	  echo " 0 - Para não"
	  echo " 1 - Para sim"
	  read shk
	  echo '#ScriptHook.' >> server.cfg
	  echo sv_scriptHookAllowed $shk >> server.cfg
	  echo '' >> server.cfg

	  echo ""
	  echo ""
	  echo "Digite a senha do rcon, você pode alterar depois:"
	  read src
	  echo '#Senha do Super Admin Rcon' >> server.cfg
	  echo rcon_password " $src " >> server.cfg
	  echo '' >> server.cfg

	  echo ""
	  echo ""
	  echo "Tags do servidor;"
	  echo "Digite separadas apenas por espaço, Exemplos:"
	  echo " default roleplay base whitelist etc etc"
	  read tgs
	  echo '#Tags do Servidor' >> server.cfg
	  echo sets tags " $tgs " >> server.cfg
	  echo '' >> server.cfg

	  echo ""
	  echo ""
	  echo "Digite o Idioma do Servidor:"
	  echo "Exemplos: "en-US", "fr-CA", "nl-NL", "de-DE", "en-GB", "pt-BR""
	  read idsv
	  echo '#Idioma do Servidor' >> server.cfg
	  echo '#Exemplos: "en-US", "fr-CA", "nl-NL", "de-DE", "en-GB", "pt-BR"' >> server.cfg
	  echo sets locale " $idsv " >> server.cfg
	  echo '' >> server.cfg

	  echo ""
	  echo ""
	  echo Banner do Servidor >> server.cfg
	  echo #sets banner_detail "https://url.to/image.png" >> server.cfg
	  echo #sets banner_connecting "https://url.to/image.png" >> server.cfg
	  echo '' >> server.cfg

	  echo ""
	  echo ""
	  echo "Digite o nome do projeto do servidor:"
	  read pjn
	  echo '#Nome do Projeto do Servidor' >> server.cfg
	  echo sets sv_projectName " $pjn " >> server.cfg
	  echo '' >> server.cfg

	  echo ""
	  echo ""
	  echo "Digite a descrição do seu servidor:"
	  read dcsv
	  echo '#Descrição do servidor' >> server.cfg
	  echo sets sv_projectDesc " $dcsv " >> server.cfg
	  echo '' >> server.cfg

	  echo ""
	  echo ""
	  echo '# Nested configs!' >> server.cfg
	  echo '#exec server_internal.cfg' >> server.cfg
	  echo '' >> server.cfg

	  echo ""
	  echo ""
	  echo '#Loading a server icon 96x96 PNG file' >> server.cfg
	  echo 'load_server_icon myLogo.png' >> server.cfg
	  echo '' >> server.cfg

	  echo ""
	  echo ""
	  echo '# convars which can be used in scripts' >> server.cfg
	  echo set temp_convar "hey world!" >> server.cfg
	  echo '' >> server.cfg

	  echo ""
	  echo ""
	  echo '#Listar na master list' >> server.cfg
	  echo #sv_master1 "" >> server.cfg
	  echo '' >> server.cfg

	  echo ""
	  echo ""
	  echo #Add system admins >> server.cfg
	  echo add_ace group.admin command allow >> server.cfg
	  echo add_ace group.admin command.quit deny >> server.cfg
	  echo add_principal identifier.fivem:1 group.admin >> server.cfg
	  echo '' >> server.cfg

	  echo ""
	  echo ""
	  echo "Você quer o onesync on ou off?"
	  echo " on - ligado"
	  echo " off - desligado"
	  read onesync
	  echo '#OneSync On/Off' >> server.cfg
	  echo set onesync $onesync >> server.cfg
	  echo '' >> server.cfg

	  echo ""
	  echo ""
	  echo "Digite a quantidade maxima de Slots do servidor:"
	  read slots
	  echo '#Server player slot limit see https://fivem.net/server-hosting for limits' >> server.cfg
	  echo '#Quantidade Maxima de Slots' >> server.cfg
	  echo sv_maxclients $slots >> server.cfg
	  echo '' >> server.cfg

	  echo ""
	  echo ""
	  echo "Digite o nome do servidor:"
	  read nomesv
	  echo '#Nome do Servidor' >> server.cfg
	  echo sv_hostname " $nomesv " >> server.cfg
	  echo '' >> server.cfg

	  echo ""
	  echo ""
	  echo "Digite sua Steam Api Key"
	  read steamkey
	  echo '#Steam Api Key' >> server.cfg
	  echo set steam_webApiKey $steamkey >> server.cfg
	  echo '' >> server.cfg

	  echo ""
	  echo ""
	  echo "Digite a license Key do seu servidor:"
	  read licensekey
	  echo '#Server LicenseKey' >> server.cfg
	  echo sv_licenseKey $licensekey >> server.cfg

	  echo ""
	  echo ""
	  echo "Os Resources padrão estão sendo inseridos"
	  echo "Caso queira Modificar-los edite manualmente"
	  echo "O Arquivo: server.cfg"
	  echo '' >> server.cfg

	  echo '#######################################' >> server.cfg
	  echo '#Estes Recursos Iniciam como padrão:' >> server.cfg
	  echo 'ensure mapmanager' >> server.cfg
	  echo 'ensure chat' >> server.cfg
	  echo 'ensure spawnmanager' >> server.cfg
	  echo 'ensure sessionmanager' >> server.cfg
	  echo 'ensure basic-gamemode' >> server.cfg
	  echo 'ensure hardcap' >> server.cfg
	  echo 'ensure rconlog' >> server.cfg
	  echo '#######################################' >> server.cfg
	  sleep 1
	  clear;
    echo "========"
	 ;;
	 5)
      ##Saida do Menu
	    echo " Saindo...  "
      sleep 1
      clear;
      exit;
     echo "======="
     ;;
 *)
  ##Opção Inválida!
  echo " Opção inválida! "
  esac
  done

}
 menu
