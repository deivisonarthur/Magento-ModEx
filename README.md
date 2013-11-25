#Magento Module Extractor - ModEx#
Shell Script de extração de módulos instalados no Magento
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

```<!--Modulo_DeivisonArthur--> ou /* Modulo_DeivisonArthur */```

EUREKA!!!! Bem com esses 2 tipos de comentários conseguimos colocar a string que vamos buscar dentro de todos os tipos de arquivos, desde:
HTML, CSS, JS, PHP,... E assim também conseguiriamos buscar todos os arquivos que contenham a string buscada, independentemente 
de onde ela esteja em nossa instalação do Magento!

Como funciona?
=============
Primeiramente precisa-se ter um padrão de desenvolvimento de módulo no Magento, para isso pode-se usar uma regra do PHPDocs 
que pede que seja incluso comentários descritivos em todos os arquivos que compoem o módulo, veja mais em:

* http://manual.phpdoc.org/HTMLSmartyConverter/HandS/phpDocumentor/tutorial_tags.package.pkg.html
* http://manual.phpdoc.org/HTMLSmartyConverter/HandS/phpDocumentor/tutorial_tags.pkg.html
* http://manual.phpdoc.org/HTMLSmartyConverter/HandS/phpDocumentor/tutorial_phpDocumentor.quickstart.pkg.html
* http://www.phpdoc.org/docs/latest/for-users/phpdoc/basic-syntax.html
* https://github.com/phpDocumentor/phpDocumentor2/releases/tag/v2.0.0


Por exemplo:

```
/**
 *
 * @category   Inovarti
 * @package    Inovarti_GoogleAdwords
 * @author     Suporte <webmaster@inovarti.com>
 * @version 1.0 this version tag is parsed
 */
```
PS: Esse comentário precisa estar presente em todos os arquivos que compoem o módulo! Pois utilizaremos a parte setado no 
@package para realizar a busca pelos arquivos do módulo. Nesse caso seria a string: Inovarti_GoogleAdwords


PS: Não é necessário que seja seguido o padrão do PHPDoc, mas que pelo menos tenha um comentário com o nome do módulo em todos os arquivos.

Pos bem, com o comentário setado em todos os arquivos, podemos realizar a busca!

Executando a extração do módulo
=============

1-Primeiramente entre em seu SSH e baixe o Shell Script ModEx.sh em sua raiz do Magento.

2-Dê a permissão de execução ao ModEx.sh com o comando:
```chmod +x ModEx.sh```

3-Busque e extraia o módulo com o comando:
```./modex.sh -s Inovarti_GoogleAdwords```

PS: o atributo "s" indica que será passado uma string ao ModEx, pois irei implementar a extração em uma pasta ao invés de um arquivo compactado, 
com isso conseguimos entrar na pasta, ver se esta tudo certo e iniciar o processo de envio do módulo para o Github.

4-Se tudo der certo, vc verá que existe em sua raiz do Magento um arquivo .tar.gz, nesse caso criou o ModEx-Inovarti_GoogleAdwords-22.tar.gz

Caso queira ver como fica o arquivo compactado com o exemplo acima, acesse: http://lojamodelo.inovarti.com.br/ModEx-Inovarti_GoogleAdwords-22.tar.gz


Bem é isso pessoal, espero ter ajudado e contribuido para um desenvolvimento mais ágil e padronizado!

Observações
=============
* Não execute o ModEx em sua loja de produção! Utilize um ambiente seguro com linux e o magento default para testar!
* Utilize somente para estudos, apesar de ter sido bastante estudado como formar o Shell Script, não homologamos por completo!
* Não busca por strings padrões e genéricas como "magento", pois seu sistema pode entrar em loop.
* Apesar de feito para extração de módulos Magento por conta de sua diversidade de pastas, sua lógica pode ser utilizada também em outros sistemas.
* Não remova os créditos! Senão nós iremos te achar e falar publicamente sobre a remoção dos créditos! rs 

Creditos:
=============
```
-> Deivison Arthur <deivison.arthur@gmail.com> 
-> Samuel Maciel Sampaio <samukasmk@gmail.com> 
-> Isaac Lopes <isaac@inovarti.com.br>
```

Licença GPLv3
=============

Este arquivo esta sujeito a versao 3 da GNU General Public License, que foi adicionada nesse pacote no arquivo COPYING e esta disponivel pela Web em http://pt.wikipedia.org/wiki/GNU_General_Public_License; Qualquer notificação mande um email para os mantenedores do projeto.

http://www.gnu.org/licenses/gpl-3.0.html

A GPL3 é recursiva! Com isso não haverá proteção intelectual sobre tais sistemas! Ou seja, GPL é viral. O que significa dizer que qualquer coisa que ela toca, vira GPL. Se você usar uma biblioteca GPL, seu aplicativo será GPL.

Veja mais em: http://www.deivison.com.br/blog/2012/12/05/como-remover-a-licenca-de-modulos-do-magento/

