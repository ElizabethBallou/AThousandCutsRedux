
=== Mikaela_knot_1 ===
    ~conversation_happening = true
    ~conversant_name = "Mikaela"
        #pause:0
        Rosaaaaaa
        
        #pause:3
        two things
        
        #pause:3.5
        first, do you have dinner plans? I have space today between class and rehearsal and I want to see you
        
        #pause:2
        you're always so busy!
        
        * depends. where do you want to go?
            #pause:.1
            
            -> Rosa_is_nervous_about_dinner
        * wish I could, but I have a problem set due at 9:00 tonight :/
            #pause:.1
            
            ->Rosa_doesnt_have_time
            
    = Rosa_is_nervous_about_dinner
        #pause:2.7
        The Krak? I know you don't like the dining hall
        
        #pause:1.5
        plus I could use a burger
        
        * yeah, the Krak works
        - okay, perfect! see you at 6
        -> Mikaela_second_question
        
    = Rosa_doesnt_have_time
        #pause:1
        awww okay
        #pause:1.3
        I understand though
        #pause:.9
        another time!
        -> Mikaela_second_question
        
    = Mikaela_second_question
        #pause:1.2
        here's the second thing
        #pause:1.4
        it's kind of a downer
        #pause:3
        do you remember Olivia? she came to my birthday party last month?
        * (Rosa_remembers_Olivia) we didn't talk much, but yeah, I remember
            -> Mikaela_talked_with_Olivia
        * (Rosa_forgets_Olivia) hmm, no, I don't remember meeting an Olivia
            -> Mikaela_talked_with_Olivia
            
    = Mikaela_talked_with_Olivia
        {Rosa_remembers_Olivia:
            #pause:2.3
            ah good! Olivia is great.
            }
        {Rosa_forgets_Olivia:
            #pause:3
            I'm sure you all talked! but there were tons of people there that night
            }
            #pause:3.4
        we met playing in the pit for Into the Woods. she was the first violinist and she killed it
        *this doesn't sound like a downer!
            -   #pause:1.2
                I'm getting there
                #pause:2
                Olivia and I were talking yesterday and
                #pause:4
                she mentioned that she had a bad run-in with Duane
                #pause:3
                she wasn't sure what to do, so I thought I could give her your number?
                #pause:2.6
                then you guys can talk and figure it out?
            * * ...fuck
                -> Mikaela_begs_Rosa
                
    = Mikaela_begs_Rosa
        #1.3
        please?
        #pause:3
        whatever happened with Duane really messed with Olivia.
        #pause:4.5
        she needs to talk to someone, and honestly so do you. like I've been thinking about why you don't go to the dining hall anymore. or to a lot of other places
        #pause:2
        is it because of him?
        * fine. give her my number.
        -   #pause:2.3
            ok. I will. are you mad at me?
            * * sort of
                ->Mikaela_is_sorry
            * * of course not
                ->Mikaela_is_sorry
            * * I'm mad, but not at you
                ->Mikaela_is_sorry
               
        = Mikaela_is_sorry
            #pause:3.6
            I'm sorry any of this ever happened. and I hate to see both of you going through this
                * me, too.
                    -> dinner_or_not
                    
    = dinner_or_not
        {Rosa_is_nervous_about_dinner:
            #pause:2.6
            I'm buying you some Krak mac n cheese tonight. you need it
            }
        {Rosa_doesnt_have_time:
            #pause:3.4
            I'll come by your dorm after rehearsal with some hot chocolate, k?
            #pause:2
            you need it
            }
        * thanks <3
            ~conversation_happening = false
            -> Olivia_mom_storylet
            
=== Mikaela_knot_2 ===
    ~conversant_name = "Mikaela"
    hey. Olivia told me you all talked
    thank you for answering her <3 
    how do you feel now?
    * (knot_2_angry) angry at Duane all over again
    ~conversation_happening = true
    * (knot_2_guilty) guilty that I didn't say anything when it happened
    ~conversation_happening = true
    * (knot_2_glad) just glad to have Olivia
    ~conversation_happening = true
        -   {knot_2_angry: and who could blame you}
            {knot_2_guilty: you can't think like that. you're not responsible for what Duane does}
            {knot_2_guilty: only he is}
            {knot_2_glad: yeah Olivia does not stand down when she sees something she doesn't think is right}
            {
                - Olivia_knot_3.Rosa_wants_title_ix:
                    -> Rosa_Olivia_take_action
                - Olivia_knot_3.Rosa_wants_police_report:
                    -> Rosa_Olivia_take_action
                - Olivia_knot_3.Rosa_wants_article:
                    -> Rosa_Olivia_take_action
                - else:
                    ->Rosa_does_nothing
            }
            
    = Rosa_Olivia_take_action
        hey so I said this to Olivia and I just want to tell you too
        {Olivia_knot_3.Rosa_wants_title_ix:I don't think going to the Title IX people is a good idea}
        {Olivia_knot_3.Rosa_wants_police_report: I don't think talking to the police is a good idea}
        {Olivia_knot_3.Rosa_wants_article: I don't think trying to get an article written is a good idea}
        *wait, what?
            ->Mikaela_doesnt_support_action
            
        = Mikaela_doesnt_support_action
            {Olivia_knot_3.Rosa_wants_title_ix:I've known some people who reported to the Title IX council and it never works out the way it should}
            {Olivia_knot_3.Rosa_wants_title_ix: I just don't want to see you all dragged through the mud}
            {Olivia_knot_3.Rosa_wants_police_report: this sucks to say, but do you know how few people actually get convicted of sexual assault?}
            {Olivia_knot_3.Rosa_wants_police_report: I just don't want to see you all dragged through the mud}
            {Olivia_knot_3.Rosa_wants_article: if you attack Duane that publicly, he might get dangerous}
            * (stop_freaking_me_out)stop freaking me out
                ->Rosa_does_something
            * (cant_believe_saying)I can't believe you're saying this
                ->Rosa_does_something
                
    = Rosa_does_something
        {stop_freaking_me_out: I'm not trying to freak you out! Just being honest}
        {cant_believe_saying: I'm sorry, it sounds like I don't support you}
        {cant_believe_saying: I do, promise}
        {cant_believe_saying: I'm just being honest}
        *we've made up our minds, okay
            ->Mikaela_rattles_Rosa
            
        = Mikaela_rattles_Rosa
            *you're the one who gave Olivia my number in the first place
            -> option1_goodbye
            
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
        
    = option1_goodbye
        I thought you all would just talk
        not put yourselves out there like this
        you know what, you're right, it isn't my place
        still, I have a bad feeling about this
        are you there?
        Rosa?
        ~conversation_happening = false
            -> Mikaela_knot_3
        
    = option2_goodbye
        she doesn't, I promise
        she'll come around soon
        in the meantime...things are going to get hard for her.
         ~conversation_happening = false
        {Olivia_knot_3.Rosa_wants_title_ix: -> Olivia_TitleIXpath_witnesses}
            ->Mikaela_knot_3

= Mikaela_knot_3
honestly it doesn't matter what goes here 
    *wow really?
    ~conversation_happening = true
        -> thatsright
    
    = thatsright
        oh absolutely
        ->DONE
        
=== Mikaela_scared_testifying ===
    ~conversant_name = "Mikaela"
    so I got a call from a Title IX lady
    #pause:2
    she wants to interview me about your story AND Olivia's story? what is going on?
    *you're a witness for both of us
        ~conversation_happening = true
        -> Mikaela_is_witness
    
    = Mikaela_is_witness
    #pause:1.3 
    I'm not though. I didn't see what happened either time 
    *no, but both of us talked to you and told you details pretty soon after stuff happened
        **that's what makes you a witness
            - #pause:.5
            ok but 
            #pause:1.2
            I already told you I don't know about Title IX in the first place
                    ***(Rosa_upset)are you seriously still thinking about yourself??
                    ->Rosa_reacts_to_Mikaela
                    ***(Rosa_frustrated)we already talked about that...
                    ->Rosa_reacts_to_Mikaela
                    
    = Rosa_reacts_to_Mikaela
    {Rosa_upset:
        #pause:.5
        no no I'm not
        #pause:.7
        thinking about myself I mean
        #pause:1.3
        I'm just telling you my opinion
        *(cares_about_opinion) well...thanks I guess
                ~mikaela_trust_level += 1
            -> Rosa_reacts_to_Mikaela_2
        *(doesnt_care_about_opinion) I don't care about your opinion. jesus
            -> Rosa_reacts_to_Mikaela_2
        }
    {Rosa_frustrated:
        #pause:.5
        yeah yeah I know 
        #pause:.8
        sorry I'm not trying to repeat myself
        #pause:.4
        I'm just worried
        *(appreciate_concern)I appreciate the concern even if it is misplaced
                ~mikaela_trust_level += 1
            -> Rosa_reacts_to_Mikaela_2
        *(dont_appreciate_concern) keep it to yourself then
            -> Rosa_reacts_to_Mikaela_2
        }
    = Rosa_reacts_to_Mikaela_2
    {cares_about_opinion:
        #pause:1.9
        I really am saying this because I don't want you to get hurt
        }
    {doesnt_care_about_opinion:
        #pause:3 
        ok that was mean 
        #pause:1.4
        but...fair 
        }
    {appreciate_concern:
        #pause:1.6
        I don't want you to get hurt for no reason, that's all
        }
    {dont_appreciate_concern:
        #pause:1.4
        ...okay
        #pause:.6
        guess I deserved that
        }
        *why do you think that doing anything with Title IX is such a bad idea?
            **did something happen?
                -> Mikaela_explains_past
                
    = Mikaela_explains_past
        #pause:.5
        no!
        #pause:.8
        I mean not like what you're thinking
        #pause:3.5
        it's more about shit that happened before I ever came to fortuna. long-time-ago shit
        #pause:1.7
        and it's kind of complicated
        *I have time
            - #pause:.8
                haha okay
                #pause:3
                I've told you about my dad leaving but I don't think I ever told you about the guys my mom dated after
                #pause:2.7
                she was in a bad place. WE were in a bad place. we didn't have a lot of money and she worked so much
                #pause:4.5
                she dated one guy, Jordan, for a year. he was a cop. at first he acted sweet and responsible - really lawful good, etc. - but he turned out to be a piece of shit
                #pause:3.2
                he stole money and pawned the TV and drank all the time. and when we got the locks changed he drunkenly beat the back door down
                #pause:2.3 
                my mom tried everything. she reported him to the police but he WAS the police
                #pause:2
                and every time she tried something he'd get angrier
                #pause:3.6
                we stayed with family friends for a while and didn't tell him. when he found out, he showed up and fired his gun into the air 
                #pause:2.8
                eventually we moved away and my mom dated different shitty guys. though none of them were as shitty as Jordan
                #pause:1.5
                Jordan never paid for what he did. never.
                #pause:2
                and he never will, because these systems are broken
                #pause:3
                Title IX is the same. have you ever heard of it WORKING for students who report? because I haven't. all I've heard are horror stories
                #pause:2.7
                I want to believe something good will come of this for you and Olivia. but I can't.
                #pause:3
                and ok YES I am scared to get involved myself
                #pause:1.5
                oops that was a biiiig wall of text
                #pause:2
                I should've told you all this a long time ago
                **(Rosa_angry)yeah, you should have
                    ->Rosa_persuades_Mikaela
                **I am so so sorry that happened
                    ~mikaela_trust_level += 1
                    ->Rosa_persuades_Mikaela
                **don't apologize! you didn't do anything wrong
                     ~mikaela_trust_level += 1
                    ->Rosa_persuades_Mikaela

    = Rosa_persuades_Mikaela
        {Rosa_angry:
        #pause:2
        it's just...painful memories, yknow
            ~mikaela_trust_level -= 1
            }
        {not Rosa_angry:
            #pause:.8
            thanks
            }
        *(Rosa_hopeful)maybe, with my and Olivia's case, we'll beat the odds. especially if you're a witness
            ~mikaela_trust_level += 1
            ->Mikaela_gives_answer
        *(Rosa_forthright)look...if you're not a witness you'll be stabbing me in the back
            ->Mikaela_gives_answer
        *(Rosa_mistrustful)I hate this system too but it's all we have
            ~mikaela_trust_level += 2
            ->Mikaela_gives_answer
            
    = Mikaela_gives_answer
    {mikaela_trust_level >= 3:
        #pause:3
        you know what? you're right.
        #pause:1.4
        I'll do the interview
        *(good_friend)you're a really good friend, Mikaela.
            ->Mikaela_goodbye
        *(mac_n_cheese)I will get you so much mac n cheese
            ->Mikaela_goodbye
        }
    {mikaela_trust_level == 2:
        #pause:4
        all right. I'll do it.
        #pause:2
        but I hope you understand how much you're asking for
        *(asking_a_lot)I do.
            ->Mikaela_goodbye
        *(not_asking)I don't think it's that much honestly.
            ->Mikaela_goodbye
        }
    {mikaela_trust_level <= 1:
        #pause:1.5
        no. I don't want to talk about this any more 
        #pause:2
        I'm sorry. I'm trying to be understanding but this is too much
        *(are_you_serious)so you're gonna abandon me then
            ->Mikaela_goodbye
        }
    = Mikaela_goodbye
        {good_friend:
        ~convinced_mikaela = true
        #pause:1
        thanks <3
        #pause:2.3 
        we're all in this together
        #pause:1.9
        thank YOU for reminding me of that.
        ~conversation_happening = false
            ->Olivia_TitleIxpath_Investigation
            }
        {mac_n_cheese:
        ~convinced_mikaela = true
        #pause:1.8
        ahahaha I think that'd be bribery!
        #pause:.9
        but I won't say no either...
        #pause:2
        everyone who gets interviewed for Title IX should get complimentary mac n cheese
        #pause:2.6
        if I run for student council that will be my platform <3
        ~conversation_happening = false
            ->Olivia_TitleIxpath_Investigation
            }
        {asking_a_lot:
        ~convinced_mikaela = true
        #pause:1.4
        at least you realize it 
        #pause:2
        whew. gonna go take a walk and clear my head. talk later
        ~conversation_happening = false
            ->Olivia_TitleIxpath_Investigation
            }
        {not_asking:
        ~convinced_mikaela = true
        #pause:1.4
        not all of us are so ready to fight, okay?
        #pause:2
        whew. gonna go take a walk and clear my head. talk later
        ~conversation_happening = false
            ->Olivia_TitleIxpath_Investigation
            }
        {are_you_serious:
        #pause:1.5
        are you kidding? I'm not abandoning you 
        #pause:3
        you are not the only one involved here! god, you're being like those shitty directors who talk as if every production is about them and them alone
        #pause:2.1
        when in reality it takes so many people just to turn the stagelights on at the right time
        #pause:2
        I need some time. text me later, or don't I guess. I'm overwhelmed
            ~conversation_happening = false
            ->Olivia_TitleIxpath_Investigation
            }
        
