
//profile for Progesterone Receptor
Profile:        ObservationProgesteroneReceptor
Parent:         Observation
Id:             observation-progesterone-receptor
Title:          "Progesterone Receptor result"
Description:    "An observation that represents an Progesterone Receptor result"

* ^url = "http://canshare.com/fhir/StructureDefinition/progesterone-receptor"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Progesterone Receptor result</div>"

//required and must support elements
* subject 1..1 MS
* dataAbsentReason 0..1 MS

//fix the code value
* code = $example#3333
* effective[x] only dateTime
* value[x] only CodeableConcept

* valueCodeableConcept from $prog-vs (required)

* dataAbsentReason from $reason-not-performed-vs

//slice the Observation component
// 2 components - % stained & average staining intensity

* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.ordered = false   // can be omitted, since false is the default
* component ^slicing.description = "Slice based on the component.code pattern"

* component contains
    percentStained 1..1 MS and
    avgStainingIntensity 1..1 MS

* component[percentStained].code = $example#percent  
* component[percentStained].value[x] only integer


* component[avgStainingIntensity].code = $example#stain 
* component[avgStainingIntensity].value[x] only CodeableConcept
* component[avgStainingIntensity].valueCodeableConcept from $si-vs (required)


//Terminology - Progesterone receptor status
ValueSet : Progesterone_receptor_result
Id: progesterone-receptor-result
Title: "Progesterone Receptor result"
Description:  "Possible values for Progesterone Receptor result"

* ^url = $prog-vs
* codes from system $prog-cs


CodeSystem:  Progesterone_receptor_result
Id: progesterone-receptor-result
Title: "Progesterone Receptor result"
Description:  "Progesterone Receptor result"

* ^url = $prog-cs

* #positive "Positive" "Positive"
* #negative "Negative" "Negative"






//Examples
Instance: ancillary-progesterone-receptor-1
InstanceOf: ObservationProgesteroneReceptor
Title: "Progesterone receptor example"
Usage: #example

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Progesterone receptor example</div>"
* text.status = #generated

* status = #final
* subject = Reference(johndoe)
* code = $example#3333 "Progesterone receptor status"
* valueCodeableConcept = $prog-cs#positive

* component[+].code = $example#percent  //percentage stained
* component[=].valueInteger = 50            //50 % stained

* component[+].code = $example#stain //average staining intensity
* component[=].valueCodeableConcept = $si-cs#strong
