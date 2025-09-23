Param(
  [string]$ResourceGroup = "propertyManagerAutomation",
  [string]$ParametersFile = "./appsettings.json",
  [switch]$Create
)

# Normaliza ruta relativa a absoluta para evitar problemas de parseo
$ParametersPath = Resolve-Path -Path $ParametersFile

Write-Host "Using RG=$ResourceGroup, Parameters=$ParametersPath"

# What-if (por defecto)
az deployment group what-if `
  --name pipe-whatif `
  --resource-group $ResourceGroup `
  --template-file ./main.bicep `
  --parameters $ParametersPath

if ($Create) {
  az deployment group create `
    --name pipe-deploy `
    --resource-group $ResourceGroup `
    --template-file ./main.bicep `
    --parameters $ParametersPath
}
