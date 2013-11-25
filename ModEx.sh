#!/bin/bash
#
#        ____            _           _     __  __           _ _____
#       |  _ \ _ __ ___ (_) ___  ___| |_  |  \/  | ___   __| | ____|_  __
#       | |_) | '__/ _ \| |/ _ \/ __| __| | |\/| |/ _ \ / _` |  _| \ \/ /
#       |  __/| | | (_) | |  __/ (__| |_  | |  | | (_) | (_| | |___ >  <
#       |_|   |_|  \___// |\___|\___|\__| |_|  |_|\___/ \__,_|_____/_/\_\
#                     |__/
#
#
#   +----------------------------------------------------------------------+
#   | ModEx.sh - Magento Module Extractor - Versao Beta                    |
#   +----------------------------------------------------------------------+
#   |									   |
#   | objective: Extracts modules of magento apps			   |
#   | created in: 20131125						   |
#   |									   |
#   | by:								   |
#   | -> Samuel Maciel Sampaio <samukasmk@gmail.com>			   |
#   | -> Deivison Arthur <deivison.arthur@gmail.com> 			   |
#   |									   |
#   | Este arquivo esta sujeito a versao 3 da GNU General Public License,  |
#   | que foi adicionada nesse pacote no arquivo COPYING e esta disponivel |
#   | pela Web em http://pt.wikipedia.org/wiki/GNU_General_Public_License  |
#   | Voce deve ter recebido uma copia da GNU Public License junto com     |
#   | esse pacote; se nao escreva para:                                    |
#   |                                                                      |
#   | Free Software Foundation, Inc.                                       |
#   | 59 Temple Place - Suite 330                                          |
#   | Boston, MA 02111-1307, USA.                                          |
#   +----------------------------------------------------------------------+



#string para testes: InovartiGoogleAdwords
#pasta_magento=$(pwd)


function help_msg() {
 echo "Argument not recognized! ${ARGS_V[0]}"
 echo "Usage:"
 echo 
 echo "./modex.sh [OPTIONS]"
 echo 
 echo "OPTIONS:"
 echo "  -s   String, to search and extract files"
 echo 
}

ARGS_V=($@)
case ${ARGS_V[0]} in
 -s) STRING_TO_SEARCH=${ARGS_V[1]}
  if [ -z "$STRING_TO_SEARCH" ];
  then
   help_msg
   exit 2
  fi
 ;;
 *) help_msg
  exit 1
esac

echo
echo
echo "please wait extraction module [$STRING_TO_SEARCH]..." 
echo

sudo find . \
 -type f \
  -not -path "./var/*" \
  -not -path "./.*" \
 -exec grep -l "$STRING_TO_SEARCH" {} > .tmp_file_list \;


echo "./README-ModEx.txt" >> .tmp_file_list



echo -e "ModEx.sh - Magento Module Extractor - Versao Beta" >> README-ModEx.txt
echo -e "objective: Extracts modules of magento apps" >> README-ModEx.txt
echo -e "created in: 20131125" >> README-ModEx.txt
echo -e "by:" >> README-ModEx.txt
echo -e "-> Deivison Arthur <deivison.arthur@gmail.com>" >> README-ModEx.txt
echo -e "-> Samuel Maciel Sampaio <samukasmk@gmail.com>" >> README-ModEx.txt
echo -e "URL do proojeto: https://github.com/deivisonarthur/Magento-ModEx" >> README-ModEx.txt 




tar -cvpzf ./ModEx-$STRING_TO_SEARCH.tar.gz -T .tmp_file_list


rm -f .tmp_file_list
#rm -f README-ModEx.txt


echo
echo
echo "Extracted file [ModEx-$STRING_TO_SEARCH.tar.gz]"
echo
echo "Complete extraction!"
echo
echo