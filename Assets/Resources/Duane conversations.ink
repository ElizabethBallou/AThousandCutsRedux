
=== Duane_knot_1 ===
* @
        ->ridiculous_intro
    
    = ridiculous_intro
    #triggerdate
    ~conversant_name = "Unknown"
    hi rosa #pause:2.5
    long time no talk #pause:2.9
    youre such a ccut #pause:1
    cunt #pause:2
    fucking cunt 
    * who are you? #pause:2.6
        -> unknown_makes_threats
    * Duane? #pause:2.6
        -> unknown_makes_threats
    = unknown_makes_threats
        {TitleIX_taking_Rosas_case == true:
             i know what youre doing #pause:1.4
            you and olvia
            }
        {TitleIX_taking_Rosas_case == false:
            i know what olvia is doing #pause:1.9
            and you helped
            }
       *(stop_texting_me) stop texting me #pause:1.9
           -> unknown_makes_threats_2
       *(report_Title_IX) I'm going to report this to Title IX  #pause:2.4
              -> unknown_makes_threats_2
       *(call_police) I'm calling the police #pause:2.9
              -> unknown_makes_threats_2
       
    = unknown_makes_threats_2
        {stop_texting_me:
            dont tell me what to do #pause:3
            }
        {report_Title_IX:
            thats all you do. report report report #pause:3
            }
        {call_police:
            thats all you do. threats after threats after threats #pause:3
            }
        youre insane do you know that #pause:1.8
        literally insan #pause:1
        insane
        * are you on something?
            -> unknown_makes_threats_3
        * ok we don't have time to unpack all that
            -> unknown_makes_threats_3

    = unknown_makes_threats_3
        your not going to win this
        ~conversation_happening = false
            ->post_threat_text
       