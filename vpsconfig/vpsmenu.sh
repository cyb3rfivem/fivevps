#!bin/bash
firstp="firstp"
ipvps="ipvps"
username="username"
keyvps="keyvps"
dspvps="displayvps"
resovps="resolucaovps"

menu ()
{
 while true do $firstp !="firstp"
 do
 clear
 echo "============================================"
 echo "= Bem Vindo ao Menu de Configuração da VPS ="
 echo "= Lista de Opções:                         ="
 echo "= 1 - Instalar interface Grafica ~ VNC     ="
 echo "= 2 - Configurar Partição Swap             ="
 echo "= 3 - Fechar Menu                          ="
 echo "============================================"
 echo "= Digite a opção desejada:                 ="
 read firstp
 echo "= Opção informada: ($fisrtp)               ="
 
 case $firstp in
 
    1)
	   echo "===================================="
	   echo "Digite o IP da sua VPS:"
	   read ipvps
	   echo "O IP Informado foi: ($ipvps)"
	   echo ""
	   echo "Digite o nome de usuario da sua VPS:"
	   read username
	   echo "O Usuario informado foi: ($username)"
	   echo ""
	   echo "Digite o nome da chave '.key' que você usa para conectar a vps."
	   echo "Exemplo: chave.key"
	   read keyvps
	   echo "A Chave informada foi: ($keyvps)"
	   echo ""
	   echo "Instalando Interface Grafica VNC"
	   sudo apt-get update -y
	   sudo apt-get upgrade -y
	   sudo apt install tightvncserver xfce4 xfce4-goodies metacity nautilus firefox nano -y
	   vncserver
	   echo "Configurando arquivo ~/.vnc/xstartup"
	   sudo mv ~/.vnc/xstartup ~/.vnc/xstartup.bkp
	   cd ~/.vnc/
	   echo -e '#!/bin/sh \nunset SESSION_MANAGER \nunset DBUS_SESSION_BUS_ADDRESS \nstartxfce4 & \n[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup \n[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources \nxsetroot -solid grey \nvncconfig -iconic & \nmetacity & \nnautilus &' > xstartup
     cd ~/
     echo "Na sua localhost abra o painel de conexão ssh e digite o seguinte:"
     echo " ./ssh -L 5902:localhost:5902 -i $keyvps $username@$ipvps"
     sleep 7
     echo "Agora informe o numero do display que você deseja abrir a VNC"
     echo "Exemplo: 2, 3, 4, 5, 6, 7..."
     echo "Sugerimos a partir do numero 2."
     echo "Digite o numero do display:"
     read dspvps
	   echo ""
	   echo "Informe a resolução que deseja abrir o display"
	   echo "Exemplo: 1024x768, 1920x1080, 800x600.."
	   echo "Digite a resolução desejada:"
	   read resovps
	   echo "Iniciando o servidor VNC no display $dspvps"
	   vncserver -geometry $resovps :$dspvps
	   echo "Tudo Pronto!!!"
	   echo "Para conectar digite num visualizador na localhost:"
	   localhost:$dspvps
	   sleep 2
	  echo "==================="
	 ;;
	 
    2)
	   tmswap="tamanhoswap"
	   echo "Criando Partição Swap!!"
	   echo "Verifique o espaço disponível no disco rígido:"
	   sudo df -h
	   sleep 5
	   echo "Digite o tamanho desejado de swap:"
 	   echo "Exemplo: 1G, 2G, 3G, 4G.. Numero:G, o G precisa ser maiusculo!"
	   read tmswap
	   echo ""
	   sudo fallocate -l $tmswap /swapfile
	   echo ""
	   echo "Verificando se a quantidade desejada foi inserida:"
	   sudo ls -lh /swapfile
	   sleep 4
	   echo "Permitindo Arquivo Swap."
	   sudo chmod 600 /swapfile
	   echo "Marcando partição swap."
	   sudo mkswap /swapfile
	   echo "Habilitando arquivo Swap."
	   sudo swapon /swapfile
	   echo "Verificando se o espaço esta disponível"
	   sudo swapon --show
	   sleep 2
	   echo "Tornando Swap permanente."
	   sudo cp /etc/fstab /etc/fstab.bak
	   sudo echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
	   echo ""
	   echo "valor atual do parâmetro swappiness:"
	   cat /proc/sys/vm/swappiness
	   sleep 1
	   echo ""
	   tmswapp="tamanhoswappiness"
	   echo "Qual valor que você quer definir para swappiness?"
	   echo "Atenção! somente de 0 a 100"
	   echo "Digite o Valor:"
	   read tmswapp
	   sudo sysctl vm.swappiness=$tmswapp
	   sudo cp /etc/sysctl.conf /etc/sysctl.conf.bak
	   sudo echo vm.swappiness=$tmswapp >> /etc/sysctl.conf
	   echo ""
	   tmcachep="tamanhocachepressure"
     cat /proc/sys/vm/vfs_cache_pressure
	   sleep 2
	   echo "Qual valor você quer definir para Cache Pressure?"
	   echo "Atenção! somente de 0 a 100"
	   echo "Digite o Valor"
	   read tmcachep
	   sudo sysctl vm.vfs_cache_pressure=$tmcachep
	   sudo echo vm.vm/vfs_cache_pressure=$tmcachep >> /etc/sysctl.conf
	   echo "Swap e suas configurações foram todas atualizadas!"
	   echo "Reinicie a maquina para validar as informações!"
	  echo "==================="
	  ;;
	  3)
      echo " Saindo...  "
      sleep 0
      clear;
      exit;
     echo "=============="
     ;;
*)
 echo " Opção inválida! "
 esac
 done
}
menu
