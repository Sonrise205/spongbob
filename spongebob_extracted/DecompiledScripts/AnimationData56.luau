local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.RailUtil);
local v2 = {
    Enemies = {
        MasterUdon = {
            Walk = {
                AnimationId = "rbxassetid://128901565486896"
            }, 
            Attack = {
                AnimationId = "rbxassetid://98302863349554"
            }, 
            Stunned = {
                AnimationId = "rbxassetid://90542900386385"
            }, 
            Death = {
                AnimationId = "rbxassetid://115072508186694"
            }, 
            Idle = {
                AnimationId = "rbxassetid://115459200276065"
            }
        }, 
        TheAppetizer = {
            Walk = {
                AnimationId = "rbxassetid://94100959661757"
            }, 
            Attack = {
                AnimationId = "rbxassetid://106797764055192"
            }, 
            Stunned = {
                AnimationId = "rbxassetid://89515078857388"
            }, 
            Death = {
                AnimationId = "rbxassetid://102381720089808"
            }, 
            Idle = {
                AnimationId = "rbxassetid://113633140056014"
            }
        }, 
        TattletaleStrangler = {
            Walk = {
                AnimationId = "rbxassetid://87992738306743"
            }, 
            Attack = {
                AnimationId = "rbxassetid://86903748957375"
            }, 
            Stunned = {
                AnimationId = "rbxassetid://100714058371901"
            }, 
            Death = {
                AnimationId = "rbxassetid://76535096724232"
            }, 
            Idle = {
                AnimationId = "rbxassetid://104506009848354"
            }
        }, 
        KimonoAnchovy = {
            Walk = {
                AnimationId = "rbxassetid://97299151397268"
            }, 
            Stunned = {
                AnimationId = "rbxassetid://135285472949437"
            }, 
            Death = {
                AnimationId = "rbxassetid://134735475550011"
            }, 
            Attack = {
                AnimationId = {
                    "rbxassetid://129090651205847", 
                    "rbxassetid://115691991972707"
                }
            }, 
            Idle = {
                AnimationId = "rbxassetid://127374943914922"
            }
        }, 
        Rrarrg = {
            Walk = {
                AnimationId = "rbxassetid://74618685277176"
            }, 
            Attack = {
                AnimationId = "rbxassetid://83155406637534"
            }, 
            Stunned = {
                AnimationId = "rbxassetid://74932609375659"
            }, 
            Death = {
                AnimationId = "rbxassetid://96595535590175"
            }, 
            Idle = {
                AnimationId = "rbxassetid://80195521405598"
            }
        }, 
        SquidasaurusRex = {
            Walk = {
                AnimationId = "rbxassetid://87282870148934"
            }, 
            Attack = {
                AnimationId = "rbxassetid://93752479011310"
            }, 
            Stunned = {
                AnimationId = "rbxassetid://110866652585742"
            }, 
            Death = {
                AnimationId = "rbxassetid://139429179849512"
            }, 
            Idle = {
                AnimationId = "rbxassetid://89207159408503"
            }
        }, 
        TheTickler = {
            Walk = {
                AnimationId = "rbxassetid://123218091668999"
            }, 
            Attack = {
                AnimationId = "rbxassetid://93703348247523"
            }, 
            Stunned = {
                AnimationId = "rbxassetid://122439207493869"
            }, 
            Death = {
                AnimationId = "rbxassetid://114922864287583"
            }, 
            Idle = {
                AnimationId = "rbxassetid://123203759056406"
            }
        }, 
        LippCervas = {
            Walk = {
                AnimationId = "rbxassetid://104191234836182"
            }, 
            Attack = {
                AnimationId = "rbxassetid://82090406787506"
            }, 
            Stunned = {
                AnimationId = "rbxassetid://135933988310545"
            }, 
            Death = {
                AnimationId = "rbxassetid://129474758885588"
            }, 
            Idle = {
                AnimationId = "rbxassetid://119684786087780"
            }
        }, 
        KarateAssassin = {
            Walk = {
                AnimationId = "rbxassetid://70913443564250"
            }, 
            Attack = {
                AnimationId = "rbxassetid://109753184677642"
            }, 
            Stunned = {
                AnimationId = "rbxassetid://78074195011953"
            }, 
            Death = {
                AnimationId = "rbxassetid://94525367737549"
            }, 
            Idle = {
                AnimationId = "rbxassetid://107755041711337"
            }
        }, 
        BreakfastMonster = {
            Walk = {
                AnimationId = "rbxassetid://136313069247236"
            }, 
            Attack = {
                AnimationId = "rbxassetid://105886929074360"
            }, 
            Stunned = {
                AnimationId = "rbxassetid://117108653240456"
            }, 
            Death = {
                AnimationId = "rbxassetid://71429506259680"
            }, 
            Idle = {
                AnimationId = "rbxassetid://128576664453624"
            }
        }, 
        FilthyPhil = {
            Walk = {
                AnimationId = "rbxassetid://136153545956694"
            }, 
            Attack = {
                AnimationId = "rbxassetid://118223874367681"
            }, 
            Stunned = {
                AnimationId = "rbxassetid://87819623967167"
            }, 
            Death = {
                AnimationId = "rbxassetid://129007390024393"
            }, 
            Idle = {
                AnimationId = "rbxassetid://80795864101599"
            }
        }, 
        EliteGuard = {
            Walk = {
                AnimationId = "rbxassetid://75496831555122"
            }, 
            Attack = {
                AnimationId = "rbxassetid://103702518917687"
            }, 
            Stunned = {
                AnimationId = "rbxassetid://126977477737711"
            }, 
            Death = {
                AnimationId = "rbxassetid://93775063360791"
            }, 
            Idle = {
                AnimationId = "rbxassetid://103451937844624"
            }
        }, 
        HibernationSandy = {
            Walk = {
                AnimationId = "rbxassetid://136662114880219"
            }, 
            Attack = {
                AnimationId = "rbxassetid://104843695277997"
            }, 
            Stunned = {
                AnimationId = "rbxassetid://99519818342284"
            }, 
            Death = {
                AnimationId = "rbxassetid://80120658647893"
            }, 
            Idle = {
                AnimationId = "rbxassetid://130277167526862"
            }
        }, 
        JellyfishDragon = {
            Walk = {
                AnimationId = "rbxassetid://127700747882981"
            }, 
            Attack = {
                AnimationId = "rbxassetid://87600728405690"
            }, 
            Stunned = {
                AnimationId = "rbxassetid://129137999770987"
            }, 
            Death = {
                AnimationId = "rbxassetid://125006722051242"
            }, 
            Idle = {
                AnimationId = "rbxassetid://108199036230967"
            }
        }, 
        KarateBruiser = {
            Walk = {
                AnimationId = "rbxassetid://78948130908807"
            }, 
            Attack = {
                AnimationId = "rbxassetid://139654911927752"
            }, 
            Stunned = {
                AnimationId = "rbxassetid://138388286336256"
            }, 
            Death = {
                AnimationId = "rbxassetid://103329413633661"
            }, 
            Idle = {
                AnimationId = "rbxassetid://139076539472257"
            }
        }
    }, 
    Player = {
        GroundSlam = {
            AnimationId = "rbxassetid://w"
        }, 
        LeftSlash = {
            AnimationId = "rbxassetid://123772713972169"
        }, 
        RightSlash = {
            AnimationId = "rbxassetid://80406816664716"
        }, 
        Uppercut = {
            AnimationId = "rbxassetid://115885833141001"
        }, 
        RightHook = {
            AnimationId = "rbxassetid://87170398576138"
        }, 
        LeftHook = {
            AnimationId = "rbxassetid://92622775271826"
        }
    }
};
return v1.Table.Lock(v2);