
=== Jia_knot_1 ===
 ~conversant_name = "Jia"
    #pause:0
    hi! this is Jia. Rudy told me what was happening
    #pause:.5
    I'm so sorry you got Duaned
    *I hate that Duane is now a verb, but yes
     ~conversation_happening = true
        ->Jia_asks_questions
    *yeah...
     ~conversation_happening = true
        ->Jia_asks_questions
    
    = Jia_asks_questions
        #pause:1.3
        so you're filing a Title IX complaint? You and someone else? that's so brave
        *(Rosa_feels_brave)we want to take him the fuck down 
            ->Jia_asks_questions_2
        *(Rosa_eh_brave)I guess so
            ->Jia_asks_questions_2
        *(Rosa_doesnt_feel_brave)I don't feel brave
            ->Jia_asks_questions_2
    
    = Jia_asks_questions_2
        {Rosa_feels_brave:
            #pause:.4
            dang girl okay!!!
            #pause:.6
            I like the energy
            }
        {Rosa_eh_brave:
            #pause:1.2
            hey *I* think you're brave. I hope that counts for something 
            }
        {Rosa_doesnt_feel_brave:
            #pause:2
            hmmmm I guess it WOULD be hard to feel brave while you're in the middle of it.
            #pause:.5
            I'm sorry 
            }
        #pause:1.2
        Duane is a Sex Pest Extraordinaire and he needs to be stopped
        #pause:2
        he made me feel so unsafe. it threw off my entire last semester tbh
        *what happened?
            -> Jia_describes_incident
            
        = Jia_describes_incident
            #pause:3.7
            first I wanna say: I don't know if I wanna be interviewed for your case. I'm not that bold
            #pause:2
            at least not in the Formal Case-Filing Way
            #pause:1.4
            but I do want you to know that Duane is problematic AF so that you don't doubt yourself
            #pause:4
            he basically drove me home from Into the Woods rehearsal one night and then came inside even though I wanted to go to bed. and then he would not! fucking!! leave!!!
            #pause:3
            we ended up having sex. idk why, I was stressed. but in the middle of it he took
            #pause:.5
            the condom
            #pause:.3
            off
            #pause:2
            I was like dude wtf, stop NOW. but he wouldn't
            #pause:1.3
            sorry if this is tmi, I'm pretty frank about sex stuff
            *(Rosa_triggered)it is a lot actually 
                ->Jia_reacts_to_Rosa
            *(Rosa_frank)nah I am too
                ->Jia_reacts_to_Rosa
            *(Rosa_fine)nah go ahead
                ->Jia_reacts_to_Rosa
            
        = Jia_reacts_to_Rosa
        {Rosa_triggered:
            #pause:2
            ohhhhhhh nooooo I'm sorry I did it again 
            #pause: 1.4
            sometimes I forget that not everyone is like me lol
            #pause:3.4
            there's more stuff that happened, but that's basically all you need to know. Duane treated me like meat and now I hate him 
                }
        {Rosa_frank:
            #pause:3.2
            hahaha okay good. just wanted to check. sometimes I'm too matter of fact and I make people uncomfortable but I never mean to
            #pause:3
            so anyway. I told Duane to get out but he wasn't leaving. and he didn't go until I said I would call the cops on his pimply ass
            #pause:1.4
            then he stormed out and I've tried not to talk to him ever since
            }
        {Rosa_fine:
            #pause:3.2
            hahaha okay good. just wanted to check. sometimes I'm too matter of fact and I make people uncomfortable but I never mean to
            #pause:3
            so anyway. I told Duane to get out but he wasn't leaving. and he didn't go until I said I would call the cops on his pimply ass
            #pause:1.4
            then he stormed out and I've tried not to talk to him ever since
            }
            *I'm so sorry that happened but...why don't you want to be interviewed?
                **the more stories we have of Duane being an asshole, the stronger our case gets
                        ->Jia_explains_hesitation
                        
        = Jia_explains_hesitation
            #pause:1.5
            the problem is my parents. they're really religious and really strict.
            #pause:1
            classic Korean parents haha
            #pause:4.5
            if they find out about the Duane situation, I'm fucked. they're not gonna see the complexity in it and I'd rather jump in a pit of snakes than try to explain it all
            #pause:1
            and before you say anything
            #pause:3.2
            I know Title IX complaints are supposed to be confidential and all. but what if Duane thinks he's being shit on and goes public?
            #pause:2.5
            then my name would maybe be out there and that is really scary to me
            #pause:1.8
            so that's the root of my hesitation.
            *(Rosa_says_coward)but doing nothing is cowardly
                ->Jia_explains_2
            *(Rosa_reminds_hurt)Duane is not going to stop hurting people
                ->Jia_explains_2
            *(Rosa_expresses_solidarity)I'll be with you the whole time
                ->Jia_explains_2
            
        = Jia_explains_2
            {Rosa_says_coward:
                #pause:.4
                yeah I fucking know!
                #pause:3
                you don't think I've stayed awake some nights wishing I had the strength to make a complaint myself?
                #pause:1.7
                it's more complex than being a coward or not.
                }
            {Rosa_reminds_hurt:
                #pause:1.4
                yeah. people like that don't stop 
                #pause:3
                but I've done enough therapy to know I don't have to take responsibility for everything Duane might do
                #pause:2.
                neither do you. you know that, right?
                ~jia_trust_level += 1
                }
            {Rosa_expresses_solidarity:
                #pause:2.5
                yeah and that means a lot. but also I barely know you. so I can't someone else's idea steer me
                ~jia_trust_level += 2
                }
            *(Rosa_manipulative)you don't want to regret this 10 years later, right?
                ->Jia_explains_3
            *(Rosa_kind)then all I can do is ask politely for you to be interviewed
                ->Jia_explains_3
            *(Rosa_numbers)it's not just me, remember? there's a third person and she'll be there too 
                ->Jia_explains_3

        = Jia_explains_3
            {Rosa_manipulative:
                #pause:2
                holy shit that's so manipulative!! why would you say that?
                #pause:2.3 
                I'M the one who decides what I regret, not you 
                }
            {Rosa_kind:
                #pause:1.4
                thanks for being polite at least
                ~jia_trust_level += 2
                }
            {Rosa_numbers:
                #pause:2.7
                ah yeah I did forget that for a sec. 2 people saying Duane did fucked up shit is good, but 3 is a pattern
                ~jia_trust_level += 1
                }
            {jia_trust_level <= 1:
                #pause:2
                you know what? good luck to you but fuck this. I'm not gonna be a part of it
                    ->Jia_not_helping
                    }
            {jia_trust_level == 2:
                #pause:3.4
                I might regret this but okay.
                #pause:4
                I'm in
                *thank you so much
                    ->Jia_helping
                }
            {jia_trust_level == 3:
                #pause:3.4
                I might regret this but okay.
                #pause:4
                I'm in
                *thank you so much
                    ->Jia_helping
                }
            {jia_trust_level == 4:
                #pause:2.4
                god you're so nice. how could I say no?
                #pause:2
                give the interviewers my name
                *thank you so much
                    ->Jia_helping
                }
                
        = Jia_not_helping
            #pause:1.9
            your fight is not my fight
            #pause:2.1
            now good DAY 
            ~conversation_happening = false
                ->Mikaela_scared_testifying

        = Jia_helping
            ~convinced_jia = true
            #pause:1.1
            I hope they interview me fast 
            #pause:1.9
            then I don't have time to change my mind
            #pause:3.5
            whatever happens...I hope Duane gets what's coming to him.
            ~conversation_happening = false
                ->Mikaela_scared_testifying
        