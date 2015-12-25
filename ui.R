shinyUI(pageWithSidebar(
  headerPanel("Calculate Loan EMI"),
  sidebarPanel(
    numericInput('LnAmt', 'Loan Amount($)', 100000, step = 1000),
    numericInput('Tnr', 'Loan Tenure(years)', 5, step = 1),
    numericInput('Intr', 'Loan Interest Rate(%age pa)', 1, min = 1, step = 0.05)
    ),
  mainPanel(
    h2(verbatimTextOutput(("EmiOut")))
)))