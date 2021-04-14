#!bin/bash
resourcename="nomeresource"
cfgname="cfgname"

echo "Digite o nome do CFG que deseja inserir a resource:"
echo "Exemplo: resources.cfg"
read cfgname

menu ()
{
while true do $firstop !="firstoption"
do
clear

echo "Digite apenas o nome da resource que deseja inserir:"
echo "Exemplo: carros"
read resourcename

echo ensure $resourcename >> $cfgname

done

}
menu
