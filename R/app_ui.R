#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  # app_ui.R
  
  navbarPage("Patient Profile using R/Shiny",
             tabPanel("Demographics",
                      sidebarLayout(
                        sidebarPanel(
                          fileInput("demographics_file", "Choose Demographics File", accept = c(".sas7bdat"))
                        ),
                        mainPanel(
                          tableOutput("demographics_table")
                        )
                      )
             ),
             tabPanel("Vital Signs",
                      sidebarLayout(
                        sidebarPanel(
                          fileInput("vitals_file", "Choose Vital Signs File", accept = c(".sas7bdat")),
                          selectInput("subject_id", "Select Subject", choices = NULL)
                        ),
                        mainPanel(
                          plotOutput("vitals_plot")
                        )
                      )
             ),
             tabPanel("Adverse Events",
                      sidebarLayout(
                        sidebarPanel(
                          fileInput("adverse_events_file", "Choose Adverse Events File", accept = c(".sas7bdat")),
                          selectInput("subject_id_ae", "Select Subject", choices = NULL)
                        ),
                        mainPanel(
                          plotlyOutput("adverse_events_plot")
                        )
                      )
             ),
             tabPanel("Laboratory",
                      sidebarLayout(
                        sidebarPanel(
                          fileInput("laboratory_file", "Choose Laboratory File", accept = c(".sas7bdat")),
                          selectInput("subject_id_lb", "Select Subject", choices = NULL)
                        ),
                        mainPanel(
                          tableOutput("laboratory_table")
                        )
                      )
             )
  )
  # Remove this line to start building your UI
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
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "patient_profileR"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
