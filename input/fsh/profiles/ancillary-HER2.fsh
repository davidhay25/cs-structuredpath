Profile:        ObservationHER2
Parent:         Observation
Id:             observation-her2
Title:          "HER2 result"
Description:    "An observation that represents a HER2 result"

* ^url = "http://canshare.com/fhir/StructureDefinition/observation-her2"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>HER2 result</div>"

//required and must support elements
* subject 1..1 MS


//fix the code value
* code = $snomed#5555 
* effective[x] only dateTime
* value[x] only CodeableConcept
* valueCodeableConcept from $her2-vs (required)

//Terminology - her2 result
ValueSet : Her2_result
Id: her2-result
Title: "HER2 result"
Description:  "HER2 result"

* ^url = $her2-vs
* codes from system $her2-cs


CodeSystem:  Her2_result
Id: her2-result
Title: "HER2 result"
Description:  "HER2 result"

* ^url = $her2-cs

* #ihc0 "HER2 IHC 0: Negative" 
* #ihc1 "HER2 IHC 1+: Negative"
* #ihc2 "HER2 IHC 2+: Equivocal" 
* #ihc3 "HER2 IHC 3+"
* #positive "Positive"

//Examples
Instance: ancillary-HER2-1
InstanceOf: ObservationHER2
Title: "HER2 report example"
Usage: #example

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>HER2 report example</div>"
* text.status = #generated

* status = #final
* subject = Reference(johndoe)
* code = $snomed#5555 "HER2 study"
* valueCodeableConcept = $her2-cs#ihc0