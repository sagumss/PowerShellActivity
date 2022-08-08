#Variables
$pathToJsonFile = "C:\Pshell\product.json"
$pathToOutputFile = "C:\Pshell\ProductOutput.csv"

#Get content
((Get-Content -Path $pathToJsonFile) | ConvertFrom-Json) | ForEach-Object {
$Products = $_.Products
$ProductName = $_.ProductName
$Price = $_.Price
$Products += $_.$Products| ForEach-Object {
    [PSCustomObject]    @{
        'ProductName' = $ProductName
        'Price' = $Price
    }
}

}
#Export CSV
$Products | Export-Csv $pathToOutputFile -NoTypeInformation
