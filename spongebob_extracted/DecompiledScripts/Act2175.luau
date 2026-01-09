return {
    Lighting = {
        ClockTime = 12, 
        ColorShift_Bottom = Color3.fromRGB(0, 0, 0), 
        FogColor = Color3.fromRGB(192, 192, 192), 
        FogEnd = 100000, 
        FogStart = 0, 
        EnvironmentDiffuseScale = 0, 
        EnvironmentSpecularScale = 1, 
        ExposureCompensation = -0.30000001192092896, 
        GeographicLatitude = -65, 
        Ambient = Color3.fromRGB(148, 121, 83), 
        OutdoorAmbient = Color3.fromRGB(33, 96, 99), 
        ShadowSoftness = 0.20000000298023224, 
        Brightness = 0.4000000059604645, 
        ColorShift_Top = Color3.fromRGB(154, 220, 84), 
        GlobalShadows = true
    }, 
    Sky = {
        CelestialBodiesShown = true, 
        MoonAngularSize = 11, 
        MoonTextureId = "rbxassetid://9343303339", 
        SkyboxBk = "rbxassetid://104263512374030", 
        SkyboxDn = "rbxassetid://99392227666447", 
        SkyboxFt = "rbxassetid://104263512374030", 
        SkyboxLf = "rbxassetid://71050625069767", 
        SkyboxRt = "rbxassetid://104263512374030", 
        SkyboxUp = "rbxassetid://128452635028615", 
        StarCount = 3000, 
        SunAngularSize = 20, 
        SunTextureId = "rbxassetid://7193820552", 
        Name = "SpongebobSky"
    }, 
    Atmosphere = {
        Density = 0.4000000059604645, 
        Offset = 0, 
        Name = "Atmosphere", 
        Color = Color3.fromRGB(42, 99, 30), 
        Decay = Color3.fromRGB(103, 134, 78), 
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
                Brightness = -0.02500000037252903, 
                Contrast = 0.30000001192092896, 
                Enabled = true, 
                Saturation = -0.30000001192092896, 
                TintColor = Color3.fromRGB(254, 255, 235)
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
    }, 
    Clouds = {
        Cover = 0.5360000133514404, 
        Density = 0.10000000149011612, 
        Color = Color3.fromRGB(47, 247, 121), 
        Enabled = true
    }
};