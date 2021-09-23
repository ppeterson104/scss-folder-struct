#Build SCSS Folder / File Structure

Function Get-Folder($initialDirectory="") {

[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")|Out-Null

$folderName = New-Object System.Windows.Forms.FolderBrowserDialog
$folderName.Description = "Select your root project folder"
$folderName.RootFolder = "MyComputer"
$folderName.SelectedPath = $initialDirectory

if ($folderName.ShowDialog() -eq "OK") {

$folder += $folderName.SelectedPath

}

return $folder

}

Function Create-DirectoryStruct($rootFolder) {

<#

Create the directory structure and files for SASS/SCSS

#>

#Folder vars

$sassFolder = "$rootFolder\sass"
$abstracts = "$sassFolder\abstracts"
$base = "$sassFolder\base"
$components = "$sassFolder\components"
$layout = "$sassFolder\layout"
$pages = "$sassFolder\pages"
$themes = "$sassFolder\themes"
$vendor = "$sassFolder\vendor"

#File vars

$_functions = "_functions.scss"
$_home = "_home.scss"
$_mixins = "_mixins.scss"
$_variables = "_variables.scss"
$_animations = "_animations.scss"
$_base = "_base.scss"
$_typography = "_typography.scss"
$_utilities = "_utilities.scss"
$main = "main.scss"

#Import strings

$importValues = @("@Import ""base/base"";", "@Import ""base/animations"";", "@Import ""base/typography"";", "@Import ""base/utilites"";", "@Import ""abstracts/functions"";",
"@Import ""abstracts/mixins"";", "@Import ""abstracts/variables"";", "@Import ""pages/home"";")


#Create folders

if (!(Test-Path -Path "$sassFolder")) {

mkdir -Path "$rootFolder\sass" | Out-Null

} 

if (!(Test-Path -Path "$abstracts")) { 

mkdir -Path "$abstracts" | Out-Null

}

if (!(Test-Path "$base")) {

mkdir -Path "$base" | Out-Null

}

if (!(Test-Path "$components")) {

mkdir -Path "$components" | Out-Null

} 

if (!(Test-Path "$layout")) {

mkdir -Path "$layout" | Out-Null

} 

if (!(Test-Path "$pages")) {

mkdir -Path "$pages" | Out-Null

} 

if (!(Test-Path "$themes")) {

mkdir -Path "$themes" | Out-Null

}

if (!(Test-Path "$vendor")) {

mkdir -Path "$vendor" | Out-Null

}

#Create files

if (!(Test-Path -Path "$sassFolder\$main")) {

New-Item -Path "$sassFolder\$main" | Out-Null

ForEach($value in $importValues) {

Add-Content -Path "$sassFolder\$main" -Value $value

}


} else {

#Check for import content, and if not there, we'll add it:

$data = Get-Content "$sassFolder\$main"

ForEach($value in $importValues) {

if (!($data -match $value)){

"$value`n" + (Get-Content "$sassFolder\$main" | Out-String).TrimEnd() | Set-Content "$sassFolder\$main"

}

}

}

if (!(Test-Path -Path "$abstracts\$_functions")) {

New-Item -Path $abstracts -Name $_functions | Out-Null

}

if (!(Test-Path -Path "$abstracts\$_mixins")) {

New-Item -Path $abstracts -Name $_mixins | Out-Null

}

if (!(Test-Path -Path "$abstracts\$_variables")) {

New-Item -Path $abstracts -Name $_variables | Out-Null

}

if (!(Test-Path -Path "$base\$_animations")) {

New-Item -Path $base -Name $_animations | Out-Null

}

if (!(Test-Path -Path "$base\$_base")) {

New-Item -Path $base -Name $_base | Out-Null

}

if (!(Test-Path -Path "$base\$_typography")) {

New-Item -Path $base -Name $_typography | Out-Null

}

if (!(Test-Path -Path "$base\$_utilities")) {

New-Item -Path $base -Name $_utilities | Out-Null

}

if (!(Test-Path -Path "$pages\$_home")) {

New-Item -Path $pages -Name $_home | Out-Null

}

}

Create-DirectoryStruct(Get-Folder)




