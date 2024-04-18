## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
#  remotes::install_github('jbryer/login')

## -----------------------------------------------------------------------------
APP_ID <- 'my_login_app' # It is recommended that this is defined in global.R

## ----setup--------------------------------------------------------------------
library(login)

## ----eval=FALSE---------------------------------------------------------------
#  USER <- login::login_server(
#      id = APP_ID,
#      db_conn = RSQLite::dbConnect(RSQLite::SQLite(), 'users.sqlite'),
#      emailer = emayili_emailer(
#          email_host = email_host,
#          email_port = email_port,
#          email_username = email_username,
#          email_password = email_password,
#          from_email = reset_password_from_email
#      ),
#      additional_fields = c('first_name' = 'First Name',
#                            'last_name' = 'Last Name'),
#      cookie_name = 'loginusername',
#      salt = APP_ID
#  )

## ----eval = FALSE-------------------------------------------------------------
#  emayili_emailer <- function(
#  		email_host = NULL,
#  		email_port = NULL,
#  		email_username = NULL,
#  		email_password = NULL,
#  		from_email = NULL
#  ) {
#  	function(to_email, subject, message) {
#  		email <- emayili::envelope() |>
#  			emayili::from(from_email) |>
#  			emayili::to(to_email) |>
#  			emayili::subject(subject) |>
#  			emayili::text(message)
#  		smtp <- emayili::server(
#  			email_host,
#  			email_port,
#  			email_username,
#  			email_password
#  		)
#  		smtp(email, verbose = FALSE)
#  	}
#  }

## ----eval=FALSE---------------------------------------------------------------
#  login::login_ui(id = APP_ID)

## ----eval=FALSE---------------------------------------------------------------
#  login::logout_button(id = APP_ID)

## ----eval=FALSE---------------------------------------------------------------
#  output$my_ui <- renderUI({
#    if(USER$logged_in) {
#      # UI elements visible to users who are logged in.
#    } else {
#      # UI elements visible to users who are NOT logged in.
#    }
#  })

## ----eval=FALSE---------------------------------------------------------------
#  login::is_logged_in(
#    id = APP_ID,
#    div("This only shows when you are logged in!")
#  )

## ----eval=FALSE---------------------------------------------------------------
#  login::is_not_logged_in(
#    id = APP_ID,
#    div("This only shows when you are NOT logged in!")
#  )

## -----------------------------------------------------------------------------
password <- "test"
salt <- APP_ID

## -----------------------------------------------------------------------------
password_md5 <- digest::digest(password, algo = 'md5', serialize = FALSE) 

## -----------------------------------------------------------------------------
paste0(salt, password_md5) |> digest::digest(algo = 'sha512', serialize = FALSE) 

## -----------------------------------------------------------------------------
password_md5 <- digest::digest(password, algo = 'md5', serialize = FALSE) 

