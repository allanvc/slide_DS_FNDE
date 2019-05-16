---
title       : Data Science
subtitle    : A importância da Ciência de Dados para o FNDE 
author      : Allan V. C. Quadros
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax, quiz, bootstrap, interactive] # {mathjax, quiz, bootstrap}
ext_widgets : #{rCharts: [libraries/nvd3, libraries/leaflet, libraries/dygraphs]}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
logo        : fnde_blue.jpg
biglogo     : fnde_logo1.jpg
assets      : {assets: ../../assets}
--- .segue bg:grey

<style type="text/css">
body {background:grey transparent;
}
.quiz-option label{
  display: inline;
  font-size: 1em;
}
ul.nav li::before { content: ""; }  
ul.nav li{ font-size: 18px; line-height: 24px;}


em {
    font-style: italic
}
strong {
    font-weight: bold;
}

</style>

<br>
<br>
<br>
<br>
<br>
<br>
<br>

# *"In God we trust. All others must bring data."* 

<p style="text-align:right">W. Edwards Deming</p>


<!-- --- &twocol -->
<!-- ## Exemplos (do que não fazer) -->
<!-- <br> -->
<!-- *** =left -->
<!-- > - <img src="./assets/img/indicador1.png" style="float: center; width: 100%; margin:auto"> -->

<!-- > - <img src="./assets/img/indicador2.png" style="float: center; width: 100%; margin:auto"> -->


<!-- *** =right -->

<!-- > - <img src="./assets/img/survival_bias.jpg" style="float: center; width: 90%; margin:auto"> -->


--- .class #id
## Objetivo
<br>
<br>
<br>
> - Mostrar a importância da Ciência de Dados no mundo atual e no FNDE

--- .class #id
## Objetivos específicos
<br>
<br>
> - Definir o que é Data Science

<br>

> - Trazer exemplos de sua aplicação no mundo contemporâneo

<br>

> - Trazer exemplos de sua aplicação no FNDE

<br>

> - Indicar como adquirir esse tipo de conhecimento

--- .class #id
## O Que é Data Science?
<br>
> .fragment É um campo **multidisciplinar** que utiliza métodos científicos, processos, algoritmos e sistemas para extrair conhecimento e insights tanto de dados estruturados quanto não estruturados.


<br>
<br>
> - dados não estruturados - ex: Twitter: o que as pessoas estão falando do FNDE no twitter?)

> - dados estruturados: alguém consegue tirar alguma informação só de olhar para uma tabela de > 500 mil linhas?


--- &twocol
## Quem está fazendo Data Science?

*** =left

<br>
> - Estatísticos
<br>
> - Cientistas da Computação
<br>
> - Matemáticos
<br>
> - Engenheiros

*** =right

<br>
> - Administradores
<br>
> - Psicólogos
<br>
> - Médicos
<br>
> - Advogados
<br>
> - Pessoas comuns


--- &twocol
## Data Science no Mundo

*** =left

<img src="./assets/img/tesla.png" style="float: left; width: 120%; margin-right: 1%; margin-bottom: 0.5em;">

*** =right

<img src="./assets/img/galaxies2.jpg" style="float: left; width: 90%; margin-right: 1%; margin-bottom: 0.5em;">


--- .class #id
## Data Science no Mundo

> - sistemas de recomendação;

> - reconhecimento facial (desde aplicação policial até diversão no celular: snapchat);

> - classificação de doenças;

> - detecção de fraudes (cartão de crédito);


--- .segue bg:grey
# E no FNDE?


--- .segue bg:grey
# Como o FNDE lida com o grande volume de dados de seus programas?


--- .segue bg:grey
<img src="./assets/img/excel_logo.jpg" style="float: center; width: 90%; margin: auto">

--- .segue bg:grey
<img src="./assets/img/basic_arithmetic.png" style="float: left; width: 70%; margin:auto">

--- .segue bg:grey
<img src="./assets/img/summation.png" style="float: left; width: 35%; margin:auto"> </br>

--- .segue bg:grey
<img src="./assets/img/mu.png" style="float: center; width: 60%; margin:auto">


--- .segue bg:grey
# Você saberia dizer quanto e o quê o programa com o qual você trabalha retorna para a sociedade?


--- .class #id
## Aplicação no FNDE

  Como resolver?

- <img src="./assets/img/inadimplencia_FIES.PNG" style="float: center; width: 100%; margin:auto">


--- .class #id
## Tentativa 1

- <img src="./assets/img/tabela_fies.png" style="float: center; width: 80%; margin:auto">


--- .class #id
## Tentativa 2


<iframe src="./assets/widgets/plotly_scatter1.html" width="90%" height="50%" scrolling="no" seamless="seamless" frameBorder="1"> </iframe>



--- .class #id
## Solução

- Utilizar um modelo de classificação (regressão logística)

- <img src="./assets/img/log_reg.PNG" style="width: 60%">

<br>

> - Detectou inadimplentes em ~ $\frac{3}{4}$ das vezes


--- .class #id
## Onde obter conhecimento?

<br>
<br>
> - Trilha de capacitação em Data Science do FNDE;
<br>
<br>
> - Internet: Coursera, Udemy, Udacity, Youtube, Khan Academy, Blogs



--- .segue bg:grey
<br>
<br>
# Obrigado!!

<!-- como colocar figuras ao lado de palavras varias vezes em html -->
<div>
    <p>Feito no
    <img src="./assets/img/rball.png" style="float: center; width: 5%;"> com 
    <img src="./assets/img/slidifylogo2.png" style="float: center; width: 12%;"> e
    <img src="./assets/img/plotlylogo.png" style="float: center; width: 7%;"> !! </p>
</div>

Apresentação disponíveis no<img src="./assets/img/gitlogo5.png" style="float: center; width: 13%;">em:
<br>

<p>
<a href="https://allanvc.github.io/slide_DS_FNDE/" style="color:black">allanvc.github.io/slide_DS_FNDE/</a>
</p>

<br>

*Contato:*

*Allan Vieira de Castro Quadros*

<p>
<a href="mailto:allan.quadros@fnde.gov.br" style="color:black">allan.quadros@fnde.gov.br</a>
</p>
<p>
<a href="https://allanvc.github.io" style="color:black">allanvc.github.io</a>
</p>
