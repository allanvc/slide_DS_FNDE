



# =============================

library(rvest)
library(stringr)

# colocando tudo em dois loops

# vetores para receber
vec_mail <- NULL

vec_fone <- NULL

vec_est <- NULL

vec_name <- NULL



# vetor de estados
# estados <- c("AC", "AL", "GO", "SP", "SC", "SE", "TO")
# estados <- c("AC", "AL", "GO")
# estados <- c("AC", "AL", "AP", "AM", "BA", "CE", "DF", "ES", "GO", "MA", "MT", "MS", "MG",
#              "PA", "PB", "PR", "PE", "PI", "RJ", "RN", "RS", "RO", "RR", "SC", "SP", "SE", "TO")
# 
# estados <- c("RS", "RO", "RR", "SC", "SP", "SE", "TO")

estados <- c("AM")

string_urls <- mapply(paste0, "http://www.interlegis.leg.br/comunidade/casas_legislativas/municipal/", estados)

# loop externo:
for(i in seq_along(string_urls)){
  # i =2
  # =============================
  # teste inicial de abas
  
  # =============================
  # extracao da primeira pagina
  
  # extraindo pagina completa (inicial) do estado
  page_est <- read_html(string_urls[i])
  
  
  # extrai todos os hyperlinks dos municipios
  page_links <- page_est %>% html_nodes("a") %>% html_attr('href') # ok!
  
  
  # limpando para ficar so com os enderecos
  mun_links <- str_subset(page_links, "casa_view")
  
  # limpando mais uma vez (eliminar repeticoes)
  mun_links <- unique(mun_links) # ok! maximo 30!
  
  # =============================
  # loop interno
  for(j in seq_along(mun_links)){
    # j=1
    # leitura da pagina do municipo
    page_mun <- read_html(mun_links[j]) # esse nao tem e-mail
    
    
    # extraindo emails
    
    page_mun_mails <- page_mun %>% html_nodes("a") %>% html_attr('href') # ok!
    
    # extrai todos os hyperlinks dos municipios
    page_mun_mails <- page_mun %>% html_nodes('a[href^="mailto:"]')
    
    mun_mail <- str_subset(page_mun_mails, "mailto:[^atendimento@interlegis.leg.br]")[1] # para nao trazer os endereços de e-mail da interlegis
    # ok!  
    
    # limpando o e-mail:
    mun_mail <- str_extract(mun_mail, "(?<=>)[^<]+") # extrai tudo que estah entre > e <
    
    
    # extraindo nomes
    
    page_mun_names <- page_mun %>% html_nodes("h1") # ok!
    
    # limpando o nome:
    mun_name <- str_extract(page_mun_names, "(?<=>)[^<]+")
    
    
    # extraindo fones
    
    page_mun_fones <- page_mun %>% html_nodes("dd") # ok!
    
    # limpando o fone:
    pattern <- "[(]([1-9]{2})[)][- .]([0-9]{4})[- .]([0-9]{4})"
    
    mun_fone <- str_extract(page_mun_fones, pattern)
    
    # se nao tiver campo fone nada, colocar NA
    # do contrario extrair o numero
    if(all(is.na(mun_fone))){
      
      mun_fone <- NA
      
    } else {
      
      mun_fone <- str_subset(mun_fone, pattern)
    }
    
    
    # =============================
    # salvando
    
    vec_mail <- append(vec_mail, mun_mail)
    
    vec_fone <- append(vec_fone, mun_fone)
    
    vec_name <- append(vec_name, mun_name)
    
    vec_est <- append(vec_est, estados[i])
    
  }
  
  
  
  
  # =============================
  # limpando para ficar so com os enderecos das PROXIMAS abas
  abas_links <- str_subset(page_links, "start:int")
  abas_links <- unique(abas_links)
  
  nums <- str_extract(abas_links, "[\\d]+")
    
  test_char <- character(0)
  
  if(identical(test_char, nums)){
    
    nums <- 1
    
    
  } else{
    
    nums <- unique(as.numeric(as.character(nums)))
    
    nums <- seq(30, nums[length(nums)], by=30)
    
    
    # fazendo as strings de endereço
    prox_abas <- str_extract(abas_links, "[\\D]+")[1]
    
    prox_abas <- paste0(prox_abas, nums)
    
    
    
    # ======================
    # loop sobre a sequencia de abas
    for(k in seq_along(prox_abas)){
      # k=3
      # extraindo pagina completa estado naquela aba
      
      
      # feito o loop, ir para os proximos 30
      # # extraindo pagina completa estado naquela aba
      page_est <- read_html(prox_abas[k])
      
      # extrai todos os hyperlinks dos municipios
      page_links <- page_est %>% html_nodes("a") %>% html_attr('href') # ok!
      
      
      # limpando para ficar so com os enderecos
      mun_links <- str_subset(page_links, "casa_view")
      
      # limpando mais uma vez (eliminar repeticoes)
      mun_links <- unique(mun_links) # ok! maximo 30!
      
      # =============================
      # loop interno
      for(j in seq_along(mun_links)){
        # j=1
        # leitura da pagina do municipo
        page_mun <- read_html(mun_links[j]) # esse nao tem e-mail
        
        
        # extraindo emails
        
        page_mun_mails <- page_mun %>% html_nodes("a") %>% html_attr('href') # ok!
        
        # extrai todos os hyperlinks dos municipios
        page_mun_mails <- page_mun %>% html_nodes('a[href^="mailto:"]')
        
        mun_mail <- str_subset(page_mun_mails, "mailto:[^atendimento@interlegis.leg.br]")[1] # para nao trazer os endereços de e-mail da interlegis
        # ok!  
        
        # limpando o e-mail:
        mun_mail <- str_extract(mun_mail, "(?<=>)[^<]+") # extrai tudo que estah entre > e <
        
        
        # extraindo nomes
        
        page_mun_names <- page_mun %>% html_nodes("h1") # ok!
        
        # limpando o nome:
        mun_name <- str_extract(page_mun_names, "(?<=>)[^<]+")
        
        
        # extraindo fones
        
        page_mun_fones <- page_mun %>% html_nodes("dd") # ok!
        
        # limpando o fone:
        pattern <- "[(]([1-9]{2})[)][- .]([0-9]{4})[- .]([0-9]{4})"
        
        mun_fone <- str_extract(page_mun_fones, pattern)
        
        # se nao tiver campo fone nada, colocar NA
        # do contrario extrair o numero
        if(all(is.na(mun_fone))){
          
          mun_fone <- NA
          
        } else {
          
          mun_fone <- str_subset(mun_fone, pattern)
        }
        
        
        # =============================
        # salvando
        
        vec_mail <- append(vec_mail, mun_mail)
        
        vec_fone <- append(vec_fone, mun_fone)
        
        vec_name <- append(vec_name, mun_name)
        
        vec_est <- append(vec_est, estados[i])
        
      }
      
      
      
      
      
      
      
    }
    
    
    
  }
  
  
  
      

}

library(dplyr)

df_res <- data_frame(vec_est, vec_name, vec_fone, vec_mail)

df_res <- unique(df_res)

colnames(df_res) <- c("UF", "camara", "tel", "email")


write.csv2(df_res, "contatos_camaras.csv", row.names = FALSE)

write.csv(df_res, "contatos_camaras3_parcial_RS.csv", row.names = FALSE)

# lembrar que DF se comportará diferente --- soh fazer um unique ao final pq vem com dois repetidos


df_res2 <- data_frame(vec_est, vec_name, vec_fone, vec_mail)

df_res2 <- unique(df_res2)

colnames(df_res2) <- c("UF", "camara", "tel", "email")


library(readr)

df_res1 <- read_csv("contatos_camaras3_parcial_RS.csv")


df_res_total <- rbind(df_res1, df_res2)

df_res_total <- unique(df_res_total)

write.csv(df_res_total, "contatos_camaras_FINAL.csv", row.names = FALSE)
