#!/bin/bash
echo -e "Azusas Debian Programming Setupscript"
read -r "Press Enter to Start...." datasdsda456
echo "Continuing ...."
apt update
apt upgrade -y
apt autoremove
echo -e "⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻"
read -r -e -p "Should Snapcraft be installed? (y/n): " snapedcraft
if [ "$snapedcraft" == y ];
    then
      apt install snapd -y
      snap install core
      echo -e "Snap installed..."
    else 
    echo -e "Skipped Snap install..."
fi 
echo -e "Clear Commandprob"
clear
echo -e "⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻"
echo -e "⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻"
echo -e "⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻"
echo -e "⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻"
read -r -e -p "Should Visual Studio Code be installed? (y/n): " code
read -r -e -p "Visual Studio with Snap(Required Snap)? (y/n): " snaped
if [ "$code" == y ];
    then
      if [ "$snaped" == y ];
        then
            snap install --classic code
            else
            apt install software-properties-common apt-transport-https curl -y
            curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
            sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
            apt update
            apt install code
            apt upgrade
            apt autoremove
        fi 
    else 
    echo -e "Skipped Visual Studio Code install..."
fi
echo -e "⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻"
echo -e "⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻"
echo -e "⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻"
echo -e "⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻"
if [ "$snapedcraft" == y ];
then
    read -r -e -p "Should Discord be installed? (y/n): " discordeinstall
    if [ "$discordeinstall" == y ];
        then
            snap install discord
        else 
        echo -e "Skipped Discord install..."
    fi
fi
echo -e "⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻"
echo -e "⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻"
echo -e "⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻"
echo -e "⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻"
read -r -e -p "Should .NET (c#) be installed? (y/n): " dotnetin
    if [ "$dotnetin" == y ];
        then
            wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
            sudo dpkg -i packages-microsoft-prod.deb
            apt update
            apt install -y apt-transport-https
            apt update 
            apt install -y dotnet-sdk-5.0
            apt install -y aspnetcore-runtime-5.0
            apt install apt-transport-https dirmngr gnupg ca-certificates -y
            apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
            echo "deb https://download.mono-project.com/repo/debian stable-buster main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
            apt update
            apt install mono-devel -y
            clear 
            echo -e ""
            echo -e ""
            echo -e ""
            echo -e ""
            echo -e "⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻"
            echo -e "C# is Installed!"
        else 
        echo -e "Skipped .NET (c#) install..."
    fi
echo -e "⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻"
echo -e "⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻"
echo -e "⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻"
echo -e "⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻"
read -r -e -p "Install Google Chrome Web Browser? (y/n): " ChromeBw
if [ "$ChromeBw" == y ];
    then
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        apt install ./google-chrome-stable_current_amd64.deb
        cat /etc/apt/sources.list.d/google-chrome.list
        apt update
        apt upgrade
    else
        echo -e "Skipped Google Chrome Web Browser install"
fi
echo -e "⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻"
echo -e "⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻"
echo -e "⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻"
echo -e "⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻"
clear 
echo -e "Install Debian/Ubuntu PC auto config for desktop Finished"
read -r -e -p "press any to ExitA"