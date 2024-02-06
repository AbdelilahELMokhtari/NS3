#!/bin/bash

#install prerequis

apt install g++ python3 cmake ninja-build git gir1.2-goocanvas-2.0 python3-gi python3-gi-cairo python3-pygraphviz gir1.2-gtk-3.0 ipython3 tcpdump wireshark sqlite sqlite3 libsqlite3-dev qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools openmpi-bin openmpi-common openmpi-doc libopenmpi-dev doxygen graphviz imagemagick python3-sphinx dia imagemagick texlive dvipng latexmk texlive-extra-utils texlive-latex-extra texlive-font-utils libeigen3-dev gsl-bin libgsl-dev libgslcblas0 libxml2 libxml2-dev libgtk-3-dev lxc-utils lxc-templates vtun uml-utilities ebtables bridge-utils libxml2 libxml2-dev libboost-all-dev ccache -y 2>>errors.package
if [ $? -eq 0 ]
then
echo "[+]Prerequis Bien Installer[+]"
else
echo "[+]Probleme de Installer des packages --> stocker sur errors.packages[+]"
exit
fi


#Telechargement de ns-allinone
wget https://www.nsnam.org/releases/ns-allinone-3.40.tar.bz2 -nv 2> error.txt
if [ $? -eq 0 ]
then
echo "[+]ns-allinone-3.40 est Telecharger[+]"
else
echo "[+]Probleme de telechargement stocker sur error.txt[+]"
exit
fi
#extraction de ns allinone
tar -xjf ns-allinone-3.40.tar.bz2
cd ns-allinone-3.40/ns-3.40

#Building Etape
echo "[+]Building Start[+]"
./build.py --enable-examples --enable-tests 2>errors.building
if [ $? -eq 0]
then
echo "[+]Building Terminer[+]"
else
echo "[+]Probleme in Building --> errors.building[+]"
exit
fi
echo "[+]Installation NS3 Terminer[+]"

