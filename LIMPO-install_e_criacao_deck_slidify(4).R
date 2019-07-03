#### INSTALANDO SLIDIFY:
# Allan Vieira C. Quadros

#rm(list=ls())

install.packages("devtools")
library(devtools)

install_github('ramnathv/slidify', force = TRUE)

install_github('ramnathv/slidifyLibraries')

install_github('slidifyLibraries', 'ramnathv')

install_github('rCharts', 'ramnathv')

library(slidify)
library(slidifyLibraries)

#### CRIANDO NOVO PROJETO DE SLIDES:

# antes definir o local A PARTIR DO qual será criada a pasta da apresentação com
#... a função author()
library(tcltk)
dir_wd.loc<-tk_choose.dir()

#dir_wd.loc<-choose.ls()
setwd(dir_wd.loc)

#1- criando slides base e demais diretorios
author("apres_DIFIN_DS&R", use_git = FALSE)
# cria o arquivo index.Rmd e as pastas no diretorio escolhido
# usar git = FALSE, pq normalmente dah problema para usar a função publish para publicar...
#... tanto no github quanto no rPubs
# nunca usar o knitr como "carregador" nas opções

#2- rodando a apresentacao
# dependendo dos widgets, teremos que carregar alguns pacotes especificos...
#... tanto no workspace do R, qto dentro dos slides
# A) pacotes básicos (mínimo):
library(slidify)
library(slidifyLibraries)
library(shiny)
library(knitr)
library(XML) # importante para colocar os gráficos do googleVis nos slides??

# B) se usarmos RCharts (ex: pirâmides interativas - Demografia), carregar:
install.packages("XML")
library(XML)
library(reshape2)
library(devtools)
library(plyr)
library(rjson)
library(rCharts)
library(shiny)

# p/ rodar:
# OBS: lembrando que se o WD não estiver "settado" para a pasta do projeto,...
#... o slidify não encontrará o projeto para rodar

# salvar antes o index.Rmd (Encoding UTF-8) com as alterações feitas e depois..
# preferível
slidify("index.Rmd")
# +
runDeck()

# ou:
slidify("index.Rmd")
# +
browseURL("index.html")

#### CARREGANDO PROJETO JÁ EXISTENTE

# OBS: sempre eh bom slavarmos um workspace com as tabelas, graficos e data frames...
#... produzidos dentro do R para o projeto
# deixar carregado inclusive o endereçamento da nossa pasta de trabalho que...
#... contém os slides:
# dir_wd.loc<-choose.dir()
# 1º passo: carregar
# se jah tivermos um projeto feito eh soh carregar o workspace e dar o setwd
setwd(dir_wd.loc)

# carregar os pacotes necessários a apresentação.
# esse aqui embaixo são o mínimo:
library(slidify)
library(slidifyLibraries)
library(shiny)
library(knitr)


# p/ rodar:
# OBS: lembrando que se o WD não estiver "settado" para a pasta do projeto,...
#... o slidify não encontrará o projeto para rodar
  
# salvar antes o index.Rmd com as alterações feitas e depois..
# preferível
slidify("index.Rmd")
# +
runDeck()


#### PUBLICAÇÃO DOS SLIDES NA INTERNET (GITHUB) (FORA DO R):
# publicação dah pau no meu R ---> não fazer dentro do R:

### método para publicar os slides (como páginas de internet - ghPages) no Github...
#... sem problemas:
# 1º criar o repositório no Github pela web - tutorial Rammanath:
# https://rpubs.com/thoughtfulbloke/25103
# ou salvo como .PDF("# criacao de repositorio GitHub para Slidify (Rammanath)") ...
#...na pasta de exemplos para Slidify

# 2º parear a pasta do projeto (controle de versões) e subir os arquivos via prompt:
# como publicar páginas no github pelo prompt:
# http://lea.verou.me/2011/10/easily-keep-gh-pages-in-sync-with-master/
# ou salvo como .PDF ("Easiliy keep Gh-pages in sync...") na pasta de exemplos... 
#...para Slidify
# OBS: esses mesmos comandos de pareamento devem ser repetidos quando formos atualizar...
#... o repositório


# meu repositorio do trabalho de PO:
#https://allanvc.github.io/pres_PO/#1



############ PARA ALTERAR LAYOUTS E CORES DE FONTES DOS SLIDES:
# para isso eh necessário alterar os códigos .css que controlam esses parâmetros.
# No diretorio do nosso slide deck, devemos ir em: 
#./libraries/frameworks/io2012/css/slidify.css
# eh melhor salvar o original como slidify_old.css antes para podermos recuperar em caso de problema depois
# verificar o arquivo ("slidify.css") que alterei para a apresentação da DIFIN.
# IMPORTANTE: em alguns posts do ramnath, ele diz que se colocarmos códigos .css direto
#... no index.Rmd esses códigos terão precedência sobre a respectiva configuração no slidify.css
# Mas eh melhor mudar direto no slidify.css
# peguei a dica inicial disso tudo em: http://stackoverflow.com/questions/25539200/how-do-i-style-a-slide-heading-in-slidify
