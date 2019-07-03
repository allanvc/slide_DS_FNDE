library(rvest)

fnde_presi <- read_html("http://www.fnde.gov.br/acesso-a-informacao/institucional/quem-e-quem/26-presidencia")
fnde_presi <- read_html("http://www.fnde.gov.br/acesso-a-informacao/institucional/quem-e-quem/115-diretoria-de-gestao-de-fundos-e-beneficios-digef")

form <- fnde_presi %>%
  html_nodes("#title-list-1 .item-position span") %>%
  html_text()

form <- fnde_presi %>%
  html_nodes("div#title-list-1")

# OK:
# tudo do formulario:
form1 <- fnde_presi %>%
  html_nodes(xpath='//*[@id="adminForm"]') %>%
  html_text()
form1

# nomes: (25, -10)
form2 <- fnde_presi %>%
  html_nodes(xpath='//*[@class="tileHeadline"]') %>%
  # ou
  # html_nodes('.tileHeadline') %>%
  html_text()
form2

# cargos:
form3 <- fnde_presi %>%
  html_nodes(xpath='//*[@class="item-position"]') %>%
  # ou
  #html_nodes('.item-position') %>%
  html_text()
form3

# fone:
form4 <- fnde_presi %>%
  html_nodes(xpath='//*[@class="item-phone"]') %>%
  # ou
  #html_nodes('.item-phone') %>%
  html_text()
form4



## limpando:
#help(substring)
form2 <- gsub("\n|\t", "", form2)

# form2 <- gsub("\n", "", form2) 
# form2 <- gsub("\t", "", form2) 

form3 <- gsub("\n|\t", "", form3)
# form3 <- gsub("\n", "", form3) 
# form3 <- gsub("\t", "", form3) 
form3 <- trimws(form3) 

form4 <- gsub("\n|\t", "", form4)
# form3 <- gsub("\n", "", form3) 
# form3 <- gsub("\t", "", form3) 
form4 <- trimws(form4) 

# colocando na tabela
df_presi <- data.frame("nome"=form2, "cargo"=form3, "tel"=form4)


## DIGEF:










help(gsub)
## exemplo de e-mail (com javascript), mas não funciona no do FNDE
# email:
link <- 'https://food.list.co.uk/place/22191-brewhemia-edinburgh/'
page <- read_html(link)
name_html <- html_nodes(page,'.placeHeading')
business_adr <- html_text(adr_html)
tel_html <- html_nodes(page,'.value')
business_tel <- html_text(tel_html)

emailjs <- page %>% html_nodes('li') %>% html_nodes('script') %>% html_text()
ct <- v8()


read_html(ct$eval(gsub('document.write','',emailjs))) %>% html_text()

# install.packages("V8")
library(V8)
emailjs <- fnde_presi %>% html_nodes('li') %>% html_nodes('script') %>% html_text()
ct <- v8()

read_html(ct$eval(emailjs)) %>% html_text()




  xpath='//*[@id="title-list-1"]'

  
string

form <-fnde_presi %>% 
  html_nodes("form id='adminForm") %>%
  html_text()
  
  as.numeric()
rating
