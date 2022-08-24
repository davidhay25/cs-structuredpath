
//profile for Estrogen Receptor
Profile:        ObservationEstrogenReceptor
Parent:         Observation
Id:             observation-estrogen-receptor
Title:          "Estrogen Receptor result"
Description:    "An observation that represents an Estrogen Receptor result"

* ^url = "http://canshare.com/fhir/StructureDefinition/estrogen-receptor"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Estrogen Receptor result</div>"

//required and must support elements
* subject 1..1 MS

//fix the code value
* code = $example#2222 
* effective[x] only dateTime
* value[x] only CodeableConcept

* valueCodeableConcept from $er-vs (required)

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


//Terminology - Estrogen receptor status
ValueSet : Estrogen_receptor_result
Id: estrogen-receptor-result
Title: "Estrogen Receptor result"
Description:  "Possible values for Estrogen Receptor result"

* ^url = $er-vs
* codes from system $er-cs


CodeSystem:  Estrogen_receptor_result
Id: estrogen-receptor-result
Title: "Estrogen Receptor result"
Description:  "Estrogen Receptor result"

* ^url = $er-cs

* #positive "Positive" "Positive"
* #negative "Negative" "Negative"

/*
//Terminology - Average Staining Intensity
ValueSet : Average_staining_intensity
Id: average-staining-intensity
Title: "Average Staining Intensity"
Description:  "Possible values for Average Staining Intensity"

* ^url = $si-vs
* codes from system $si-cs


CodeSystem:  Average_staining_intensity
Id: average-staining-intensity
Title: "Average Staining Intensity"
Description:  "Average Staining Intensity"

* ^url = $si-cs

* #weak "weak" "Weak"
* #moderate "Moderate" "Moderate"
* #strong "Strong"
* #none "No Staining"

*/


//Examples
Instance: ancillary-estrogen-receptor-1
InstanceOf: ObservationEstrogenReceptor
Title: "Estrogen receptor example"
Usage: #example

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Estrogen receptor example</div>"
* text.status = #generated

* status = #final
* subject = Reference(johndoe)
* code = $example#2222 "Estrogen receptor status"
* valueCodeableConcept = $er-cs#positive

* component[+].code = $example#percent  //percentage stained
* component[=].valueInteger = 50            //50 % stained

* component[+].code = $example#stain //average staining intensity
* component[=].valueCodeableConcept = $si-cs#strong
