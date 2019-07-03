
library(ggplot2)
library(gganimate)

data <- tibble::tribble(
  ~year, ~num,
  1950, 56,
  1951, 59,
  1952, 64,
  1953, 67,
  1954, 69,
  1955, 74,
  1956, 78,
  1957, 83
)

p <- ggplot(data, aes(year, num)) + 
  geom_line() + 
  geom_point() + 
  transition_reveal(year) + 
  ease_aes('cubic-in-out')

ap <- animate(p, fps = 20)

anim_save("orc.gif", ap)
# sol em:
# https://stackoverflow.com/questions/51440496/using-gganimate-to-export-gif
