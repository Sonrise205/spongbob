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
        OutdoorAmbient = Color3.fromRGB(88, 175, 229), 
        ShadowSoftness = 0.20000000298023224, 
        Brightness = 3, 
        ColorShift_Top = Color3.fromRGB(218, 206, 255), 
        GlobalShadows = true
    }, 
    Sky = {
        CelestialBodiesShown = true, 
        MoonAngularSize = 11, 
        MoonTextureId = "", 
        SkyboxBk = "rbxassetid://104263512374030", 
        SkyboxDn = "rbxassetid://99392227666447", 
        SkyboxFt = "rbxassetid://104263512374030", 
        SkyboxLf = "rbxassetid://71050625069767", 
        SkyboxRt = "rbxassetid://104263512374030", 
        SkyboxUp = "rbxassetid://128452635028615", 
        StarCount = 3000, 
        SunAngularSize = 0, 
        SunTextureId = "rbxasset://sky/sun.jpg", 
        Name = "SpongebobSky"
    }, 
    Atmosphere = {
        Density = 0.5, 
        Offset = 0, 
        Name = "Atmosphere", 
        Color = Color3.fromRGB(218, 188, 255), 
        Decay = Color3.fromRGB(118, 124, 126), 
        Glare = 2, 
        Haze = 2.0999999046325684
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