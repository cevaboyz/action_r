library(gmailr)
library(googleAnalyticsR)
library(googledrive)
library(mockr)
library(lubridate)
library(scales)
library(tidyverse)
library(gt)
library(googleAuthR)


GMAIL_SERVICE <- Sys.getenv("GMAIL_SECRET_API")

GMAIL_ADDRESS <- Sys.getenv("GMAIL_ADDRESS")



gmailr::gm_auth_configure(path = GMAIL_SERVICE ,
                          appname = "gmailr")


gmailr::gm_auth(email = GMAIL_ADDRESS,
                path = GMAIL_SERVICE,
                scopes = "full")





TEST <-
    gm_mime() %>%
    gm_to(c(GMAIL_ADDRESS)) %>%
    gm_from(GMAIL_ADDRESS) %>%
    gm_subject(paste0("TEEEEEEEEEST", "BOOOOOOM", "-", "TEEEEEST")) %>%
    gm_text_body("TEEEEEEEST")


gm_send_message(TEST)



date <- gm_date(TEST)

date_2 <- Sys.time()

log <- paste0("The mail has been successfully sent on: ", date)

write.csv(log, file = paste0("data/Log_", date_2, ".csv"))
