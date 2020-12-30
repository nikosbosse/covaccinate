#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom shinyalert shinyalert useShinyalert
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic 
  inputs <- reactiveValues(
    ve_first = NULL, 
    ve_booster = NULL,
    ifr_group_a = NULL, 
    ifr_group_b = NULL, 
    ar_group_a = NULL, 
    ar_group_b = NULL
  )
  
  shinyalert::shinyalert(title = "Modelling vaccination regimes", 
                         html = TRUE,
                         size = "l",
                         text = HTML("This app is designed to give a rough intuition for when whe should apply one of two different vaccination regimes.</br></br>
                                     In the <b>regular scenario</b>, everyone gets a first shot and then a second shoot after 3-4 weeks. </br></br>
                                     In the <b>first dose first scenario</b>, the second (booster) dose is delayed in order to give more people a first dose. </br></br>
                                     Depending on the overall vulnerability of the person who would receive the booster and the person who would receive the first dose instead, this can be beneficial.</br></br>
                                     The app allows to compare whether it is better to give a person from Group A a second dose or to give a first dose to a person from Group B. You can try different input parameters for the Infection Fatality Rate (the likelihood to die after a preson contracted Covid-19) as well as the Attack Rate (the likelihood to get Covid-19 in a given period). </br></br>"))
  
  mod_inputs_server("inputs", inputs)
  mod_outputs_server("outputs", inputs)
  mod_methods_server("methods")
}
