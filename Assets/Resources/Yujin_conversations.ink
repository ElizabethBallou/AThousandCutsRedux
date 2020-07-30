=== Yujin_knot_1 ===
* @
        ->ridiculous_intro
    
    = ridiculous_intro
    #triggerdate
 ~conversant_name = "Yujin"
    hi! this is Yujin. I'm Rudy's friend. he told me what was happening #pause:2.8
    I'm so sorry you got Duaned
    *I hate that Duane is now a verb, but yes #pause:3.2
     ~conversation_happening = true
        ->yujin_asks_questions
    *yeah... #pause:3.2
     ~conversation_happening = true
        ->yujin_asks_questions
    
    = yujin_asks_questions
        so you're filing a Title IX complaint? you and Olivia? #pause:2.8
        I remember her from Into the Woods. she's so funny and doesn't take anyone's bs #pause:1.7
        you're both really brave
        *(Rosa_feels_brave) we want to take him down #pause:1.6
            ->Yujin_asks_questions_2
        *(Rosa_eh_brave)I guess so #pause:2.2
            ->Yujin_asks_questions_2
        *(Rosa_doesnt_feel_brave)I don't feel brave #pause:3.8
            ->Yujin_asks_questions_2
    
    = Yujin_asks_questions_2
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
            -> Yujin_describes_incident
            
        = Yujin_describes_incident
            first let me say: I don't know if I wanna be interviewed for your case. I'm not bold #pause:2
            at least not in the formal case-filing way #pause:2.3
            but I do want you to know that Duane is problematic AF so that you don't doubt yourself #pause:4.5
            he basically drove me home from Into the Woods rehearsal one night and then came inside even though I wanted to go to bed. and then he would not! fucking!! leave!!! #pause:3.2
            we ended up having sex. idk why, I was stressed. but in the middle of it he took the condom off #pause:3
            I was like EXCUSE ME SIR U NEED TO STOP. but he wouldn't #pause:2.4
            sorry if this is tmi, I'm pretty frank about sex stuff
            *(Rosa_triggered)it is a lot actually #pause:2.4
                ->Yujin_reacts_to_Rosa
            *(Rosa_frank)nah I am too #pause:3.8
                ->Yujin_reacts_to_Rosa
            *(Rosa_fine)nah go ahead #pause:3.8
                ->Yujin_reacts_to_Rosa
            
        = Yujin_reacts_to_Rosa
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
                        ->yujin_explains_hesitation
                        
        = yujin_explains_hesitation
            the problem is my parents. they're really religious and really strict. #pause:4
            if they find out about the Duane situation, I'm fucked. they're not gonna see the complexity in it and I'd rather jump in a pit of snakes than try to explain it all #pause:2.2
            and before you say anything #pause:3.2
            I know Title IX complaints are supposed to be confidential and all. but what if Duane thinks he's being shit on and goes public? #pause:3.5
            then my name would maybe be out there and that is really scary to me #pause:1.8
            so that's the root of my hesitation.
            *(Rosa_says_coward)but doing nothing is cowardly #pause:1.4
                ->yujin_explains_2
            *(Rosa_reminds_hurt)Duane is not going to stop hurting people #pause:1.4
                ->yujin_explains_2
            *(Rosa_expresses_solidarity)I'll be with you the whole time #pause:2.9
                ->yujin_explains_2
            
        = yujin_explains_2
            {Rosa_says_coward:
                yeah I fucking know! #pause:3
                you don't think I've stayed awake some nights wishing I had the strength to make a complaint myself?  #pause:1.7
                it's more complex than being a coward or not.
                }
            {Rosa_reminds_hurt:
                yeah. people like that don't stop #pause:3
                but I've done enough therapy to know I don't have to take responsibility for everything Duane might do #pause:2
                neither do you. you know that, right?
                ~yujin_trust_level += 1
                }
            {Rosa_expresses_solidarity:
                yeah and that means a lot. but also I barely know you. so I can't someone else's idea steer me
                ~yujin_trust_level += 2
                }
            *(Rosa_manipulative)you don't want to regret this 10 years later, right? #pause:2
                ->yujin_explains_3
            *(Rosa_kind)then all I can do is ask politely for you to be interviewed #pause:2.4
                ->yujin_explains_3
            *(Rosa_numbers)it's not just me, remember? there's a third person and she'll be there too #pause:3.7
                ->yujin_explains_3

        = yujin_explains_3
            {Rosa_manipulative:
                holy shit that's so manipulative!! why would you say that? #pause:2.3
                I'M the one who decides what I regret, not you #pause:2.5
                ~yujin_trust_level -= 1
                }
            {Rosa_kind:
                thanks for being polite at least #pause:2.5
                ~yujin_trust_level += 2
                }
            {Rosa_numbers:
                ah yeah I did forget that for a sec. 2 people saying Duane did fucked up shit is good, but 3 is a pattern #pause:2.5
                ~yujin_trust_level += 1
                }
            {yujin_trust_level <= 1:
                
                you know what? good luck to you but fuck this. I'm not gonna be a part of it #pause:2.5
                    ->yujin_not_helping
                    }
            {yujin_trust_level == 2:
                I might regret this but okay. #pause:4
                I'm in
                *thank you so much #pause:1.9
                    ->yujin_helping
                }
            {yujin_trust_level == 3:
                I might regret this but okay. #pause:4
                I'm in
                *thank you so much #pause:1.9
                    ->yujin_helping
                }
            {yujin_trust_level == 4:
                god you're so nice. how could I say no? #pause:2.5
                give the interviewers my name
                *thank you so much #pause:1.9
                    ->yujin_helping
                }
                
        = yujin_not_helping
            #noyujin
            your fight is not my fight #pause:2.1
            now good DAY 
            ~conversation_happening = false
                ->Mikaela_scared_testifying

        = yujin_helping
            #yesyujin
            ~convinced_yujin = true
            I hope they interview me fast   #pause:1.9
            then I don't have time to change my mind #pause:3.5
            whatever happens...I hope Duane gets what's coming to him.
            ~conversation_happening = false
                ->yujin_talks_to_olivia

=== yujin_talks_to_olivia ===
* @
        ->ridiculous_intro
    
    = ridiculous_intro
    #triggerdate
    ~conversant_name = "Yujin"
    hey lady! I've been talking to Olivia too #pause:2.5
    looks like I'll get interviewed twice: once for your case and once for hers #pause:2
    which is pointless because I'll say the same thing #pause:1.9
    guess that's just how the cookie crumbles #pause:1.2
    or rather #pause:2.7
    how the cookie has to behave when thrown into the wild world of Title IX
    *I have to be interviewed for Olivia's case, and she has to be interviewed for mine
        ~conversation_happening = true
        **my advocate says the cases can't be combined #pause:1.6
            makes sense #pause:2.9
            wouldn't want Duane to get a Dramatic Courtroom Monologue where he can be like "MY RIGHTS, THEY HAVE BEEN VIOLATED" #pause:1.7
            which he WOULD do lol #pause: 2.2
            I'm a drama queen and game recognizes game #pause:2
            better not to give him any loopholes.
                ~conversation_happening = false
                    ->Mikaela_scared_testifying
    
=== yujin_reacts_to_Duane_threat ===
* @
        ->ridiculous_intro
    
    = ridiculous_intro
    #triggerdate
    ~conversant_name = "Yujin"
    sorry I didn't answer the phone when you called. I'm in rehearsal for Spring Awakening #pause:2.1
    we're on break so I just listened to your voicemail about Duane #pause:1.9
    first, I'm so so sorry. What a manipulative dickweasel #pause:2.7
    second, no he hasn't texted me anything. but I'm terrified that he will #pause:2.1
    does he know I'm testifying for you n Olivia?
    *I...think so
        ~conversation_happening = true
        **the lead investigator sent out a pdf that summarized everything she did, including the people she interviewed
                ***she anonymized witnesses but Duane can probably figure it out #pause:1.2
                    fuck fuck fuck #pause:1.7
                    if he says anything publicly about me idk what I'll do
                        ****(wont_hurt)even if he does, that won't hurt us #pause:1.7
                            ->discuss_fear
                        ****(understand_worry)I understand why you're worried :/ #pause:1.3
                            ->discuss_fear
                        
    = discuss_fear
    {wont_hurt:
        yes! yes it will! #pause:3
        }
    {understand_worry:
        do you? #pause:3
        }
        my parents pay for most of my tuition. if they find out and they don't approve, they might stop paying #pause:2.1
        it's a threat they've made before
        *(not_healthy)that doesn't sound healthy #pause:2.8
            ->react_parents
        *(really_sorry)I'm really really sorry you have to worry about that #pause:2.8
            ->react_parents
        *(really_mad)I'm gonna kill Duane #pause:1.9
            ->react_parents
    
    = react_parents
        {not_healthy:
            my parents do love me and idk if they mean that threat #pause:2.2
            but...I think about it a lot #pause:3
            look it's complicated and I don't super want to get into it #pause:1.8
            }
        {really_sorry:
            hey a lot of folks have to worry about so much more #pause:1.9
            it's HUGE that my parents pay my tuition #pause:1.7
            but yeah it's complicated #pause:1.8
            }
        {really_mad:
            don't text stuff like that. seriously #pause:2.9
            what if Duane sues us and we have to turn over our messages? #pause:2.5
            (my big brother is a lawyer so I think about this stuff) #pause:1.8
            }
        okay break's over, gotta *keep dancin* #pause:1.8
        I'll text you if he tries anything
            *thanks
                ~conversation_happening = false
                    ->Pradhya_pre_meeting
            
        
    
    
    
    
    
    
    
    