#!bin/bash
firstop="firstoption"

menu ()
{
 while true do $firstop !="firstoption"
 do
 clear

 echo "===================================================================="
 echo "=                      Controle Geral do XAMPP                     ="
 echo "=                                                                  ="
 echo "=            Iniciar              |   Outros Comandos              =" 
 echo "= 1 - Iniciar Todos os Modulos    |    13 - Restart XAMPP          ="
 echo "= 2 - Iniciar MySQL               |    14 - Checar Segurança       ="
 echo "= 3 - Iniciar Apache              |    15 - Habilitar ssl          ="
 echo "= 4 - Inserir Ftp                 |    16 - Desabilitar ssl        ="
 echo "=                                 |    17 - Backup da Config       ="
 echo "=            Reiniciar            |    18 - Habilitar oci8 Ext     ="
 echo "= 5 - Reiniciar Todos os Modulos  |    19 - Iniciar Painel Grafico ="
 echo "= 6 - Reiniciar MySQL             |                                ="
 echo "= 7 - Reiniciar Apache            |                                ="
 echo "= 8 - Reiniciar Ftp               |                                ="
 echo "=                                 |  ###########################   ="
 echo "=             Parar               |  #                         #   ="
 echo "= 9 - Parar Todos os Modulos      |  # #  # ### ##   ## ####   #   ="
 echo "= 10 - Parar MySQL                |  #  ##  # # # # # # ####   #   ="
 echo "= 11 - Parar Apache               |  #  ##  ### # # # # #      #   ="
 echo "= 12 - Parar Ftp                  |  # #  # # # #  #  # #      #   ="
 echo "=                                 |  #                         #   ="
 echo "= 20 - Sair do Menu               |  ###########################   ="
 echo "===================================================================="
 echo "= Digite a opção desejada:                                         ="
 read firstop
 echo "= Opção informada: ($firstop)                                      ="
 
 case $firstop in
 
     1)
      sudo bash /opt/lampp/xampp start
	  sleep 1
	 echo "======="
	 ;;
	 
	 2)
	  sudo bash /opt/lampp/xampp startmysql
	  sleep 1
	 echo "======="
	 ;;
	 
	 3)
	  sudo bash /opt/lampp/xampp startapache
	  sleep 1
	 echo "======="
	 ;;
	 
	 4)
	  sudo bash /opt/lampp/xampp startftp
	  sleep 1
	 echo "======="
	 ;;
	 
     5)
      sudo bash /opt/lampp/xampp reload
	  sleep 1
	 echo "======="
	 ;;
	 
	 6)
	  sudo bash /opt/lampp/xampp reloadmysql
	  sleep 1
	 echo "======="
	 ;;
	 
	 7)
	  sudo bash /opt/lampp/xampp reloadapache
	  sleep 1
	 echo "======="
	 ;;
	 
	 8)
	  sudo bash /opt/lampp/xampp reloadtftp
	  sleep 1
	 echo "======="
	 ;;
	 
     9)
      sudo bash /opt/lampp/xampp stop
	  sleep 1
	 echo "======="
	 ;;
	 
	 10)
	  sudo bash /opt/lampp/xampp stopmysql
	  sleep 1
	 echo "======="
	 ;;
	 
	 11)
	  sudo bash /opt/lampp/xampp stopapache
	  sleep 1
	 echo "======="
	 ;;
	 
	 12)
	  sudo bash /opt/lampp/xampp stopftp
	  sleep 1
	 echo "======="
	 ;;
	 
     13)
      sudo bash /opt/lampp/xampp restart
	  sleep 1
	 echo "======="
	 ;;
	 
	 14)
	  sudo bash /opt/lampp/xampp security
	  sleep 1
	 echo "======="
	 ;;
	 
	 15)
	  sudo bash /opt/lampp/xampp enablessl
	  sleep 1
	 echo "======="
	 ;;
	 
	 16)
	  sudo bash /opt/lampp/xampp disablessl
	  sleep 1
	 echo "======="
	 ;;	 
	 
	 17)
	  sudo bash /opt/lampp/xampp backup
	  sleep 1
	 echo "======="
	 ;;
	 
	 18)
	  sudo bash /opt/lampp/xampp oci8
	  sleep 1
	 echo "======="
	 ;;
	 	 
	 19)
	  sudo bash /opt/lampp/xampp panel
	  sleep 1
	 echo "======="
	 ;;
	 
	 20)
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
