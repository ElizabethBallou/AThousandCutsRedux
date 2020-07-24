
=== Mikaela_knot_1 ===
#triggerdate
    ~conversation_happening = true
    ~conversant_name = "Mikaela"
        Rosaaaaaa #pause:1
        two things #pause:3.6
        first, do you have dinner plans? I have space today between class and rehearsal and I want to see you #pause:1.7
        you're always so busy!
        * depends. where do you want to go? #pause:2.7
            -> Rosa_is_nervous_about_dinner
        * wish I could, but I have a problem set due at 9:00 tonight :/ #pause:1
            ->Rosa_doesnt_have_time
            
    = Rosa_is_nervous_about_dinner
        The Krak? I know you don't like the dining hall #pause:2.5
        plus I could use a burger
            * yeah, the Krak works #pause:2.1
                - okay, perfect! see you at 6
                    -> Mikaela_second_question
        
    = Rosa_doesnt_have_time
        awww okay #pause:1.9
        I understand though #pause:2.2
        another time! #pause:1.7
            -> Mikaela_second_question
        
    = Mikaela_second_question
        here's the second thing #pause:2.6
        it's kind of a downer #pause:3.2
        do you remember Olivia? she came to my birthday party last month?
        * (Rosa_remembers_Olivia) we didn't talk much, but yeah, I remember #pause:1.8
            -> Mikaela_talked_with_Olivia
        * (Rosa_forgets_Olivia) hmm, no, I don't remember meeting an Olivia #pause:3.7
            -> Mikaela_talked_with_Olivia
            
    = Mikaela_talked_with_Olivia
        {Rosa_remembers_Olivia:
            ah good! Olivia is great.#pause:3
            }
        {Rosa_forgets_Olivia:
            I'm sure you all talked! but there were tons of people there that night #pause:3.4
            }
        we met playing in the pit for Into the Woods. she was the first violinist and she killed it
        *this doesn't sound like a downer! #pause:1.2
            -   I'm getting there #pause:2
                Olivia and I were talking yesterday and  #pause:4
                she mentioned that she had a bad run-in with Duane #pause:3
                she wasn't sure what to do, so I thought I could give her your number? #pause:2.6
                then you guys can talk and figure it out?
                * * ...fuck #pause:1.3
                    -> Mikaela_begs_Rosa
                
    = Mikaela_begs_Rosa
        please? #pause:3
        whatever happened with Duane really messed with Olivia. #pause:4.5
        she needs to talk to someone, and honestly so do you. like I've been thinking about why you don't go to the dining hall anymore. or to a lot of other places #pause:2
        is it because of him?
        * fine. give her my number. #pause:2.3
        -   ok. I will. are you mad at me?
            * * sort of #pause:3.6
                ->debug_fast_forward
            * * of course not #pause:3.6
                ->debug_fast_forward
            * * I'm mad, but not at you #pause:3.6
                ->debug_fast_forward
               
        = debug_fast_forward
            I'm sorry any of this ever happened. and I hate to see both of you going through this
                * me, too. #pause:3
                    -> dinner_or_not
                    
    = dinner_or_not
        {Rosa_is_nervous_about_dinner:
            I'm buying you some Krak mac n cheese tonight. you need it
            }
        {Rosa_doesnt_have_time:
            I'll come by your dorm after rehearsal with some hot chocolate, k? #pause:2
            you need it
            }
        * thanks <3
            ~conversation_happening = false
            -> Olivia_knot_1
            
=== Mikaela_knot_2 ===
    * @
        ->ridiculous_intro
    
    = ridiculous_intro
    #triggerdate
    ~conversant_name = "Mikaela"
    hey. Olivia told me you all talked #pause:2.6
    thank you for answering her <3  #pause:2.5
    how do you feel now?
    * (knot_2_angry) angry at Duane all over again #pause:1.9
    ~conversation_happening = true
    * (knot_2_guilty) guilty that I didn't say anything when it happened #pause:3.2
    ~conversation_happening = true
    * (knot_2_glad) just glad to have Olivia #pause:3.8
    ~conversation_happening = true
        -   {knot_2_angry:
                and who could blame you #pause:3
                }
            {knot_2_guilty:
                you can't think like that. you're not responsible for what Duane does #pause:1
                only he is #pause:3
                }
            {knot_2_glad:
                yeah Olivia does not stand down when she sees something she doesn't think is right #pause:3
                }
            /*{
                - Olivia_knot_3.Rosa_wants_title_ix:
                    -> Rosa_Olivia_take_action
                - Olivia_knot_3.Rosa_wants_police_report:
                    -> Rosa_Olivia_take_action
                - Olivia_knot_3.Rosa_wants_article:
                    -> Rosa_Olivia_take_action
                - else:
                    ->Rosa_does_nothing
            }*/
            -> Rosa_Olivia_take_action

            
    = Rosa_Olivia_take_action
        hey so I said this to Olivia and I just want to tell you too #pause:3.1
        I don't think going to the Title IX people is a good idea
        /*{Olivia_knot_3.Rosa_wants_title_ix:I don't think going to the Title IX people is a good idea}
        {Olivia_knot_3.Rosa_wants_police_report: I don't think talking to the police is a good idea}
        {Olivia_knot_3.Rosa_wants_article: I don't think trying to get an article written is a good idea}*/
        
        *wait, what? #pause:3.9
            ->Mikaela_doesnt_support_action
            
        = Mikaela_doesnt_support_action
            {Olivia_knot_3.Rosa_wants_title_ix:
                I've known some people who reported to the Title IX council and it never works out the way it should #pause:2.7
                I just don't want to see you all dragged through the mud
                }
            /*
            {Olivia_knot_3.Rosa_wants_police_report:
                this sucks to say, but do you know how few people actually get convicted of sexual assault?
                I just don't want to see you all dragged through the mud #pause:2.7
                }
            {Olivia_knot_3.Rosa_wants_article:
                if you attack Duane that publicly, he might get dangerous
                }
            */
            * (stop_freaking_me_out)stop freaking me out #pause:2.2
                ->Rosa_does_something
            * (cant_believe_saying)I can't believe you're saying this #pause:2
                ->Rosa_does_something
            
                
    = Rosa_does_something
        {stop_freaking_me_out:
            I'm not trying to freak you out! Just being honest
            }
        {cant_believe_saying:
            I'm sorry, it sounds like I don't support you #pause:1.6
            I do, promise #pause:1.8
            I'm just being honest
            }
        *we've made up our minds, okay
            **you're the one who gave Olivia my number in the first place #pause:2
                ->debug_fast_forward
    /*        
    = Rosa_does_nothing
        Olivia seemed upset that you didn't want to do anything but I think you made the right call
        I've known some people who reported to the Title IX council and it never works out the way it should
        *(knot_2_agree)I agree
            ->Mikaela_doesnt_trust_systems
        *(knot_2_surprised)I'm surprised you'd say that, since you brought Olivia and me together in the first place
            ->Mikaela_doesnt_trust_systems
        
        = Mikaela_doesnt_trust_systems
        {knot_2_surprised: yeah, because now you two can talk to each other and get closure that way}
        going to the police or Title IX would do you more harm than good
        * I hope Olivia doesn't hate me
            -> option2_goodbye
        */
    = debug_fast_forward
        I thought you all would just talk #pause:2.4
        not put yourselves out there like this #pause:2.6
        you know what, you're right, it isn't my place #pause:2.3
        still, I have a bad feeling about this #pause:1.6
        are you there? #pause:1
        Rosa?
            *debug option
            ~conversation_happening = false
                -> Olivia_TitleIXpath_witnesses
        
    = option2_goodbye
        she doesn't, I promise
        she'll come around soon
        in the meantime...things are going to get hard for her.
         ~conversation_happening = false
        {Olivia_knot_3.Rosa_wants_title_ix: -> Olivia_TitleIXpath_witnesses}

=== Mikaela_scared_testifying ===
    * @
        ->ridiculous_intro
    
    = ridiculous_intro
    #triggerdate
    ~conversant_name = "Mikaela"
    so I got a call from a Title IX lady #pause:2
    she wants to interview me about your story AND Olivia's story? what is going on?
    *you're a witness for both of us #pause:1.3 
        ~conversation_happening = true
        -> Mikaela_is_witness
    
    = Mikaela_is_witness
    I'm not though. I didn't see what happened either time 
    *no, but both of us talked to you and told you details pretty soon after stuff happened
        **that's what makes you a witness #pause:.5
            - ok but #pause:2.8
            I told you I don't know about Title IX in the first place
                    ***(Rosa_upset)are you seriously still thinking about yourself?? #pause:1.5
                    ->Rosa_reacts_to_Mikaela
                    ***(Rosa_frustrated)we already talked about that... #pause:1.5
                    ->Rosa_reacts_to_Mikaela
                    
    = Rosa_reacts_to_Mikaela
    {Rosa_upset:
        no no I'm not #pause:1.7
        thinking about myself I mean #pause:1.3
        I'm just telling you my opinion
        *(cares_about_opinion) well...thanks I guess
                ~mikaela_trust_level += 1
            -> Rosa_reacts_to_Mikaela_2
        *(doesnt_care_about_opinion) I don't care about your opinion. jesus #pause:3
            -> Rosa_reacts_to_Mikaela_2
        }
    {Rosa_frustrated:
        yeah yeah I know #pause:1.8
        sorry I'm not trying to repeat myself #pause:1.4
        I'm just worried
        *(appreciate_concern)I appreciate the concern even if it is misplaced #pause:1.9
                ~mikaela_trust_level += 1
            -> Rosa_reacts_to_Mikaela_2
        *(dont_appreciate_concern) keep it to yourself then #pause:1.4
            -> Rosa_reacts_to_Mikaela_2
        }
    = Rosa_reacts_to_Mikaela_2
    {cares_about_opinion:
        I really am saying this because I don't want you to get hurt
        }
    {doesnt_care_about_opinion:
        ok that was mean  #pause:1.4
        but...fair 
        }
    {appreciate_concern:
        I don't want you to get hurt for no reason, that's all
        }
    {dont_appreciate_concern:
        ...okay #pause:1.6
        guess I deserved that
        }
        *why do you think that a Title IX case is such a bad idea? 
            **did something happen? #pause:1.2
                -> Mikaela_explains_past
                
    = Mikaela_explains_past
        no! #pause:2.3
        not like what you're thinking #pause:3.5
        it's more about things that happened before I ever came to fortuna. long-time-ago things #pause:1.7
        and it's kind of complicated
        *I have time #pause:.8
            - well okay #pause:3
                I've told you about my dad leaving but I don't think I ever told you about the guys my mom dated after #pause:2.7
                she was in a bad place. WE were in a bad place. we didn't have a lot of money and she worked so much #pause:4.5
                she dated one guy, Jordan, for a year. he was a cop. at first he acted sweet and responsible - really lawful good, etc. - but he turned out to be a piece of shit #pause:3.2
                he stole money and pawned the TV and drank all the time. and when we got the locks changed he drunkenly beat the back door down #pause:2.3 
                my mom tried everything. she reported him to the police but he WAS the police #pause:2
                and every time she tried something he'd get angrier #pause:3.6
                we stayed with family friends for a while and didn't tell him. when he found out, he showed up and fired his gun into the air #pause:2.8
                eventually we moved away and my mom dated different shitty guys. though none of them were as shitty as Jordan #pause:1.5
                Jordan never paid for what he did. never. #pause:2
                and he never will, because these systems are broken #pause:3
                Title IX is the same. have you ever heard of it WORKING for students who report? because I haven't. all I've heard are horror stories #pause:2.7
                I want to believe something good will come of this for you and Olivia. but I can't. #pause:3
                and ok YES I am scared to get involved myself #pause:1.5
                oops that was a biiiig wall of text #pause:2
                I should've told you all this a long time ago
                **(Rosa_angry)yeah, you should have #pause:2
                    ->Rosa_persuades_Mikaela
                **I am so so sorry that happened#pause:2
                    ~mikaela_trust_level += 1
                    ->Rosa_persuades_Mikaela
                **don't apologize. it's hard to talk about#pause:2
                     ~mikaela_trust_level += 1
                    ->Rosa_persuades_Mikaela

    = Rosa_persuades_Mikaela
        {Rosa_angry:
        it's just...painful memories, yknow
            ~mikaela_trust_level -= 1
            }
        {not Rosa_angry:
            thanks
            }
        *(Rosa_hopeful)maybe, with my and Olivia's case, we'll beat the odds. especially if you're a witness #pause:3
            ~mikaela_trust_level += 1
            ->Mikaela_gives_answer
        *(Rosa_forthright)look...if you're not a witness then what is the point of our friendship #pause:3
            **come through for me
                ->Mikaela_gives_answer
        *(Rosa_mistrustful)I hate this system too but it's all we have #pause:3
            ~mikaela_trust_level += 2
            ->Mikaela_gives_answer
            
    = Mikaela_gives_answer
    {mikaela_trust_level >= 3:
        you know what? you're right. #pause:1.4
        I'll do the interview
        *(good_friend)you're a really good friend, Mikaela. #pause:2
            ->Mikaela_goodbye
        *(mac_n_cheese)I will get you so much mac n cheese
            ->Mikaela_goodbye
        }
    {mikaela_trust_level == 2:
        all right. I'll do it. #pause:2
        but I hope you understand how much you're asking for
        *(asking_a_lot)I do.
            ->Mikaela_goodbye
        *(not_asking)I don't think it's that much honestly.
            ->Mikaela_goodbye
        }
    {mikaela_trust_level <= 1:
        no. I don't want to talk about this any more #pause:2
        I'm sorry. I'm trying to be understanding but this is too much
        *(are_you_serious)so you're gonna abandon me then #pause:2
            ->Mikaela_goodbye
        }
    = Mikaela_goodbye
        {good_friend:
        ~convinced_mikaela = true
        thanks <3 #pause:2.3 
        we're all in this together #pause:1.9
        thank YOU for reminding me of that.
        ~conversation_happening = false
            ->Olivia_TitleIXpath_Mikaela_in
            }
        {mac_n_cheese:
        ~convinced_mikaela = true
        ahahaha I think that'd be bribery!#pause:1.9
        but I won't say no either...#pause:2
        everyone who gets interviewed for Title IX should get complimentary mac n cheese#pause:2.6
        if I run for student council that will be my platform <3
        ~conversation_happening = false
            ->Olivia_TitleIXpath_Mikaela_in
            }
        {asking_a_lot:
        ~convinced_mikaela = true
        at least you realize it #pause:2
        whew. gonna go take a walk and clear my head. talk later
        ~conversation_happening = false
            ->Olivia_TitleIXpath_Mikaela_in
            }
        {not_asking:
        ~convinced_mikaela = true
        not all of us are so ready to fight, okay?#pause:2
        whew. gonna go take a walk and clear my head. talk later
        ~conversation_happening = false
            ->Olivia_TitleIXpath_Mikaela_in
            }
        {are_you_serious:
        are you kidding? I'm not abandoning you #pause:4
        you are not the only one involved here! god, you're being like those shitty directors who talk as if every production is about them and them alone#pause:2.1
        when in reality it takes so many people just to turn the stagelights on at the right time#pause:2
        I need some time. I'm overwhelmed
            ~conversation_happening = false
            ->Olivia_TitleIXpath_Mikaela_out
            }
        
