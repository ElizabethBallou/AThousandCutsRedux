=== Pradhya_initial_text ===
    * @
        ->ridiculous_intro
    
    = ridiculous_intro
    #triggerdate
    ~conversant_name = "Pradhya"
    Hi Rosa. It's Pradhya, your Title IX advocate. Thanks for meeting up at Grit earlier today so I could tell you more about the incident report process!
        *sure
            ~conversation_happening = true
                ->Pradhya_2
        *no, thank YOU
            ~conversation_happening = true
                ->Pradhya_2
        *you're welcome I guess?
            ~conversation_happening = true
                ->Pradhya_2
        
    = Pradhya_2    
    You asked me to text you a recap of what we discussed re: Title IX timeline, so here it is. #pause:7
    Now that you've submitted an incident report, the Office of Equal Opportunity will appoint a lead investigator. The investigator will interview you and the responding party (that means the other person involved in the incident - I won't say their name over text for privacy reasons). #pauses:6
    The investigator will also talk to any witnesses you give us. Witnesses may have heard or seen something, or they may be people you talked to in detail about the incident. #pause:5
    Basically, they're folks who can confirm where you were and who you were with. #pause:7
    Are you with me so far?
        *yep
            ->Pradhya_continues
            
    = Pradhya_continues
    Once the lead investigator interviews everyone, they'll decide whether the responding party should be charged with a Title IX violation. If that happens, they'll schedule a hearing date and do any extra interviews. #pause:6
    Hearings are comprised of a 5-person panel made up of specially trained students, faculty, and staff. At a hearing, panel members ask the reporting party (you) and the responding party any questions they have. Then they issue a finding. #pause:3
    As your advocate, I'll be right next to you during all interviews, plus the hearing if it happens. #pause:6
    Like I said at Grit, it'll take the investigator about a month to conduct interviews. If they decide to charge the responding party, that'll take another month or so. #pause:5 
    Hopefully we can get this wrapped up by the end of the semester. #pause:4
    Remember, I'm always here to answer your questions! #pause:2.5
    Just text me 'ok' to let me know you got all this :)
        *ok #pause:1.5
            -   thanks!
                ~conversation_happening = false
                    ->Olivia_titleIXpath_witnesses_2
                    
=== Pradhya_no_case
 * @
        ->ridiculous_intro
    
    = ridiculous_intro
    #triggerdate
    ~conversant_name = "Pradhya"
    Hi Rosa. I just left you a voicemail, but I remember you saying you don't check your voicemail much. I'll repeat the most important parts of it here. #pause:3.8
    I'm sorry the investigator decided not to hear your case. I'm not involved in the investigation, so I can't guess why she made that decision. #pause:4
    I know that what happened affected you deeply. The decision not to go forward doesn't invalidate your pain. #pause:2.2
    You can come visit me in the Deans' Office any time if you just want to talk.
        *(appreciated)I appreciate that #pause:1.7
            ~conversation_happening = true
            ->Pradhya_answers
        *(no_office)I don't want to come back to the Deans' Office #pause:2.2
            ~conversation_happening = true
            ->Pradhya_answers
        *(screw_you)screw all of you #pause:3
            ~conversation_happening = true
            ->Pradhya_answers
            
    = Pradhya_answers
    {appreciated:
        Of course. #pause:1.5
        I'll be here.
            ~conversation_happening = false
            ->Duane_knot_1
        }
    {no_office:
        I understand that. #pause:2.8
        For what it's worth, I'll still be here.
            ~conversation_happening = false
            ->Duane_knot_1
        }
    {screw_you:
        I understand why you'd say that. #pause:2.8
        For what it's worth, I'll still be here.
            ~conversation_happening = false
            ->Duane_knot_1
        }
        
=== Pradhya_pre_meeting ===
 * @
        ->ridiculous_intro
    
    = ridiculous_intro
    #triggerdate
    ~conversant_name = "Pradhya"
    Hi Rosa. Just a few days to go before the hearing. You can do this! #pause:3.9
    There are a few things for you to think about before the hearing takes place. First, do you want to be in a different room from the responding party? #pause:4
    We have a big conference room in the Deans' Hall that we usually use for Title IX hearings, but if you want, you and Duane can have separate rooms. #pause:2.3
    If you choose that option, we'll teleconference between the rooms. #pause:1.9
    What do you think?
    *(same_room)the same room is fine #pause:2.8
        ~same_room_as_duane = "yes"
        ~conversation_happening = true
        ->room_choice
    *(different_rooms)different rooms, please #pause:2.8
        ~same_room_as_duane = "no"
        ~conversation_happening = true
        ->room_choice
    
    = room_choice
        All right, I'll tell the panel head. #pause:3.7
        Your panel has two students, a professor, and two deans. The investigator screened them ahead of time to make sure none of them know you. #pause:2.9
        {convinced_yujin == "no" && convinced_mikaela == "no":
            You'll testify first, then Rudy will go. #pause:4.8
            }
        {convinced_yujin == "no" && convinced_mikaela == "yes":
            You'll testify first, then Rudy, then Mikaela. #pause:4.8
            }
        {convinced_yujin == "yes" && convinced_mikaela == "no":
            You'll testify first, then Rudy, then Yujin. #pause:4.8
            }
        {convinced_yujin == "yes" && convinced_mikaela == "yes":
            You'll testify first, then Rudy, then Mikaela, then Yujin. #pause:4.8
            }
        Panel members can ask questions after each of you delivers your statement. The responding party and his advocate can ask questions, too, but they have to give questions to the panel first. #pause: 3.5
        If the panel approves them, the panel head will read the questions aloud. #pause:3.4
        Proceedings will begin at 9:00 AM sharp, so make sure to be on time! Dress professionally, as if this were a job interview. #pause:3.2
        This bit's a little weird, but...I've noticed that complainants do best when they wear all black or all white.
            *oh. why? #pause:3.5
                I'm not sure, honestly. Black is funereal, I guess. And white is, well...virginal.
                    **I'll wear all black #pause:1.6
                        Good choice. #pause:2.6
                        ->pradhya_pep_talk
                    **I'll wear all white #pause:1.6
                        Good choice. #pause:2.6
                        ->pradhya_pep_talk
                    **screw it I'm wearing purple and green #pause:2.8
                        Okay, if that's what you want. I'm just here to support - you don't have to take my advice. #pause:2.6
                            ->pradhya_pep_talk
                    
    = pradhya_pep_talk
        I'll be honest with you. The next few days are going to be super anxiety-inducing. But then it'll be over.
        Call me if you need anything!
            *thanks
                ~conversation_happening = false
                ->olivia_pep_talk_rosa_case
    
    
    
    