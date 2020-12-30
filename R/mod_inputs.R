#' inputs UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_inputs_ui <- function(id){
  ns <- NS(id)
  tagList(
    p("Vaccine effectiveness"),
    fluidRow(column(6, 
                    shiny::sliderInput(inputId = ns("ve_booster"), 
                                       label = "VE after two shots (booster)",
                                       value = 0.92,
                                       min = 0.5, max = 1)), 
             column(6, 
                    shiny::sliderInput(inputId = ns("ve_first"),
                                       label = "VE after first shot",
                                       value = 0.72,
                                       min = 0.5, max = 1))), 
    br(),
    br(),
    p("Baseline Infection Fatality Rate"),
    fluidRow(column(6, 
                    shiny::sliderInput(inputId = ns("ifr_group_a"), 
                                       label = "IFR Group A (after first shot)",
                                       value = 0.05,
                                       min = 0, max = 0.2)), 
             column(6, 
                    shiny::sliderInput(inputId = ns("ifr_group_b"), 
                                       label = "IFR Group B (unvaccinated)",
                                       value = 0.025,
                                       min = 0, max = 0.2))),
    br(),
    br(),
    p("Attack Rate (represents infection probability)"),
    fluidRow(column(6, 
                    shiny::sliderInput(inputId = ns("ar_group_a"), 
                                       label = "Attack Rate Group A",
                                       value = 0.18,
                                       min = 0, max = 1)), 
             column(6, 
                    shiny::sliderInput(inputId = ns("ar_group_b"), 
                                       label = "Attacke rate Group B",
                                       value = 0.15,
                                       min = 0, max = 1)))
    
  )
}
    
#' inputs Server Functions
#'
#' @noRd 
mod_inputs_server <- function(id, inputs){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    observeEvent(input$ve_first, {
      inputs$ve_first <- input$ve_first
    })
    observeEvent(input$ve_booster, {
      inputs$ve_booster <- input$ve_booster
    })
    observeEvent(input$ifr_group_a, {
      inputs$ifr_group_a <- input$ifr_group_a
    })
    observeEvent(input$ifr_group_b, {
      inputs$ifr_group_b <- input$ifr_group_b
    })
    observeEvent(input$ar_group_a, {
      inputs$ar_group_a <- input$ar_group_a
    })
    observeEvent(input$ar_group_b, {
      inputs$ar_group_b <- input$ar_group_b
    })
  })
}
    
## To be copied in the UI
# mod_inputs_ui("inputs_ui_1")
    
## To be copied in the server
# mod_inputs_server("inputs_ui_1")
