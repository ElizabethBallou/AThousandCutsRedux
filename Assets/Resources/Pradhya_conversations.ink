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
        *no, thank you!
            ~conversation_happening = true
                ->Pradhya_2
        *you're welcome I guess?
            ~conversation_happening = true
                ->Pradhya_2
        
    = Pradhya_2    
    You asked me to text you a recap of what we discussed re: Title IX timeline, so here it is. #pause:7
    Now that you've submitted an incident report, the Office of Equal Opportunity will appoint a lead investigator. The investigator will interview you and the responding party (that means the other person involved in the incident - I won't say their name over text for privacy reasons). The investigator will also talk to any witnesses you give us. Witnesses may have heard or seen something, or they may be people you talked to in detail about the incident. #pause:3
    Basically, they're folks who can confirm where you were and who you were with. #pause:5
    Once the lead investigator interviews everyone, they'll decide whether the responding party should be charged with a Title IX violation. If that happens, they'll schedule a hearing date and do any extra interviews. #pause:4
    Hearings are comprised of a 5-person panel made up of specially trained students, faculty, and staff. At a hearing, panel members ask the reporting party (you) and the responding party any questions they have. Then they issue a finding. #pause:3
    As your advocate, I'll be right next to you during all interviews, plus the hearing if it happens. #pause:4
    Like I said at Grit, it'll take the investigator about a month to conduct interviews. If they decide to charge the responding party, that'll take another month or so. #pause:3 
    Hopefully we can get this wrapped up by the end of the semester. #pause:2.6
    Remember, I'm always here to answer your questions! #pause:1.9
    Just text me 'ok' to let me know you got all this :)
        *ok #pause:1.5
            -   thanks!
                ~conversation_happening = false
                    ->Olivia_titleIXpath_witnesses_2
                    
                    
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
        ->room_choice
    *(different_rooms)different rooms, please #pause:2.8
        ->room_choice
    
    = room_choice
        All right, I'll tell the panel head. #pause:3.7
        Your panel has two students, a professor, and two deans. The investigator screened them ahead of time to make sure none of them know you. #pause:2.9
        {convinced_yujin == false && convinced_mikaela == false:
            You'll testify first, then Rudy will go. #pause:4.8
            }
        {convinced_yujin == false && convinced_mikaela == true:
            You'll testify first, then Rudy, then Mikaela. #pause:4.8
            }
        {convinced_yujin == true && convinced_mikaela == false:
            You'll testify first, then Rudy, then Yujin. #pause:4.8
            }
        {convinced_yujin == true && convinced_mikaela == true:
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
                ->DONE
    
    
    
    