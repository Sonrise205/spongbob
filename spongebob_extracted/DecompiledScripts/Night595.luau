return {
    Lighting = {
        ClockTime = 11, 
        ColorShift_Bottom = Color3.fromRGB(0, 0, 0), 
        FogColor = Color3.fromRGB(192, 192, 192), 
        FogEnd = 100000, 
        FogStart = 0, 
        EnvironmentDiffuseScale = 0, 
        EnvironmentSpecularScale = 1, 
        ExposureCompensation = -0.10000000149011612, 
        GeographicLatitude = 4, 
        Ambient = Color3.fromRGB(85, 85, 127), 
        OutdoorAmbient = Color3.fromRGB(210, 202, 229), 
        ShadowSoftness = 0.20000000298023224, 
        Brightness = 2.25, 
        ColorShift_Top = Color3.fromRGB(143, 154, 255), 
        GlobalShadows = true
    }, 
    Sky = {
        CelestialBodiesShown = true, 
        MoonAngularSize = 11, 
        MoonTextureId = "", 
        SkyboxBk = "rbxassetid://1233158420", 
        SkyboxDn = "rbxassetid://1233158838", 
        SkyboxFt = "rbxassetid://1233157105", 
        SkyboxLf = "rbxassetid://1233157640", 
        SkyboxRt = "rbxassetid://1233157995", 
        SkyboxUp = "rbxassetid://1233159158", 
        StarCount = 3000, 
        SunAngularSize = 21, 
        SunTextureId = "", 
        Name = "EarthSky"
    }, 
    Atmosphere = {
        Density = 0.4000000059604645, 
        Offset = 0, 
        Name = "Atmosphere", 
        Color = Color3.fromRGB(63, 64, 138), 
        Decay = Color3.fromRGB(115, 121, 157), 
        Glare = 2, 
        Haze = 1.100000023841858
    }, 
    PostEffects = {
        Lighting = {
            BloomEffect = {
                Name = "Bloom", 
                Enabled = true, 
                Intensity = 1, 
                Size = 29, 
                Threshold = 1.843000054359436
            }, 
            ColorCorrectionEffect = {
                Name = "ColorCorrection", 
                Brightness = 0.05000000074505806, 
                Contrast = 0.2150000035762787, 
                Enabled = true, 
                Saturation = 0.20000000298023224, 
                TintColor = Color3.fromRGB(255, 255, 255)
            }, 
            DepthOfFieldEffect = {
                Name = "DepthOfField", 
                Enabled = true, 
                FarIntensity = 0.4320000112056732, 
                FocusDistance = 0, 
                InFocusRadius = 200, 
                NearIntensity = 0.75
            }, 
            SunRaysEffect = {
                Name = "SunRays", 
                Enabled = true, 
                Intensity = 0.10000000149011612, 
                Spread = 1
            }
        }, 
        Camera = {}
    }
};