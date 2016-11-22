# Tupper's self-referential formula
Shaun Jackman  


```r
library(dplyr)
library(ggplot2)
library(gmp)
library(tidyr)
```


```r
k <- as.bigz("960939379918958884971672962127852754715004339660129306651505519271702802395266424689642842174350718121267153782770623355993237280874144307891325963941337723487857735749823926629715517173716995165232890538221612403238855866184013235585136048828693337902491454229288667081096184496091705183454067827731551705405381627380967602565625016981482083418783163849115590225610003652351370343874461848378737238198224849863465033159410054974700593138339226497249461751545728366702369745461014655997933798537483143786841806593422227898388722980000748404719")
# 1/2 < floor(mod(floor(y/17)*2^(-17*floor(x)-mod(floor(y), 17)),2))
mod <- `%%`
f0 <- function(x, y) 1/2 < mod((y %/% 17) %/% 2 ** (17 * x + mod(y, 17)), 2)
f <- function(x, y) f0(x, k + y)
z <- crossing(data_frame(x = seq(0, 105)), data_frame(y = seq(0, 16))) %>%
  mutate(z = f(x, y))
```

![Tupper's self referential formula](https://wikimedia.org/api/rest_v1/media/math/render/svg/5e4c7a30f3dc20c06057413aed7c89b7e1c67aeb)

See https://en.wikipedia.org/wiki/Tupper's_self-referential_formula


```r
ggplot(z) +
  aes(x = x, y = y, fill = z) +
  geom_tile(show.legend=FALSE) +
  coord_fixed(ratio=1) +
  scale_x_reverse() +
  scale_y_reverse() +
  scale_fill_manual(values = c("white", "black"))
```

![](tupper_files/figure-html/plot-tupper-1.png)<!-- -->
