return {
    Lighting = {
        ClockTime = 12, 
        ColorShift_Bottom = Color3.fromRGB(0, 0, 0), 
        FogColor = Color3.fromRGB(192, 192, 192), 
        FogEnd = 100000, 
        FogStart = 0, 
        EnvironmentDiffuseScale = 0, 
        EnvironmentSpecularScale = 1, 
        ExposureCompensation = -0.10000000149011612, 
        GeographicLatitude = 0, 
        Ambient = Color3.fromRGB(140, 196, 249), 
        OutdoorAmbient = Color3.fromRGB(221, 198, 229), 
        ShadowSoftness = 0.20000000298023224, 
        Brightness = 2.25, 
        ColorShift_Top = Color3.fromRGB(255, 215, 121), 
        GlobalShadows = true
    }, 
    Sky = {
        CelestialBodiesShown = true, 
        MoonAngularSize = 11, 
        MoonTextureId = "", 
        SkyboxBk = "rbxassetid://10287764626", 
        SkyboxDn = "rbxassetid://10287766382", 
        SkyboxFt = "rbxassetid://10287764626", 
        SkyboxLf = "rbxassetid://10287763421", 
        SkyboxRt = "rbxassetid://10287764626", 
        SkyboxUp = "rbxassetid://10287767597", 
        StarCount = 3000, 
        SunAngularSize = 0, 
        SunTextureId = "rbxasset://sky/sun.jpg", 
        Name = "SpongebobSky"
    }, 
    Atmosphere = {
        Density = 0.32499998807907104, 
        Offset = 0, 
        Name = "Atmosphere", 
        Color = Color3.fromRGB(93, 101, 255), 
        Decay = Color3.fromRGB(49, 126, 193), 
        Glare = 4, 
        Haze = 2.0999999046325684
    }, 
    PostEffects = {
        Lighting = {
            SunRaysEffect = {
                Name = "SunRays", 
                Enabled = true, 
                Intensity = 0.4000000059604645, 
                Spread = 1
            }, 
            DepthOfFieldEffect = {
                Name = "DepthOfField", 
                Enabled = false, 
                FarIntensity = 0.4320000112056732, 
                FocusDistance = 0, 
                InFocusRadius = 85, 
                NearIntensity = 0.75
            }, 
            ColorCorrectionEffect = {
                Name = "ColorCorrection", 
                Brightness = 0.05000000074505806, 
                Contrast = 0.2150000035762787, 
                Enabled = true, 
                Saturation = 0.20000000298023224, 
                TintColor = Color3.fromRGB(255, 255, 255)
            }, 
            BloomEffect = {
                Name = "Bloom", 
                Enabled = true, 
                Intensity = 1, 
                Size = 29, 
                Threshold = 1.843000054359436
            }
        }, 
        Camera = {}
    }, 
    Clouds = {
        Cover = 0.800000011920929, 
        Density = 0.10000000149011612, 
        Color = Color3.fromRGB(41, 255, 173), 
        Enabled = true
    }
};