Profile:        ObservationFISH
Parent:         Observation
Id:             observation-fish
Title:          "FISH studies"
Description:    "fluorescence in situ hybridisation (FISH) studies performed"

* ^url = "http://canshare.com/fhir/StructureDefinition/observation-fish"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>FISH studies</div>"

//required and must support elements
* subject 1..1 MS
* dataAbsentReason 0..1 MS


//fix the code value
* code = $example#6666
* effective[x] only dateTime
* value[x] only CodeableConcept
* valueCodeableConcept from $fish-vs (required)

//Terminology - her2 result
ValueSet : Fish_result
Id: fish-result
Title: "FISH result"
Description:  "FISH result"

* ^url = $fish-vs
* codes from system $fish-cs

CodeSystem:  Fish_result
Id: fish-result
Title: "FISH result"
Description:  "FISH result"

* ^url = $fish-cs

* #borderline "Borderline"
* #notamp "HER2 FISH Not Amplified"
* #amp "HER2 FISH Amplified"


//Examples
Instance: ancillary-fish-1
InstanceOf: ObservationFISH
Title: "FISH report example"
Usage: #example

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>FISH report example</div>"
* text.status = #generated

* status = #final
* subject = Reference(johndoe)
* code = $example#6666 "FISH study"
* valueCodeableConcept = $fish-cs#amp
