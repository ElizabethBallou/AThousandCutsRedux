
=== Jia_knot_1 ===
    #triggerdate
 ~conversant_name = "Jia"
    hi! this is Jia. Rudy told me what was happening #pause:2.2
    I'm so sorry you got Duaned
    *I hate that Duane is now a verb, but yes #pause:3.2
     ~conversation_happening = true
        ->Jia_asks_questions
    *yeah... #pause:3.2
     ~conversation_happening = true
        ->Jia_asks_questions
    
    = Jia_asks_questions
        so you're filing a Title IX complaint? You and someone else? that's so brave
        *(Rosa_feels_brave)oh yes we want to take him down #pause:1.6
            ->Jia_asks_questions_2
        *(Rosa_eh_brave)I guess so #pause:2.2
            ->Jia_asks_questions_2
        *(Rosa_doesnt_feel_brave)I don't feel brave #pause:3.8
            ->Jia_asks_questions_2
    
    = Jia_asks_questions_2
        {Rosa_feels_brave:
            dang girl okay!!! #pause:1.6
            I like the energy #pause:2.5
            }
        {Rosa_eh_brave:
            hey *I* think you're brave. I hope that counts for something  #pause:2.5
            }
        {Rosa_doesnt_feel_brave:
            hmmmm I guess it WOULD be hard to feel brave while you're in the middle of it. #pause:1.1
            I'm sorry  #pause:2.5
            }
        Duane is a Sex Pest and he needs to be stopped #pause:3.2
        he made me feel so unsafe. it threw off my entire last semester tbh
        *what happened? #pause:3.7
            -> Jia_describes_incident
            
        = Jia_describes_incident
            first let me say: I don't know if I wanna be interviewed for your case. I'm not bold #pause:2
            at least not in the formal case-filing way #pause:2.3
            but I do want you to know that Duane is problematic AF so that you don't doubt yourself #pause:4.5
            he basically drove me home from Into the Woods rehearsal one night and then came inside even though I wanted to go to bed. and then he would not! fucking!! leave!!!
            we ended up having sex. idk why, I was stressed. but in the middle of it he took the condom off #pause:3
            I was like EXCUSE ME SIR U NEED TO STOP. but he wouldn't #pause:2.4
            sorry if this is tmi, I'm pretty frank about sex stuff
            *(Rosa_triggered)it is a lot actually #pause:2.4
                ->Jia_reacts_to_Rosa
            *(Rosa_frank)nah I am too #pause:3.8
                ->Jia_reacts_to_Rosa
            *(Rosa_fine)nah go ahead #pause:3.8
                ->Jia_reacts_to_Rosa
            
        = Jia_reacts_to_Rosa
        {Rosa_triggered:
            ohhhhhhh nooooo I'm sorry I did it again  #pause:2.4
            sometimes I forget that not everyone is like me lol #pause:3.4
            there's more stuff that happened, but that's basically all you need to know. Duane treated me like meat and now I hate him 
                }
        {Rosa_frank:
            hahaha okay good. just wanted to check. sometimes I'm too matter of fact and I make people uncomfortable but I never mean to #pause:3
            so anyway. I told Duane to get out but he wasn't leaving. and he didn't go until I said I would call the cops on his pimply ass #pause:2.4
            then he stormed out and I've tried not to talk to him ever since
            }
        {Rosa_fine:
            hahaha okay good. just wanted to check. sometimes I'm too matter of fact and I make people uncomfortable but I never mean to #pause:3
            so anyway. I told Duane to get out but he wasn't leaving. and he didn't go until I said I would call the cops on his pimply ass #pause:2.4
            then he stormed out and I've tried not to talk to him ever since
            }
            *I'm so sorry that happened but...why don't you want to be interviewed?
                **the more stories we have of Duane being an asshole, the stronger our case gets #pause:1.5
                        ->Jia_explains_hesitation
                        
        = Jia_explains_hesitation
            the problem is my parents. they're really religious and really strict. #pause:2
            classic Korean parents haha #pause:4.5
            if they find out about the Duane situation, I'm fucked. they're not gonna see the complexity in it and I'd rather jump in a pit of snakes than try to explain it all #pause:2.2
            and before you say anything #pause:3.2
            I know Title IX complaints are supposed to be confidential and all. but what if Duane thinks he's being shit on and goes public? #pause:3.5
            then my name would maybe be out there and that is really scary to me #pause:1.8
            so that's the root of my hesitation.
            *(Rosa_says_coward)but doing nothing is cowardly #pause:1.4
                ->Jia_explains_2
            *(Rosa_reminds_hurt)Duane is not going to stop hurting people #pause:1.4
                ->Jia_explains_2
            *(Rosa_expresses_solidarity)I'll be with you the whole time #pause:2.9
                ->Jia_explains_2
            
        = Jia_explains_2
            {Rosa_says_coward:
                yeah I fucking know! #pause:3
                you don't think I've stayed awake some nights wishing I had the strength to make a complaint myself?  #pause:1.7
                it's more complex than being a coward or not.
                }
            {Rosa_reminds_hurt:
                yeah. people like that don't stop #pause:3
                but I've done enough therapy to know I don't have to take responsibility for everything Duane might do #pause:2
                neither do you. you know that, right?
                ~jia_trust_level += 1
                }
            {Rosa_expresses_solidarity:
                yeah and that means a lot. but also I barely know you. so I can't someone else's idea steer me
                ~jia_trust_level += 2
                }
            *(Rosa_manipulative)you don't want to regret this 10 years later, right? #pause:2
                ->Jia_explains_3
            *(Rosa_kind)then all I can do is ask politely for you to be interviewed #pause:2.4
                ->Jia_explains_3
            *(Rosa_numbers)it's not just me, remember? there's a third person and she'll be there too #pause:3.7
                ->Jia_explains_3

        = Jia_explains_3
            {Rosa_manipulative:
                holy shit that's so manipulative!! why would you say that? #pause:2.3
                I'M the one who decides what I regret, not you #pause:2.5
                ~jia_trust_level -= 1
                }
            {Rosa_kind:
                thanks for being polite at least #pause:2.5
                ~jia_trust_level += 2
                }
            {Rosa_numbers:
                ah yeah I did forget that for a sec. 2 people saying Duane did fucked up shit is good, but 3 is a pattern #pause:2.5
                ~jia_trust_level += 1
                }
            {jia_trust_level <= 1:
                
                you know what? good luck to you but fuck this. I'm not gonna be a part of it #pause:2.5
                    ->Jia_not_helping
                    }
            {jia_trust_level == 2:
                I might regret this but okay. #pause:4
                I'm in
                *thank you so much
                    ->Jia_helping
                }
            {jia_trust_level == 3:
                I might regret this but okay. #pause:4
                I'm in
                *thank you so much #pause:1.9
                    ->Jia_helping
                }
            {jia_trust_level == 4:
                god you're so nice. how could I say no? #pause:2.5
                give the interviewers my name
                *thank you so much #pause:1.9
                    ->Jia_helping
                }
                
        = Jia_not_helping
            your fight is not my fight #pause:2.1
            now good DAY 
            ~conversation_happening = false
                ->Mikaela_scared_testifying

        = Jia_helping
            ~convinced_jia = true
            I hope they interview me fast   #pause:1.9
            then I don't have time to change my mind #pause:3.5
            whatever happens...I hope Duane gets what's coming to him.
            ~conversation_happening = false
                ->Mikaela_scared_testifying
        