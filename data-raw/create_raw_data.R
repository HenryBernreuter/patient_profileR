library(haven)
library(data.table)

# Create dummy data for DM (Demographics)
DM <- data.table(
  USUBJID = paste0("ID", 1:10),
  AGE = sample(20:80, 10, replace = TRUE),
  SEX = sample(c("M", "F"), 10, replace = TRUE),
  RACE = sample(c("White", "Black", "Asian", "Other"), 10, replace = TRUE)
)

# Create dummy data for AE (Adverse Events)
AE <- data.table(
  USUBJID = rep(paste0("ID", 1:10), each = 2),
  AETERM = sample(c("Headache", "Nausea", "Fatigue", "Dizziness"), 20, replace = TRUE),
  AESTDTC = as.Date('2023-01-01') + sample(0:100, 20, replace = TRUE),
  AEENDTC = as.Date('2023-01-01') + sample(101:200, 20, replace = TRUE),
  AESTDY = sample(1:100, 20, replace = TRUE),
  AEENDY = sample(101:200, 20, replace = TRUE)
)

# Create dummy data for LB (Laboratory)
LB <- data.table(
  USUBJID = rep(paste0("ID", 1:10), each = 2),
  LBTEST = sample(c("Hemoglobin", "Platelets", "WBC", "RBC"), 20, replace = TRUE),
  LBORRES = sample(1:10, 20, replace = TRUE),
  LBDTC = as.Date('2023-01-01') + sample(0:100, 20, replace = TRUE)
)

# Create dummy data for VS (Vital Signs)
VS <- data.table(
  USUBJID = rep(paste0("ID", 1:10), each = 2),
  VSTEST = sample(c("Systolic Blood Pressure", "Diastolic Blood Pressure", "Heart Rate", "Temperature"), 20, replace = TRUE),
  VSORRES = sample(60:200, 20, replace = TRUE),
  VSDTC = as.Date('2023-01-01') + sample(0:100, 20, replace = TRUE)
)

# Save as .sas7bdat files
write_sas(DM, "data-raw/DM.sas7bdat")
write_sas(AE, "data-raw/AE.sas7bdat")
write_sas(LB, "data-raw/LB.sas7bdat")
write_sas(VS, "data-raw/VS.sas7bdat")

