local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0:WaitForChild("RNGRolls"));
return {
    ForSale = false, 
    ShopOrder = 99999, 
    Cost = {
        currencyName = "Gems", 
        price = 999999999999999
    }, 
    Pool = {
        RaritiesPool = {
            Secret = {
                weight = 100, 
                shinyWeight = 0.025, 
                megaWeight = 0.0025, 
                megaShinyWeight = 0.00175
            }
        }, 
        UnitsPool = {
            Rare = {
                {
                    type = "Unit", 
                    name = "BandSquidward", 
                    weight = 50
                }, 
                {
                    type = "Unit", 
                    name = "BandSandy", 
                    weight = 50
                }
            }, 
            Epic = {
                {
                    type = "Unit", 
                    name = "BandPatrick", 
                    weight = 50
                }, 
                {
                    type = "Unit", 
                    name = "BandPlankton", 
                    weight = 50
                }
            }, 
            Legendary = {
                {
                    type = "Unit", 
                    name = "BandPearl", 
                    weight = 50
                }, 
                {
                    type = "Unit", 
                    name = "BandSpongebob", 
                    weight = 50
                }
            }, 
            Mythic = {
                {
                    type = "Unit", 
                    name = "BandMrsPuff", 
                    weight = 50
                }, 
                {
                    type = "Unit", 
                    name = "BandMrKrabs", 
                    weight = 50
                }
            }
        }
    }
};