#!/bin/bash
installedGitVer=$(git --version | awk '{print $3}')
DATE=$(date '+%F%T')
HOSTNAME=/usr/bin/hostname
read -rp "Enter git version to install : " reqGitVer
if [[ ${installedGitVer} == ${reqGitVer} ]] ; then
   echo "${DATE} : The provided git Version ${reqGitVer} is already installed on $(${HOSTNAME}) server"
   exit 1
fi

echo "${DATE} : Installing pre-requisites packages for Git using YUM.."
preReqCheck=$(yum list installed curl-devel expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker wget |awk 'NR!=1' |wc -l)
if [[ ${preReqCheck} -eq 7 ]] ; then
   echo "${DATE} : Pre-requisites packages already installed .."
else
   yum install -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker wget 1>/dev/null 2>&1
   if [[ $? -ne 0 ]] ; then
      echo "${DATE} : Pre-requisites package installation failed.."
      exit 2
   else
      echo "${DATE} : Pre-requisites package installation completed successfully.."
   fi
fi

gitDir=/root/Downloads

if [[ ! -e ${gitDir} ]] ; then
   echo "${DATE} : Creating directory ${gitDir}"
   mkdir -p ${gitDir}
fi

if [[ -e ${gitDir} ]] ; then
   cd ${gitDir}
   if [[ ! -e ${gitDir}/git-${reqGitVer}.tar.gz ]] ; then
      echo "${DATE} : Downloading Git ${reqGitVer}"
      wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-${reqGitVer}.tar.gz 1>/dev/null 2>&1
      wgetSC=$?
   else
      echo "${DATE} : File ${gitDir}/${reqGitVer} already downloaded"
   fi
fi

if [[ ${wgetSC} -eq 0 ]] ; then
      echo "${DATE} : Extracting git-${reqGitVer}.tar.gz under ${gitDir}"
      tar xvzf "git-${reqGitVer}.tar.gz" -C ${gitDir} 1>/dev/null 2>&1
else
      echo "${DATE} : Failed to download git.${reqGitVer}.tar.gz"
      exit 3
fi


echo "${DATE} : Changing directory cd into ${gitDir}/git-${reqGitVer}"
if [[ -e ${gitDir}/git-${reqGitVer} ]] ; then
   cd ${gitDir}/git-${reqGitVer}
   echo "${DATE} : Building git .."
   make prefix=/usr/local all 1>/dev/null 2>&1
   if [[ $? -ne 0 ]] ; then
      echo "${DATE} : Git build failed .."
      exit 1
   else
      echo "${DATE} : Installing git .."
      make prefix=/usr/local install 1>/dev/null 2>&1
      if [[ $? -ne 0 ]]; then
          echo "${DATE} : Git install failed .."
          exit 1
      else
          echo "${DATE} : Git installed successfully .."
      fi
   fi
fi

echo "${DATE} : Removing git which installed from yum package manager"
yum remove -y git 1>/dev/null 2>&1

echo "${DATE} : Current git version is below.."

git --version
