//profile for Estrogen Receptor
Profile:        ReportBreastResection
Parent:         DiagnosticReport
Id:             report-breast-resection
Title:          "Breast resection report"
Description:    "A profile on DiagnosticReport for breast resection reports"

* ^url = "http://canshare.com/fhir/StructureDefinition/report-breast-resection"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Breast resection report</div>"

//https://chat.fhir.org/#narrow/stream/215610-shorthand/topic/slicing.20.20by.20profile


//add the potential result types for this kind of report
* result ^slicing.discriminator.type = #profile
* result ^slicing.discriminator.path = "$this.resolve()"
* result ^slicing.rules = #closed    //just for testing

* result contains
    estrogen 1..1 MS   //just for testing ATM

* result[estrogen] only Reference(ObservationEstrogenReceptor)


