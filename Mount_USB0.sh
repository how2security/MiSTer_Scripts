#!/bin/bash

### CORES
amarelo="\e[33;1m"
azul="\e[34;1m"
verde="\e[32;1m"
vermelho="\e[31;1m"
fim="\e[m"

banner()
{
echo -e "$azul##############################################################$fim"
echo -e "$azul# By PandoraFighter - MiSTer FPGA                            #$fim"
echo -e "$azul#                                                            #$fim"
echo -e "$azul# MOUNT USB0   Version 1.0 - How2Sec Lab                     #$fim"
echo -e "$azul#                                                            #$fim"
echo -e "$azul# Created: 27/09/2021  Updated: 27/09/2021                   #$fim"
echo -e "$azul##############################################################$fim"

echo -e "\n"
}
banner

## Validando se eh o usuario root
if [ $(id -u) != 0 ] ; then
	echo -e "$vermelho[!]$fim Usuario sem permissao de root...\n"
	read -p "Pressione [qualquer tecla] para voltar para o menu OSD do MiSTer..."
	exit 1
fi

## Validando a existencia do registro de montagem da unidade USB0
## E inclusao caso nao exista...
if grep -qow usb0 /etc/fstab ; then
	echo -e "$verde[+]$fim Registro de montagem do USB0 encontrado..."
else
	echo -e "$vermelho[-]$fim Nao existe registro de montagem do USB0\n$amarelo[*]$fim Criando..."
	echo -e "/dev/sda1\t/media/usb0\texfat\tdefaults,rw,exec,nofail\t0\t0" >> /etc/fstab
	if grep -qow usb0 /etc/fstab ; then
		echo -e "$verde[+]$fim Registro criado com sucesso..."
		echo -e "\n"
		read -p "Pressione [qualquer tecla] para reiniciar o MiSTer..."
		reboot
	else
		echo -e "$vermelho[-]$fim Erro ao tentar criar o registro..."
		echo -e "\n"
		read -p "Pressione [qualquer tecla] para voltar para o menu OSD do MiSTer..."	
		exit 1
	fi
fi

echo -e "\n"
read -p "Pressione [qualquer tecla] para voltar para o menu OSD do MiSTer..."
exit 0

