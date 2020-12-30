#' methods UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_methods_ui <- function(id){
  ns <- NS(id)
  tagList(
    uiOutput(ns("methods"))
 
  )
}
    
#' methods Server Functions
#'
#' @noRd 
mod_methods_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    output$methods <- renderUI(
      HTML(
        "<b>Person in Group A</b>: Has already received their first shot </br>
        <b>Person in Group B</b>: Has not received a vaccine question. </br></br>
        To assess whether we we should give the vaccine to the person in Group A or the one in Group B, we can look at </br>
        <ul>
        <li>VE1, the vaccine effectiveness after the first shot</li>
        <li>VE2, the vaccine effectiveness after the booster shot</li>
        <li>VE_additional = VE2 - VE1, the difference in effectiveness gained from the booster</li>
        <li>VE1 / (VE2 - VE1), the ratio between the effectiveness gain for a newly vaccinated person and the effectiveness gain from a booster</li>
        <li>The reduction in mortality, calculated as IFR * AR * VE (infection fatality rate times attack rate times vaccine effectiveness</li>
        </ul> 
        </br>
        The mortality reduction gained from the booster given to a person in Group A is calculated as IFR * AR * (VE2 - VE1). 
        </br>
        The mortality reduction gained from the first vaccine given to a person in Group B is calculated as IFR * AR * VE1. 
        </br></br>
        Both reduction measures are compared by taking the ratio of the reduction gained from the first dose over the reduction gained from the booster.
        </br></br>")
    )
 
  })
}
    
## To be copied in the UI
# mod_methods_ui("methods_ui_1")
    
## To be copied in the server
# mod_methods_server("methods_ui_1")
