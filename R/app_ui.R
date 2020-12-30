#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinydashboard
#' @noRd
app_ui <- function(request) {
  tagList(
    
    shinyalert::useShinyalert(), 
    
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic 
    
    dashboardPage(
      dashboardHeader(title = "Mortality Reduction First Dose vs. Booster Vaccination", 
                      disable = FALSE),
      dashboardSidebar(disable = TRUE),
      dashboardBody(
        
        h1("Estimating the Mortality Reduction of a Regular vs. a First-Dose-First Vaccination Strategy"),
        br(),
        
        shinydashboard::box(mod_inputs_ui("inputs"), 
                            title = "Input Parameters", 
                            status = "primary",
                            solidHeader = TRUE),
        shinydashboard::box(mod_outputs_ui("outputs"), 
                            status = "primary",
                            title = "Estimated mortality",
                            solidHeader = TRUE),
        shinydashboard::box(mod_methods_ui("methods"), 
                            title = "Methods",
                            status = "primary",
                            solidHeader = TRUE,
                            width = 12)
      )
      
      
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'covaccinate'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

