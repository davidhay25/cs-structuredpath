
### Description

Ancillary studies are tests that are performed by the laboratory on specimens removed from the patient.

It is anticipated that the tests will be received by CanShare as described by the Structured Pathology IG

Ancillary studies are all represented as Observation resources with specific profiles for
each test as listed in the table below.

There is a consistent pattern used in the profiles.

* Observation.code is fixed to a value that identifies the type of test
* Observation.value[x] is constrained to the specific test datatype
* If the test was not performed, the reason why it wasn't is respresented in Observation.dataAbsentReason. The profile binds to the set of reasons why not. If this is an 'other' reason, then the dataAbsentReason.text element is used, with no coding.
* Where there are other components of the Observation (like staining intensity) then Observation.component has those values. Each profile constrains the dataType
* Observation.note is used for any additional notes made by the pathologist.

There are a number of references that each Observation will have.

* Observation.subject is a reference to the Patient. This is required.
* Observation.specimen is a reference to the specimen that the Observation describes (only 1 per specimen).

<!--Elements that are 'required' to be present are marked as 'Must Support' other then being marked as required.-->

### Coding

The following SNOMED codes are required.

* Each profile needs a code for Observation.code that identifies the 'type' of Observation. This will be an observable entity
* If the value of the observation is coded (.valueCodeableConcept) then there will be a bound
ValueSet that has the set of permissable values. Each of these needs a SNOMED code.
* The Observation.dataAbsentReason is also bound to a set of permissable values which require a SNOMED code.



<table class="table table-bordered">

    <tr>
        <th>Study type</th><th>Description</th>
    </tr>

    <tr>
        <td><a href="StructureDefinition-observation-her2.html">HER2</a></td>
        <td>Description here</td>
    </tr>
    <tr>
        <td><a href="StructureDefinition-observation-egfr.html">EGFR</a></td>
        <td>Description here</td>
    </tr>

    <tr>
        <td><a href="StructureDefinition-observation-estrogen-receptor.html">Estrogen receptor</a></td>
        <td>Description here</td>
    </tr>

    <tr>
        <td><a href="StructureDefinition-observation-progesterone-receptor.html">Progesterone receptor</a></td>
        <td>Description here</td>
    </tr>

    <tr>
        <td><a href="StructureDefinition-observation-fish.html">FISH</a></td>
        <td>Description here</td>
    </tr>

</table>