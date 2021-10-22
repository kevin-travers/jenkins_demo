variable "requried_tags"  {
    default = {
        "Name"                  = "S3 bucket"
        "Environment"           = "uat"
        "Business_Unit"         = "viacomcbs technology"
        "Business_Unit_Division"= "global media operations"
        "Sub-BU_Division"       = "coe"
        "Application"           = "jenkins"
        "Financial_Owner_Name"  = "Kevin Travers"
        "Financial_Owner_E-mail"= "ktravers@cbs.com"
        "Technical_Team_Owner"  = "Kevin Travers"
        "Technical_Owner_Name"  = "Kevin Travers"
        "Technical_Owner_E-mail"= "ktravers@cbs.com"
        "Service"               = "storage"
        "Category"              = "infrastructure"
        "Stack"                 = "terraform"
    }
} 

variable "region" {
  default = "us-east-1"
}