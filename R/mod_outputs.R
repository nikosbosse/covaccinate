#' outputs UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_outputs_ui <- function(id){
  ns <- NS(id)
  tagList(
    
    uiOutput(ns("ve_ratio")), 
    br(),
    uiOutput(ns("mortality_a")),
    br(),
    uiOutput(ns("mortality_b")), 
    br(),
    uiOutput(ns("result"))

  )
}
    
#' outputs Server Functions
#'
#' @noRd 
mod_outputs_server <- function(id, inputs){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    

    mortality <- reactiveValues(
      a = NULL, 
      b = NULL
    )
    # 
    # mortality_a <- reactiveVal()
    # mortality_b <- reactiveVal()
    
    observe({
      mortality$a <- mortality_reduction(ar = inputs$ar_group_a, 
                                         ifr = inputs$ifr_group_a, 
                                         ve = (inputs$ve_booster - inputs$ve_first))
      
      mortality$b <- mortality_reduction(inputs$ar_group_b, 
                                         inputs$ifr_group_b, 
                                         (inputs$ve_first))
      
    })

    
    output$ve_ratio <- renderUI(
      HTML(paste("<p style='font-size:20px'> VE1 / (VE2 - VE1): <b>", gain_ratio(inputs$ve_first, inputs$ve_booster)), "</b></p>"))
    
    output$mortality_a <- renderUI(
      HTML(paste("<p style='font-size:20px'>mortality reduction group A: <b>", (mortality$a), "</b></p>"))
    )
    
    output$mortality_b <- renderUI(
      HTML(paste("<p style='font-size:20px'>mortality reduction group B: <b>", mortality$b, "</b></p>"))
    )
    
    output$result <- renderUI(
      HTML(paste("<p style='font-size:30px'>Based on the input parameters, a 'first shot first' vaccination strategy would save <b>", 
                 round(mortality$b/mortality$a, 1), "</b> as many lives as the regular two shot strategy</p>"))
    )

  })
}
    
## To be copied in the UI
# mod_outputs_ui("outputs_ui_1")
    
## To be copied in the server
# mod_outputs_server("outputs_ui_1")
