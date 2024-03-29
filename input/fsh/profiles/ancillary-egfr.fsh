//profile for EGFR result
Profile:        ObservationEGFR
Parent:         Observation
Id:             observation-egfr
Title:          "EGFR score"
Description:    "An observation that represents an EGFR (epidermal growth factor receptor) result"

* ^url = "http://canshare.com/fhir/StructureDefinition/observation-egfr"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>EGFR result</div>"

* ^keyword = $strucpath#ancillary
//required and must support elements
* subject 1..1 MS
* dataAbsentReason 0..1 MS

//fix the code value
* code = $example#1111 
* effective[x] only dateTime
* value[x] only CodeableConcept
* valueCodeableConcept from $egfr-vs (required)

//ValueSets
ValueSet : EGFR_result
Id: egfr-result
Title: "EGFR result"
Description:  "Possible values for EGFR (epidermal growth factor receptor)"

* ^url = $egfr-vs
* codes from system $egfr-cs


CodeSystem:  EGFR_result
Id: egfr-result
Title: "EGFR result"
Description:  "EGFR result"

* ^url = $egfr-cs

* #present "Present" "Mutation present"
* #absent "Absent" "Mutation absent"
* #indeterminate "Indeterminate" "Unable to determine"


// ------------    examples
Instance: ancillary-egfr-not-performed
InstanceOf: ObservationEGFR
Title: "EGFR not performed"
Usage: #example

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>EGFR not performed</div>"
* text.status = #generated

* status = #final
* subject = Reference(johndoe)
* code = $example#1111 "EGFR"
* dataAbsentReason = $dar#not-performed
* note.text = "Insufficent material"

Instance: ancillary-egfr-present
InstanceOf: ObservationEGFR
Title: "EGFR mutation present"
Usage: #example

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>EGFR present</div>"
* text.status = #generated

* status = #final
* subject = Reference(johndoe)
* code = $example#1111 "EGFR"
* valueCodeableConcept = $egfr-cs#present

/*
//this should fail
Instance: ancillary-egfr-fail
InstanceOf: ObservationEGFR
Title: "EGFR mutation present"
Usage: #example

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>EGFR present</div>"
* text.status = #generated

* status = #final
* subject = Reference(johndoe)
* code = $snomed#xxxx "EGFR"   //<--- wrong code
* valueCodeableConcept = $egfr-cs#present

*/