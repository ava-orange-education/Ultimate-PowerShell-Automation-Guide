function Get-FruitInfo {
[CmdletBinding()]

    param (
        [string]$Fruit,
        [switch]$IncludeColor,
        [switch]$IncludeTaste
    )

    $fruitInfo = "Information for $Fruit"

    switch ($Fruit) {
        "Apple" {
            $fruitInfo += "`nType: Tree Fruit"
            if ($IncludeColor) { $fruitInfo += "`nColor: Red or Green" }
            if ($IncludeTaste) { $fruitInfo += "`nTaste: Sweet" }
        }
        "Banana" {
            $fruitInfo += "`nType: Tropical Fruit"
            if ($IncludeColor) { $fruitInfo += "`nColor: Yellow" }
            if ($IncludeTaste) { $fruitInfo += "`nTaste: Sweet and Creamy" }
        }
        "Orange" {
            $fruitInfo += "`nType: Citrus Fruit"
            if ($IncludeColor) { $fruitInfo += "`nColor: Orange" }
            if ($IncludeTaste) { $fruitInfo += "`nTaste: Citrusy" }
        }
        default {
            $fruitInfo += "`nSorry, information not available for $Fruit."
        }
    }

    Write-Host $fruitInfo
}
# Example 1: Get information for an Apple with color and taste details
Get-FruitInfo -Fruit "Apple" -IncludeColor -IncludeTaste

# Example 2: Get information for a Banana with color details
Get-FruitInfo -Fruit "Banana" -IncludeColor

# Example 3: Get information for an Orange with taste details
Get-FruitInfo -Fruit "Orange" -IncludeTaste

# Example 4: Try to get information for an unknown fruit
Get-FruitInfo -Fruit "Grape"





