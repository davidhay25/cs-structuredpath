Instance: ReportBreastResection1
InstanceOf: ReportBreastResection
Title: "Breast resection"
Usage: #example

* status = #final
* code = $example#report-breast-resection
* subject = Reference(johndoe)

* result[+] = Reference(AncillaryEstrogen1)
// this will fail as the slicing is closed * result[+] = Reference(ancillary-progesterone-receptor-1)

