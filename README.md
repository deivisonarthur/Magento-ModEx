Magento Module Extractor - ModEx
=============

        ____            _           _     __  __           _ _____
       |  _ \ _ __ ___ (_) ___  ___| |_  |  \/  | ___   __| | ____|_  __
       | |_) | '__/ _ \| |/ _ \/ __| __| | |\/| |/ _ \ / _` |  _| \ \/ /
       |  __/| | | (_) | |  __/ (__| |_  | |  | | (_) | (_| | |___ >  <
       |_|   |_|  \___// |\___|\___|\__| |_|  |_|\___/ \__,_|_____/_/\_\
                     |__/

objective: Extracts modules of magento apps   
Versao Beta
   
oque é o ModEx?
=============

Bem há tempos venho estudando sobre como desenvolver módulos de forma organizada para Magento. Nessas pesquisas eu 
encontrei o Modgit que é uma excelente ferramenta para instalação, remoção e update do módulo. Porém nunca havia 
encontrado uma forma de trabalho organizado para a parte de desenvolvimento de módulo no Magento.

Ou seja, basicamente se vc estiver desenvolvendo um módulo para Magento você usará uma instalação limpa e
ao termina o desenvolvolvimento será necessário recolher todos os arquivos que compoem o módulo, para assim poder jogar 
o módulo no Github ou mesmo para posteriormente distribui-lo compactado posteriormente.

Bem nos estudos eu havia encontrado o seguinte post no Inchoo:
http://inchoo.net/ecommerce/magento/how-to-setup-git-for-magento-extension-development/

Resumidamente ele explica uma forma que aparentemente seria mais fácil de trabalhar com o desenvolvimento no Magento,
Ele explica como criar links simbólicos para todos os arquivos que compoem o módulo e assim tornar mais simples a 
maneira de envio do modulo para o github, mas mesmo assim essa tarefa apesar de automatizar um pouco o processo, 
ainda é uma maneira cansativa, pois é preciso ratrear todos os arquivos que se compoem o módulo e sempre manter os links
simbólicos atualizados.

Ou seja, eu estava sem recursos para agilizar o desenvolvimento de módulos no Magento e estava determinado de achar 
uma solução que dê menos trabalho rs.

Pois bem navegando encontrei um outro post:
http://diy.o.cmdcentral.co.za/kb/category/magento/dev_tutorials/

Emfim vi nele uma forma plausível para tornar a tarefa mais simples, pois ele utiliza o locate para buscar os 
arquivos que compoem o módulo. Porém ele se baseia em busca de urls e nome dos arquivos e com isso deixaria de 
fora outros arquivos espalhados em outras pastas no Magento.

Sendo mais detalhista verifiquei que seria possível aprimorar essa busca com o FIND, pois com o FIND seria capaz de buscar 
strings dentro dos arquivos. Ou seja, basta o desenvolvedor programar dentro de um padrão onde em cada arquivo que 
compoem o módulo ele incluiria o comentário com o nome do módulo, exemplo:

<!--Modulo_DeivisonArthur--> ou / * Modulo_DeivisonArthur * /

EUREKA!!!! Bem com esses 2 tipos de comentários conseguimos colocar a string que vamos buscar dentro de todos os tipos de arquivos, desde:
HTML, CSS, JS, PHP,... E assim também conseguiriamos buscar todos os arquivos que contenham a string buscada, independentemente 
de onde ela esteja em nossa instalação do Magento!


Creditos:
=============
created in: 20131125    

by:    
-> Deivison Arthur <deivison.arthur@gmail.com> 

-> Samuel Maciel Sampaio <samukasmk@gmail.com> 

Licença GPL3
=============

Este arquivo esta sujeito a versao 3 da GNU General Public License, que foi adicionada nesse pacote no arquivo COPYING e esta disponivel pela Web em http://pt.wikipedia.org/wiki/GNU_General_Public_License Voce deve ter recebido uma copia da GNU Public License junto com esse pacote; se nao mande um email para os mantenedores do projeto.

