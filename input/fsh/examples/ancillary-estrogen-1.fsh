Instance: AncillaryEstrogen1
InstanceOf: ObservationEstrogenReceptor
Title: "Ancillary estrogen result"
Usage: #example

* status = #final
* effectiveDateTime = "2020-01-01"
* subject = Reference(johndoe)
* code = $example#2222 

* valueCodeableConcept = $er-cs#positive


* component[percentStained].code = $example#percent 
* component[percentStained].valueInteger = 80

