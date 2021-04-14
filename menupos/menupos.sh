#!bin/bash
firstop="firstoption"

menu ()
{
 while true do $firstop !="firstoption"
 do
 clear

 echo "======================================"
 echo "= 1 - Iniciar Controle XAMPP         ="
 echo "= 2 - Iniciar Servidor Padrão        ="
 echo "= 3 - Inserir Resource na CFG        ="
 echo "= 4 - Sair do Menu                   ="
 echo "======================================"
 echo "Digite a opção desejada:"
 read firstop
 echo "Opção selecionada: ($firstop)"
 
 case $firstop in
 
     1)
	  ##Iniciando XAMPP
	  echo "Olá, Estamos iniciando o controle do xampp"
	  sudo bash xmpcontrol/xmpc.sh
	  sleep 1
	 echo "======="
	 ;;
	 
	 2)
	  ##Iniciando Servidor
	  username="nomedouser"
	  echo "Nome do Usuario onde se encontra o server?"
	  read username
	  bash /home/$username/FXServer/server/run.sh +exec server.cfg
	  exit;
	 echo "======="
	 ;;
	 
	 3)
	  ##Inserir Resource
	  cfglocate="localcfg"
	  echo "Informe o caminho onde esta a cfg que você quer inserir!"
	  echo "Exemplo: /home/ubuntu/FXServer/server/server-data/config "
	  echo "ATENÇÃO! Não coloque / no final da ultima pasta         ^"
	  echo "Criaremos um script onde você poderá executar no lugar deste menu!"
	  echo "o Script ficara salvo na mesma pasta da CFG para facilitar a edição!"
	  echo "Digite o caminho da cfg:"
	  read cfglocate
	  ##CriandoScriptResourceNaCFG
      echo '#!bin/bash' > $cfglocate/rsedit.sh
      echo resourcename="nomeresource" >> $cfglocate/rsedit.sh
      echo cfgname="cfgname" >> $cfglocate/rsedit.sh
      echo '' >> $cfglocate/rsedit.sh
      echo 'echo "Digite o nome do CFG que deseja inserir a resource:"' >> $cfglocate/rsedit.sh
      echo 'echo "Exemplo: resources.cfg"' >> $cfglocate/rsedit.sh
      echo read cfgname >> $cfglocate/rsedit.sh
      echo '' >> $cfglocate/rsedit.sh
      echo 'menu ()' >> $cfglocate/rsedit.sh
      echo { >> $cfglocate/rsedit.sh
      echo while true do $firstop !="firstoption" >> $cfglocate/rsedit.sh
      echo do >> $cfglocate/rsedit.sh
      echo clear >> $cfglocate/rsedit.sh
      echo '' >> $cfglocate/rsedit.sh
      echo 'echo "Digite apenas o nome da resource que deseja inserir:"' >> $cfglocate/rsedit.sh
      echo 'echo "Exemplo: carros"' >> $cfglocate/rsedit.sh
      echo read resourcename >> $cfglocate/rsedit.sh
      echo '' >> $cfglocate/rsedit.sh
      echo 'echo ensure $resourcename >> $cfgname' >> $cfglocate/rsedit.sh
      echo '' >> $cfglocate/rsedit.sh
      echo done >> $cfglocate/rsedit.sh
      echo '' >> $cfglocate/rsedit.sh
      echo } >> $cfglocate/rsedit.sh
      echo menu >> $cfglocate/rsedit.sh
	  echo "Script Criado com sucesso!!"
	  sh $cfglocate/rsedit.sh
	  exit;
	 echo "======="
	 ;;
	 
	 4)
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
