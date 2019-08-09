
Import-Module ActiveDirectory
$Admins =@()
$Count = 0
$Domains = (Get-ADforest).domains
$FilePath = "E:\Scripts\Ian\CSV\DA.csv"


foreach($Domain in $Domains)
{
$PDCEmulator = get-addomain -Identity $Domain | Select -expandproperty pdcemulator
$Admins = get-adgroupmember 'Domain Admins' -recursive -server $PDCEmulator | Select -expandproperty Name, DistinguishedName
$Admins | export-csv $FilePath -append -NoTypeInformation

}

