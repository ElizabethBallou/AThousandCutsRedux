VAR olivia_family_knowledge = 0


=== Olivia_knot_1 ===
#triggerdate
~conversant_name = "Olivia"
~know_conversant = false
    hi Rosa. this is Rosa, right? #pause:2.9
    my name is Olivia. I'm a junior in the engineering school #pause:2.6
    ~know_conversant = true
    we met once at Mikaela's birthday party #pause:2.6
    she gave me your number yesterday #pause:2.3
    did she tell you I was going to text?
        * yeah, she mentioned it #pause:1.4
        ~conversation_happening = true
            ->Mikaela_said_Olivia_would_text
    
    = Mikaela_said_Olivia_would_text
        okay good #pause:1.3
        well #pause:2.4
        I'm not sure how to start talking about this #pause:2.2
        do you know Duane? he's a junior in the egineering school
        *...yes, I know Duane  #pause:2.6
        *screw Duane. we don't talk  #pause:2.6
        *Duane and I aren't friends anymore  #pause:2.6
        - -> something_happened_to_unknown
        
    = something_happened_to_unknown
        he was weird to me. if you know what I mean. #pause:2.5
        Mikaela said he was weird to you too.
        * I don't like discussing it #pause:1.6
            I get that, but... #pause:1.8
            it was bad, Rosa. #pause:3.5
            and when I told Mikaela, she said it wasn't the first time Duane had done that #pause:2.4
            so now I'm afraid there's a pattern #pause:2.2
            what would you call the thing with Duane?
            * * a bad night #pause:1.5
                a bad night huh? #pause:2.7
                what made your night bad?
                    -> Rosa_explains_what_happened
                
            * * a sexual assault #pause:3
                I'm so sorry that happened to you. #pause:2.5
                but I texted you because it happened to me too. #pause:2.3
                and now I don't know what to do #pause:3.4
                I don't want to make you relive something so awful, but
                what exactly did he do to you
                -> Rosa_explains_what_happened
                
            * * nothing much. just the normal shitty stuff #pause:1.4
                ~ anger_level = anger_level + 1
                I hear you  #pause:3.6
                but was that all? because for me, it was more than 'nothing much'
                * * * there was more. #pause:1.8
                    haha yeah. isn't there always? #pause:1.7
                    oh sorry that sounded bad #pause:3
                    not funny 'haha' more like exhausted 'haha'
            -   don't worry. it's fine.
                -> Rosa_explains_what_happened
    
    = Rosa_explains_what_happened
        *I was at a theater kid Halloween party with Mikaela, and Duane was there too
            ** I'd never met him before
            -> Rosa_Duane_strangers
            ** he was in a class with me. we'd worked on a project together
            -> Rosa_Duane_acquaintances
        = Rosa_Duane_strangers
            *he was dressed as Burt Macklin from Parks and Rec
                **and I hate to say this now, but he was killing it 
                    ***looked a lot like Chris Pratt 
                        ****so I told him I liked his costume
            -> Duane_kissed_Rosa
        
        = Rosa_Duane_acquaintances
            *he pulled his weight in the group project. he said smart stuff in class
                **I didn't know him that well but he seemed nice enough
            -> Duane_kissed_Rosa
        
        = Duane_kissed_Rosa
            *we went out to the back porch where a few other people were
                **we were all talking
                    ***then after a while it was just Duane and me. everyone else had wandered off
                        ****he started kissing me and
                            ***** I didn't mind that
                                ->Rosa_consented_kiss
                            ***** I pulled back
                                ->didnt_consent_kiss

        = Rosa_consented_kiss
            *but then he started doing other things
                **touching me over my clothes, and then underneath them
                    ***that was too much, so
                        ->why_Rosa_didnt_want_sex
                        
        = didnt_consent_kiss
            *I wasn't giving him any signals that I wanted him to kiss me anyway
                **I really thought we were just talking
                    ***but he kept putting his hands on me 
                        -> why_Rosa_didnt_want_sex
        
        = why_Rosa_didnt_want_sex
            *I asked him to stop
                ** I wasn't into him
                    *** but he didn't stop. it was like he didn't hear me at all.
                        -> Rosa_reaction
                ** I just wanted to get back to the party
                    *** but he didn't stop. it was like he didn't hear me at all.
                        -> Rosa_reaction
                ** I'm not that interested in guys, anyway
                    *** but he didn't stop. it was like he didn't hear me at all.
                        -> Rosa_reaction
                
                = Rosa_reaction
                    *so then I
                        **  shut my eyes and stopped moving and waited it out
                            ***he got bored after a few minutes. no fun to grope someone who's playing dead, I guess
                                ****I wish I'd done something else but idk what I was supposed to do
                                    ->Duane_says_keep_secret
                        **  said what the hell, I'm not joking
                        ~duane_resistance = 1
                        ~ perfect_victim_score += 1
                            ***he said come on, we both know why we've been sitting out here waiting for everyone else to leave
                                ****and I was like ???
                                    *****"we" don't know anything about that, my dude
                                        ******didn't matter to him. he shoved me against the railing and unzipped my pants
                                            *******I looked him in the eye and said "stop. now." like I would to a dog that wasn't behaving
                                                    ********and that did it. he stopped.
                                                    ->Duane_says_keep_secret
                        **  shoved him. not hard, but enough to make him notice
                        ~duane_resistance = 2
                    ~ perfect_victim_score += 2
                            ***he got this weird look
                                ****he said "I didn't think you'd be into rape play" or something
                                    *****he kept trying to kiss me while he held my hands down
                                        ******I looked him in the eye and said "stop. now." like I would to a dog that wasn't behaving
                                            *******and that did it. he stopped.
                                                -> Duane_says_keep_secret
                    
                    = Duane_says_keep_secret
                        *before he went inside, he said let's make sure this stays between us.
                            **and he smiled as if we'd had a good time
                                ***I didn't say anything because I was just trying not to lose it
                                    ****and that's it
                                        *****we didn't talk again, ever #pause:3
                                            -> Olivia_asks_about_drunkenness
                        
    = Olivia_asks_about_drunkenness
        god. when Mikaela said something had happened, I didn't think it would be that #pause:1.2
        I feel sick
        * sorry. I didn't mean to make you feel bad #pause:2.7
        * you asked to hear it #pause:2.7
        -   it's fine. I'm the one who texted you, anyway #pause:4
            can I ask you something? #pause:2.8
            were you drinking at that party?
            * * (no_drinking)no. I don't drink #pause:3.2
                ~ perfect_victim_score += 2
                    -> Olivia_remarks_on_drunkenness_level
            * * (drinking_little)yeah, but I wasn't drinking so much that I was out of it #pause:1.8
                ~alcohol_level = 1
                ~ perfect_victim_score += 1
                    -> Olivia_remarks_on_drunkenness_level
            * * (drinking_lot)it was Halloween haha. I was pretty drunk #pause:2.9
                ~alcohol_level = 2
                    -> Olivia_remarks_on_drunkenness_level

    = Olivia_remarks_on_drunkenness_level
      {no_drinking:
        good. it'll be easier to report this if you weren't drinking
        }
      {drinking_little:
        hmm could be worse #pause:4.3
        it would be easier to report this if you were sober but who's sober on Halloween?
        }
      {drinking_lot:
        damn. that'll make this harder to report
        }
      * report to who? #pause:1.9
        ->report_to_who
      
    = report_to_who
        the title IX office #pause:3.5
        I heard they throw out reports if someone's had literally anything to drink #pause:2.7
        they'll call it a bad hookup blah blah blah
            -> Rosa_reacts_to_title_ix_mention
            
        = Rosa_reacts_to_title_ix_mention
            * the what office? #pause:3.2
                -> title_ix_office_explainer
            * (Rosa_trepidatious) who said anything about going to the title IX office??? #pause:3.4
                -> Olivia_explains_ideal_outcome 
            * (Rosa_negative) everything I've heard about the title IX office  is bad #pause:1.8
                -> Olivia_explains_ideal_outcome
                
        = title_ix_office_explainer
            it's where people go to tell the deans if they've been whatevered. harassed, assaulted #pause:3.8
            there's a literal office on the 3rd floor of the dean's hall #pause:4.3
            and the people who work there are supposed to make sure that whoever pulls this shit gets punished #pause:4.7
            I've been doing some research and it's part of federal law for every college to have title ix staff.
            -> Rosa_reacts_to_title_ix_mention
            
        = Olivia_explains_ideal_outcome
        {Rosa_trepidatious:
            sorry, I thought it was obvious that that's where I was going with this #pause:1.9
            }
        {Rosa_negative:
            wait, really? #pause:1.9
            }
            Duane assaulted both of us #pause:2.3
            he's obviously a danger #pause:2.6
            shouldn't we both report him?
            * but I don't even know what happened to you #pause:1
                -> Rosa_cuts_off_Olivia
                
    = Rosa_cuts_off_Olivia
        oh yeah #pause:1.5
        I guess I haven't said #pause:2.4
        you were really open with me, so I'll tell you whatever you want to know
        * can you text me tomorrow about this? you gave me so much to think about #pause:2.8
        -   sure. sorry. I shouldve checked earlier
            -> debug_fast_forward
            
        = debug_fast_forward
            *it's fine. I have a feeling we'll be talking for a while anyway
                **we have time to get used to each other 
                    ***talk to you later, Olivia.
                        ****(Rosa_says_thanks) and thanks for saying something to me #pause:2.4
                            ->final_goodbye_knot
                
        = final_goodbye_knot
            ~ conversation_happening = false
            {Rosa_says_thanks:
                I just felt like I had to.
                }
            ~ conversation_happening = false
                -> Olivia_knot_2

=== Olivia_knot_2 ===
    * @
        ->ridiculous_intro
    
    = ridiculous_intro
    #triggerdate
     ~conversant_name = "Olivia"
    I thought for a while about what I should text you #pause:3
    like should I say "hello" as if we were talking about something normal #pause:2.8
    or be really gentle in case I freaked you out yesterday #pause:2
    but I really didn't know #pause:2.2
    so I figured I would tell you I'm confused #pause:2
    that's your cue to say something
        * (Rosa_response_chill) ha. don't worry about being confused. there's no guide for talking about this stuff #pause:2.6
                ~conversation_happening = true
            ->Olivia_greets_Rosa
        * (Rosa_response_freaked) you did freak me out, but I'm fine now #pause:2.3
                ~conversation_happening = true
            ->Olivia_greets_Rosa
        * (Rosa_response_guarded) hello i guess? #pause:2.6
                ~conversation_happening = true
            ->Olivia_greets_Rosa
            
    = Olivia_greets_Rosa
        {Rosa_response_chill:
            this would be easier if there were #pause:3
            }
        {Rosa_response_freaked:
            sorry. I didn't mean to #pause:3
            }
        {Rosa_response_guarded:
            hahaha hello and good day to you #pause:3
            }
        it's good to talk to you again
            *you too.
                **you were going to tell me what happened with Duane? #pause:2
                    ->Olivia_begins_story
        
        = Olivia_begins_story
            yes. #pause:6
            can you ask me some questions to get me started? it's hard for me to know where to begin
                * okay
                    -> Rosa_asks_Olivia_questions
                    
        = Rosa_asks_Olivia_questions
            * when did it happen? #pause:2.5
                -> Olivia_says_when_rape_happened
            * did you know Duane before? #pause:2.5
                -> Olivia_says_she_knew_Duane
            * what did he do? #pause:2.5
                -> Olivia_says_what_Duane_did
            *   -> Olivia_is_angry #pause:2.1
            
            = Olivia_says_when_rape_happened
                it was at the end of last semester #pause:3.8
                Duane and I are both in the engineering school, and some people were celebrating the end of exams by going to Jolly Molly's #pause:2
                you know it?
                    * (Rosa_knows_JM) I've had way too many vodka lemonades from JM's, haha #pause:3.2
                        ->Olivia_replies_to_JM_knowledge
                    * (Rosa_doesnt_know_JM) yeah but it's not the kind of place I go #pause:2.4
                        ->Olivia_replies_to_JM_knowledge
    
                    = Olivia_replies_to_JM_knowledge
                    {Rosa_knows_JM:
                    ah ha. that means you must have a fake ID too. so you won't judge me too much right? #pause:3
                        }
                    {Rosa_doesnt_know_JM:
                    oh no judgment there. its a real shithole #pause:3.8
                    but the bouncer never looks too hard at my ID, so I don't have to worry about using a fake #pause:3
                        }
                        that semester I worked really hard #pause:2
                        I was happy to just hang out and drink. I wasn't on my guard #pause:1.6
                        that was a mistake
                            -> Rosa_asks_Olivia_questions
                        
            = Olivia_says_she_knew_Duane
                mhmm I knew him. since last year, when he transferred here. there aren't that many engineers so he was in a lot of my classes #pause:2.4
                specifically there aren't a lot of WOMEN engineers. I'm used to getting hit on and Duane did that sometimes #pause:1.8
                but I just brushed him off #pause:3
                so many asshats treat anyone in the e school who's not a straight white dude like they're rare pokemon cards #pause:2.2
                Duane was just one of many
                    -> Rosa_asks_Olivia_questions
            
            = Olivia_says_what_Duane_did
                I had two beers. that was it. just two. I can handle two beers #pause:2
                except that night I couldn't #pause:3.4
                my thoughts started drifting away and I tried to pull them back towards me but that didn't work #pause:2.8
                the rest of the night is just flashes  #pause:4
                when I woke up, like really woke up, I was in my bed and Duane was there too #pause:3.5
                and I was horrified because I knew right away what had happened #pause:5.2
                maybe this is tmi, but I could feel it. it was a deep ache like period cramps. but I wasn't on my period #pause:3.3
                I woke him up and said he had to go right away. he wouldn't stop grinning. he was so pleased with himself #pause:3.5
                then I told my roommate what happened. Ally said we needed to go to the hospital and get a rape kit done. and we did #pause:3.6
                the nurse was so damn businesslike. she kept telling me to relax because if I did it would be over faster #pause:4
                now I'm crying. something to do with talking about the little details #pause:2
                give me a sec
                * (Rosa_is_empathetic) I am so so sorry, Olivia #pause:2
                * (Rosa_says_no_crying) don't give him the pleasure of tears #pause:3.5
                * (Rosa_says_stop_talking) please don't tell me any more. I can't handle this #pause:2.6
                    ~anger_level = anger_level + 2
                -    -> Olivia_says_what_Duane_did_2
                    
                    = Olivia_says_what_Duane_did_2
                        {Rosa_is_empathetic:
                        Im sorry too. #pause:3.1
                        I didn't realize how bad it would be to get a rape kit #pause:2.8
                        no one should have to go through that #pause:3
                        }
                        {Rosa_says_no_crying:
                        what does it matter? he doesn't know I'm crying. he doesn't give a shit about me #pause:2
                        or you #pause:3
                        }
                        {Rosa_says_stop_talking:
                        then don't read this. delete the texts or whatever #pause:2
                        but I have to say it to someone or I will scream #pause:3
                        }
                        so. I messaged Duane and asked him to explain what had happened. #pause:3.4
                        he asked if I had a good time and I said "no one has a good time when they're raped" #pause:3.9
                        it took a while for him to respond but he finally said that I was crazy. and that if I called it rape to anyone else, he'd "take action" #pause:2.2
                        that's the last time we ever spoke
                        ->Rosa_asks_Olivia_questions
                        
        = Olivia_is_angry
            so that's the story. #pause:3.1
            I spent all of winter break depressed but then I got angry #pause:2.9
            I am so so angry, Rosa #pause:2
            aren't you angry?
            * every day #pause:1.9
                -> Rosa_angry_every_day
            * I try not to think about it. if I do I'll go crazy #pause:2.2
                ->Rosa_doesnt_consider_anger
            * (dont_know_how_to_feel) I don't know how to feel angry anymore #pause:2.9
                ->Rosa_doesnt_know_how_to_feel
            
            = Rosa_angry_every_day
                you get it then #pause:2.1
                shit I have to go  #pause:3.2
                I wasn't paying attention to the time and now I'm late to class #pause:2
                talk to you later?
                -> debug_fast_forward
                
            = Rosa_doesnt_consider_anger
                ~ anger_level = anger_level + 1
                well that's messed up #pause:2.4
                ahhh no I have to go #pause:3.2
                I wasn't paying attention to the time and now I'm late to class #pause:2
                talk to you later?
                -> debug_fast_forward
                
            = Rosa_doesnt_know_how_to_feel
                ~anger_level = anger_level + 2
                then you have to learn how to get your anger back #pause:2.4
                ahhh no I have to go #pause:3.2
                I wasn't paying attention to the time and now I'm late to class #pause:2
                talk to you later?
                -> debug_fast_forward
        
        = debug_fast_forward
            * okay
            {Rosa_angry_every_day:
                **today I will be angry for you, too
                    ~ conversation_happening = false
                    ->Olivia_knot_3
                }
            {Rosa_doesnt_consider_anger:
                **I'll keep trying not to go crazy, same as always
                ~ conversation_happening = false
                    ->Olivia_knot_3
                }
            {Rosa_doesnt_know_how_to_feel:
                **I'll keep pushing all my emotions away, same as always. that's healthy, right?
                    ***that was a joke btw
                        ****awkward. ok. talk tomorrow.
                            ~ conversation_happening = false
                            ->Olivia_knot_3
                        }
                
=== Olivia_knot_3 ===
    * @
        ->ridiculous_intro
    
    = ridiculous_intro
    #triggerdate
     ~conversant_name = "Olivia"
    sorry it took me so long to text you again #pause:2.6
    I had a paper due for my humanities class  #pause:4.2
    I hate writing papers. I thought being in the E School meant no more papers but here we are #pause:3
    do you have to write a lot for English classes?
        * (Rosa_hates_papers) yeah and I hate it too
            ~conversation_happening = true
            -> Rosa_writes_papers
        * (Rosa_doesnt_mind_papers) yeah, but I don't mind it
            ~conversation_happening = true
            -> Rosa_writes_papers
        * (Rosa_enjoys_papers) I enjoy writing papers actually
            ~conversation_happening = true
            -> Rosa_writes_papers
            
    = Rosa_writes_papers
        *analyzing a book is like a puzzle. you have to figure out how all the parts fit together
        {Rosa_hates_papers:
            **THAT'S the fun part, not writing about it #pause:2
                ->Olivia_reaction
            }
        {Rosa_doesnt_mind_papers:
            **writing a paper is how you prove you know what you're talking about #pause:2
                ->Olivia_reaction
            }
        {Rosa_enjoys_papers:
            **then the paper is how you break it down and make people care #pause:2
                ->Olivia_reaction
            }
        
    = Olivia_reaction
        {Rosa_hates_papers:
            oh good you get it #pause:1.9
            I knew I liked you :)
            }
        {Rosa_doesnt_mind_papers:
            whatever you say
            }
        {Rosa_enjoys_papers:
            NERD
            }
        * What you said yesterday... #pause:2
            -> Olivia_explains_actions_1
            

    = Olivia_explains_actions_1
        ah yeah #pause:3.2
        about Duane paying for what he did #pause:4
        I thought about different stuff we could do #pause:2
        like go to the police maybe #pause:3.2
        or write an anonymous story and post it online#pause:4.2
        but the safest thing would be reporting to the title ix office
            *what does that even mean? #pause:4.9
                ->Title_IX_explanation
        
            /**and what are they? #pause:3
                -> Olivia_explains_actions_2
            *(Rosa_is_recalcitrant) I don't want to hear them
                -> Olivia_explains_actions_2*/
        /*            
        = Olivia_explains_actions_2
            {Rosa_is_recalcitrant:
                ok, you don't have to do anything, but at least listen to me #pause:3.8
                }
            first, we can both make a report to the Title IX office #pause:2.8
            second, we can report to the police #pause:3.7
            third, we can write about what happened and try to get a website somewhere to publish it #pause:1.8
            that's my shortlist
                -> Rosa_investigates_options
               
        = Rosa_investigates_options
            *tell me about reporting to Title IX #pause:4.4
                -> Title_IX_explanation
            *tell me about reporting to the police #pause:2.6
                -> police_explanation
            *tell me about publishing what happened online #pause:2.8
                ->publishing_online_explanation
            * {Rosa_investigates_options > 3} let's make a Title IX report
                -> Rosa_wants_title_ix
            * {Rosa_investigates_options > 3} let's go to the police
                -> Rosa_wants_police_report
            * {Rosa_investigates_options > 3} let's talk to the media
                -> Rosa_wants_article
            rosa* {Rosa_investigates_options > 3} I'm sorry, I can't risk any of this
                -> Rosa_wants_nothing
            
        */      
            = Title_IX_explanation
                we would both go to the Title IX office and explain what happened to whoever works there. then they'd decide if it's serious enough to bring a case against Duane #pause:2.1
                and it has to be. right? #pause:3
                after that I don't know what happens. it's hard to find much info #pause:4.7
                but if we win, Duane gets suspended or even expelled. and he gets a mark on his record for 'sexual misconduct' #pause:3.1
                which is a bs/toned-down way of saying that he committed sexual assault
                    -> Title_IX_explanation_pros_cons
                    
                = Title_IX_explanation_pros_cons
                    * so why a Title IX case? #pause:3.3
                        -> why_title_ix_report
                    * are there drawbacks? #pause:4.5
                        -> why_not_title_ix_report
                    *(Rosa_resigned) {Title_IX_explanation_pros_cons > 2}I guess there's no better option... #pause:2
                        -> debug_fast_forward
                    *(Rosa_scared) {Title_IX_explanation_pros_cons > 2} this scares the shit out of me but I'll do it #pause:2
                        -> debug_fast_forward
                    *(Rosa_ready) {Title_IX_explanation_pros_cons > 2} alright let's drive duane into the ground #pause:2
                        ->debug_fast_forward
                    //* tell me about the other stuff you mentioned
                        //-> Rosa_investigates_options
                    
                    = why_title_ix_report
                        we wouldn't have to be public about reporting Duane. no one would have to know. #pause:4.6
                        also, our chances of getting some kind of punishment for Duane are higher than if we go to the police.
                        -> Title_IX_explanation_pros_cons
                    
                    = why_not_title_ix_report
                        it's all really secretive. finding any info on how title ix works was so hard #pause:3.9
                        it seems like Title IX works differently at every university...#pause:1.3
                        still #pause:3.5
                        it's our best shot
                        -> Title_IX_explanation_pros_cons

/*
            = police_explanation
                we would both go to the police office and file a police report #pause:2.8
                then they'd decide whether to bring charges against Duane #pause:2.6
                if they do, we get to argue that hes a fuckwad in court #pause:2.4
                if they don't, we're back where we started #pause:2.2
                    -> police_explanation_pros_cons
                    
                = police_explanation_pros_cons
                    * why should we do this? #pause:3.2
                        -> why_police_report
                    * what are the drawbacks? #pause:4
                        -> why_not_police_report
                    * hmm. let's talk about the other options
                        -> Rosa_investigates_options
                        
                    = why_police_report
                        this is the only chance we have of getting criminal charges to stick to Duane #pause:2.4
                        unlikely, but if we're smart, it could happen #pause:2.3
                        and if he's convicted he could get jail time
                        -> police_explanation_pros_cons
                        
                    = why_not_police_report
                        the reason why people dont report to the cops is that they SUCK at sexual assault cases #pause:3.2
                        it is so so hard to prove that anything happened #pause:2.8
                        and if they DO bring charges, we'll have to face Duane in court #pause:3
                        I think I can handle that, but it'll be hard #pause:2.7
                        ->Rosa_investigates_options
                
            = publishing_online_explanation
                one way we can MAKE people pay attention is to talk to the media #pause:2.9
                like, contact news sites and tell them what happened #pause:2.2
                and get an article published
                    -> publishing_explanation_pros_cons
                    
                = publishing_explanation_pros_cons
                    * that seems...unconventional. why do it? #pause:3.9
                        -> why_publishing 
                    * this could go wrong though #pause:3.1
                        -> why_not_publishing
                    * what else can we try?
                        -> Rosa_investigates_options
                
                    = why_publishing
                        if enough people read a story and get angry, then Fortuna has to do something. they won't be able to ignore it. #pause:3.5
                        and this kind of shit is in the news a lot more now than it used to be #pause:2.9
                        there was Brock Turner, and the girl who carried that mattress at Columbia #pause:3
                        -> publishing_explanation_pros_cons
                        
                    = why_not_publishing
                        yeah especially if we don't write the story ourselves #pause:2.5
                        we won't have control over how a random journalist handles it #pause:2.6
                        we could come off to the whole world like sluts #pause:1.5
                        entitled, crazy sluts #pause:2.5
                        plus maybe Duane could sue us? I honestly don't know
                        -> publishing_explanation_pros_cons
                    
               ->Rosa_investigates_options
        */
        = Rosa_wants_title_ix
            that's what I was leaning towards, too. #pause:1
            -> debug_fast_forward
            
        = Rosa_wants_police_report
             that's what I was leaning towards, too. #pause:1
            -> debug_fast_forward
            
        = Rosa_wants_article
            that's what I was leaning towards, too. #pause:1
            -> debug_fast_forward
            
        = debug_fast_forward
            wow, so #pause:2.8
            we're really gonna make a complaint
            * I guess... #pause:3.8
            * we're gonna try! #pause:3.8
                -   I can't believe this is happening. like I didn't even know if you'd answer my text. so thank you. #pause:3
                    and now I need to take some time to cry it out before class #pause:2.6
                    let's talk later and we'll plan our attack #pause:2.3
                    go eat some chocolate ok? #pause:2.5
                    or whatever kind of food you like  #pause:2.4
                    something that comforts you
                        * hahahaha I will #pause:1.7
                            -> Rosa_eats_comfort_food
                        * I can't eat anything right now. I'm too nervous #pause:2.9
                            -> Rosa_too_nervous
                
                = Rosa_eats_comfort_food
                    atta girl <3 #pause:1.4
                    alright later
                    ~ conversation_happening = false
                    -> Olivia_date_storylet
                    
                = Rosa_too_nervous
                    save the nerves for later. right now just take care of yourself. #pause:3
                    we have to be be gentle with ourselves or we won't get through this #pause:1.4
                    alright later
                    ~ conversation_happening = false
                    -> Olivia_date_storylet
            
        /*= Rosa_wants_nothing
            are you serious
            youre not going to do anything
            you realize how this affects me, right?
            it makes my story weaker
            aren't you angry? don't you want to do SOMETHING
            * look we should both get over what happened
                ->Rosa_says_get_over_it
            * yes, but I can't do this right now
                -> Rosa_says_hamstrung
            * actually, I change my mind 
                -> Rosa_investigates_options
            
            = Rosa_says_get_over_it
                ~ anger_level = (anger_level + 2)
                okay.
                we very clearly have different opinions on what people should be allowed to do with other people's bodies.
                jesus I can't believe you'd say this after everything
                *not everyone wants the same thing you want
                ->Will_Olivia_respect_Rosa

            = Rosa_says_hamstrung
                ~anger_level = (anger_level + 1)
                that's cowardly. you're a coward.
                * you're being unfair
                    -   I know and I don't care 
                        *not everyone wants the same thing you want
                        ->Will_Olivia_respect_Rosa

            = Will_Olivia_respect_Rosa
                *you have to respect my choice or we're done talking
                    ->yes_she_will
                
            = yes_she_will
                ...ok 
                I dont get it but ok 
                I'm still going to do something though 
                probably Ill go the title ix way 
                can we keep talking? once Ive made the report? you're the only one who will get it fully
                *as long as you don't pull me into making a report I don't want to make right now
                    ->Olivia_promises
            = Olivia_promises
                I won't. I promise.
                ~ conversation_happening = false

                -> Olivia_date_storylet
                */
                        
=== Olivia_mom_storylet ===
     * @
        ->ridiculous_intro
    
    = ridiculous_intro
    #triggerdate
     ~conversant_name = "Olivia"
    hey what are you doing tomorrow around 1? #pause:1.7
    my mom's coming up from the city for her monthly attempt at parenting #pause:2.4
    we usually go somewhere nice for lunch so maybe I can treat you to a fancy ass sandwich #pause:1.8
    you n me both deserve one at this point haha
        *(thats_nice)that's so nice of her #pause:1.2
            ~conversation_happening = true
            ->Olivia_explains_mom
        *(thats_awkward)that sounds awkward #pause:2.1
            ~conversation_happening = true
            ->Olivia_explains_mom
        
        = Olivia_explains_mom
        {thats_nice:
            I mean...I guess
            }
        {thats_awkward:
            oh lol it will be. but eyes on the prize Rosa #pause:2.5
            (the prize is the free food in case that was not clear) #pause:2.2
            }
            my mom isn't a huge part of my life #pause:2
            something she has been trying to fix ever since I started at fortuna #pause:2.8
            she is doing her best now, bless her heart, as my dad's mom would say
                ->questions_about_mom
        
        = questions_about_mom
            *what IS your mom's life, then? #pause:1.1
                ->olivias_moms_career
            *are you close to your grandma? #pause:.6
                ->olivias_grandma
            *what about your dad? #pause:1.1
                ->olivias_dad
            
            *{olivia_family_knowledge == 3}ok this all sounds very personal. are you SURE you want me to come?
                ->debug_fast_forward
        
        = olivias_moms_career
        ~olivia_family_knowledge += 1
            oh her job is her life #pause:1.5
            she's an investment banker in the city. pretty good at it, so she's made a lot of money
                ->questions_about_mom

        = olivias_grandma
            ~olivia_family_knowledge += 1
            I was, yeah #pause:3.8
            I lived with her after my mom realized that being a single mom working in finance was impossible #pause:4
            I also like...don't know how much my mom WANTED a kid. I found out later my dad was the one who was really gunning for a baby #pause:2.8
            Gran died last year, which is why my mom is trying to make up for all the years we hardly talked
                ->questions_about_mom
                
        = olivias_dad
            ~olivia_family_knowledge += 1
            he died when I was really little #pause:1
            I don't remember him very much
            *I'm really sorry to hear that #pause:.4
                -   eh don't be #pause:2.5
                    I worked that shit out in therapy years ago
                    ->questions_about_mom
        
        = debug_fast_forward
            *I mean we only met recently #pause:2.3 
                -   oh. well of course you don't have to come #pause:2.5
                    I just thought itd be nice
                    **no no, I'll come! I wanted to make sure #pause:2
                        ->rosa_goes_to_lunch
                    **why don't you call me after and tell me how it goes? #pause:3.3
                        ->rosa_refrains_from_lunch
                        
            = rosa_goes_to_lunch
                yessssssss thank god #pause:3
                I truly did not wanna go by myself #pause:4
                mom wants to try that new fusion thai mexican american whatever place on cranston st #pause:2
                so I'll see you there at 1!! #pause:2.8
                you're a lifesaver :)
                ~conversation_happening = false
                    ->Olivia_mom_storylet_lunch_followup
            
            = rosa_refrains_from_lunch
                you're subjecting me to mom torture :(((((( #pause:2.9
                death by well meaning parental smothering
                *you might actually have a good time, you know #pause:2.4
                    -   ugh I hate it when other people are right #pause:2
                        ok call you tomorrow
                        ~conversation_happening = false
                            ->Olivia_mom_storylet_phone_followup

=== Olivia_mom_storylet_lunch_followup ===
     * @
        ->ridiculous_intro
    
    = ridiculous_intro
    #triggerdate
     ~conversant_name = "Olivia"
    ~conversation_happening = true
    hey thanks again for coming! #pause:2.5
    you are a Mother Whisperer #pause:3
    and...I did actually have a good time #pause:3.5
    you must be a good luck charm <3
        *you bet I am
            ~conversation_happening = false
            -> Yujin_knot_1
        
=== Olivia_mom_storylet_phone_followup ===
    ~conversant_name = "Olivia"
    ~conversation_happening = true
    hey thanks for calling tonight
    #pause:2.8
    it was really nice to have someone to talk to about awkward parent shit
    #pause:3
    you make it easy to say what I'm actually thinking.
        *aww, thanks
            ~conversation_happening = false
            ->Yujin_knot_1


=== Olivia_date_storylet ===
    * @
        ->ridiculous_intro
    
    = ridiculous_intro
    #triggerdate
     ~conversant_name = "Olivia"
    band t shirt or crop top?
    *what? #pause:.7
        ~conversation_happening = true
        -   for a first date #pause:1.6
            should I wear a band t shirt or a crop top? #pause:2
            I have clothes all over the floor and none of my other friends have texted me back yet #pause:1
            and I only have 30 minutes before I'm supposed to be at Grit
            **(Rosa_fashionable)oh you have come to the right person #pause:1
                    I knew it!!! #pause:1.8
                    I knew it from the tone of our texts
                        ***Olivia that makes no sense
                            ->comments_on_fashion
            **(Rosa_unfashionable)trust me, you don't want my fashion advice #pause:.6
                o but Rosa #pause:.5
                this is an emergency #pause:1
                and you answered my text so now you have to help :P
                    ***if you insist... #pause:1.2
                        ->comments_on_fashion
            **(Rosa_bewildered)I can't believe you have energy for dates right now #pause:.7
                    awww don't judge #pause:1.2
                    they're a fun distraction 
                    ***I'm not judging, just impressed #pause:1.2
                        ->comments_on_fashion
                    ***whatever works for you #pause:1.2
                        ->comments_on_fashion
            
        = comments_on_fashion
            so her name is Rae #pause:1.9
            I met her on a dating app and we've been chatting for a few days #pause:2.5
            she's really into photography and she's on the ballroom dancing team, which I didn't know Fortuna even had #pause:1.3
            and she dyes her hair pretty colors and plays video games #1.9
            last night she suggested continuing our convo over coffee at Grit #pause:1.5
            Grit has shit coffee imho but I'm still excited!
            *(coffee_snob)haha yeah it tastes like hot pee dirt #pause:1.7
            *(coffee_whatever)I'm not a coffee snob but sure #pause:1.8
                -   {coffee_snob:
                    that is disgusting#pause:1.6
                    but also correct #pause:2
                        }
                    {coffee_whatever:
                    just trust me on this  #pause:2
                        }
                    so do I wear the crop top and look Hot and Confident #pause:2.3
                    or the band shirt and look Chill and Approachable?
                    ->shirt_choice_point
        
        = shirt_choice_point
            *(crop_top)go for Hot and Confident #pause:1.9
                ->debug_fast_forward
            *(band_shirt)go for Chill and Approachable #pause:1.9
                ->debug_fast_forward
            *(overthinking)you're overthinking this #pause:1
                ->overthinking_it
                
        = overthinking_it
            that is a nonanswer!!#pause:1.7
            CHOOSE I AM DYING HERE
            *geez ok fine
                ->shirt_choice_point
        = debug_fast_forward
            excellent choice  #pause:2.5
            {crop_top:
                I will stun her with my BOLDNESS #pause:2.2
                }
            {band_shirt:
                I will woo her with my relatable love of Portugal. The Man #pause:2.2
                }
            thank you for your crucial input #pause:1.4
            all right gotta finish getting ready or I'll be late
                *tell me how it goes! #pause:.5
                    - oh I will ;P
                        ~conversation_happening = false
                        ->Mikaela_knot_2
 
 === Olivia_book_storylet
     * @
        ->ridiculous_intro
    
    = ridiculous_intro
    #triggerdate
     ~conversant_name = "Olivia"
    Rooooooosaaaaaaaaa #pause:1.4
    heeeeeeeeeeeeeelp
    *whaaaaaaaaaat #pause:3.1
        ~conversation_happening = true
        - I'm going to an e school women's get-to-know-you thing and I have to bring a book to swap
            **(Rosa_excited)AW YISS BOOK PARTY #pause:2.4
                ->Olivia_doesnt_like_books
            **(can_Rosa_come)ooh great idea for a group hang #pause:2.2
                ->Olivia_doesnt_like_books
            **(Rosa_confused)is that...a problem? #pause:1
                ->Olivia_doesnt_like_books
                
    = Olivia_doesnt_like_books
    {Rosa_excited:
        hahah that was NOT my reaction when I found out #pause:2.5
        }
    {can_Rosa_come:
        hahah I don't think so. it's for e schoolers #pause:1
        sorry! #pause:1.4
        the thing is, though #pause:2.5
        }
    {Rosa_confused:
        YES #pause:2.5
        }
        I don't like reading that much! #pause:2.3
        I mean I like comics #pause:1.9
        and I read the news online #pause:2.9
        but I haven't finished a book in I don't even know how long #pause:3.5
        I never tell that to humanities majors. they always say YOU ARE UNLEARNED or whatever
        *(Rosa_understanding)it's fine, I can understand how other people don't like books that much #pause:1.3
            ->Olivia_asks_for_advice
        *(Rosa_book_god)yeah we all worship the Book God. the ones who go hard subsist on manuscript pages alone #pause:2.3
            ->Olivia_asks_for_advice
        *(Rosa_says_unlearned)YOU ARE UNLEARNED #pause:1
            ->Olivia_asks_for_advice
            
    = Olivia_asks_for_advice
        {Rosa_understanding:
            oh thank god #pause:2.4
            people can be so pretentious about it #pause:1.2
            }
        {Rosa_book_god:
            ah yes and in the E School we worship the Volt Monster #pause:2.9
            we feed it batteries and in return it gives us good grades on the midterms #pause:3.1
            one day the Book God and the Volt Monster will go to war and we'll have to fight each other #pause:1
            tragic #pause:1.2
            also off-topic #pause:1.9
            here's what I actually wanted to ask:
            }
        {Rosa_says_unlearned:
            well #pause:2.1
            I walked right into that one #pause:1.3
            still: RUDE #pause:2
            but I'm gonna ask for help anyway!
            }
        what book should I bring??? #pause:1.4
        what's Hip n Fresh these days
        *what genres do you like?
            -   idk, all of them? what do YOU like? I'm asking YOU 
                **(sci_fi_fantasy)sci fi and fantasy! #pause:2.1
                    ->Rosa_gives_rec
                **(literary_fiction)literary fiction! #pause:2.1
                    ->Rosa_gives_rec
                **(mysteries_thrillers)mysteries and thrillers! #pause:2.1
                    ->Rosa_gives_rec
                    
    = Rosa_gives_rec
        {sci_fi_fantasy:
            please don't say Harry Potter #pause:2.9
            JK Rowling can eat my ass, I'm not buying her books
            *Olivia there is so much more out there than HP 
                **bring Parable of the Sower. it's about a Black girl who gets magical powers during the apocalypse
                        ->Olivia_reacts_book
                **bring The Three-Body Problem. it's about a Chinese physicist who gets weird signals from aliens
                        ->Olivia_reacts_book
            }
        {literary_fiction:
            girl I barely know what that IS
            *it's basically just 'realistic fiction' with a snooty title lol
                **bring Normal People. it's about teens falling in love in modern Ireland
                        ->Olivia_reacts_book
                **bring Americanah. it's about a Nigerian student who moves to the US for school
                        ->Olivia_reacts_book
            }
        {mysteries_thrillers:
            so like...Agatha Christie?
                *no no no
                    **bring The Name of the Rose. it's a murder mystery set in a medieval Italian monastery
                        ->Olivia_reacts_book
                    **bring The Dark Maidens. it's a Japanese light novel about a student who's murdered at an all girls school 
                        ->Olivia_reacts_book
            }
        
        = Olivia_reacts_book
        damnnn that actually sounds really good! #pause:3.1
        I'll order it then. and maybe even read the first chapter before I go swap it for something else #pause:1.9
        bet I won't even like what I swap it for #pause: 1.4
        I'll just give it to you!
            *yes please. I won't stop collecting until my bookshelf collapses haha #pause:1.8
                -   that is a safety hazard, but you do you #pause:1.2
                    thanks for the rec!
                    ~conversation_happening = false
                        ->Olivia_TitleIxpath_Investigation
            *nahhh keep it. we'll make a book lover out of you yet #pause:1.2
                -   lol good luck #pause:1.4
                    thanks for the rec!
                     ~conversation_happening = false
                        ->Olivia_TitleIxpath_Investigation
            
  === Olivia_TitleIXpath_witnesses ===
     * @
        ->ridiculous_intro
    
    = ridiculous_intro
    #triggerdate
     ~conversant_name = "Olivia"
    all right I just got home from making my report to the Title IX rep #pause:1.2
    you did yours, right?
        * yeah, yesterday #pause:2.9
            ~conversation_happening = true
            ->Rosa_responds
    
        = Rosa_responds
            was it that Irene lady? the one who laughs weird and wears the wrong shade of foundation?
            *(Rosa_chides) aww that's not nice #pause:1
                -> Olivia_answers
            *(Rosa_agrees) yes! the very one!! #pause:2.5
                -> Olivia_answers
            
        = Olivia_answers
            {Rosa_chides:
                but it's true #pause:1.3
                }
            {Rosa_agrees:
                haha I wonder if Irene is the only one who takes these statements #pause:1.3
                }
            she pissed me off #pause:2.4
            she kept saying "we will treat this with the utmost seriousness" over and over #pause:1.9
            like...I get it, Irene #pause:2.5
            also she said I'd get a title ix advocate, whatever that is #pause:2
            did you get one too?
            *mhmm. I got an email this morning
                **her name is Pradhya. she wants to meet at Grit so we can get to know each other #pause:3.5
                        ->investigation_discussion
                        
        = investigation_discussion
          that's kinda nice. then you can at least pretend like you're going to Grit to study or whatever #pause:2.9
          you can stay away from the sterile ass dean's hall #pause:3
          I swear, that place makes me feel like I'm in a funeral parlor #pause:2
          tell me how it goes!
          ~conversation_happening = false
            ->Pradhya_initial_text

=== Olivia_titleIXpath_witnesses_2 ===
     * @
        ->ridiculous_intro
    
    = ridiculous_intro
    #triggerdate
     ~conversant_name = "Olivia"
    so? how was Pradhya the Advocate? #pause:3.3
    btw I keep misspelling advocate and my phone autocorrects it to avocado #pause:2.8
    one of these days I won't catch it before I hit send
    *she was so thorough and professional 
        **(Pradhya_comforting)it was comforting #pause:2.3
            ~conversation_happening = true
                ->advocate_discussion
        **(Pradhya_intimidating)it was intimidating #pause:3.3
            ~conversation_happening = true
                ->advocate_discussion
    = advocate_discussion
    {Pradhya_comforting:
        hell yeah Pradhya the avocado knows her shit #pause:2
        }
    {Pradhya_intimidating:
        better for her to know what she's talking about than the alternative...#pause:2
        }
        I got an avocado too btw #pause:3.9
        their name is Shay. they called me this morning to go over the whole 'process' clusterfuckery and it is a lottttt #pause:1.4
        but I trust them #pause:3.1
        they're a local lawyer and they work with assault/gender discrimination victims
        one thing they said got my attention. there's gonna be a lead investigator and that person will interview duane #pause:4.2
          and people we give as witnesses #pause:1.9
          I didn't realize we could just like #pause:2.4
          give them the names of ANYONE who knows about what happened #pause:1.7
          could be really helpful for us #pause:1.6
          did Pradhya tell you all that?
          *she did #pause:2.5
            -   good. anyone you're thinking of?
                ->Rosa_lists_witnesses
            
        = Rosa_lists_witnesses
            * {not Mikaela_witness} Mikaela was there
                **she knows when we got there and when we left #pause:2
                    -> Mikaela_witness
            * {not Rudy_witness} this guy, Rudy, hosted the party
                **he was outside for a while and saw Duane and me talking #pause:2
                    -> Rudy_witness
            * {Mikaela_witness} {Rudy_witness} -> any_final_witnesses
            = Mikaela_witness
            {not Rudy_witness: ok good start}
            {not Rudy_witness: anyone else?}
            {Rudy_witness: also a good idea}
                ->Rosa_lists_witnesses
                
            = Rudy_witness
            {not Mikaela_witness: ok good start}
            {not Mikaela_witness: anyone else?}
            {Mikaela_witness: also a good idea}
                ->Rosa_lists_witnesses
        
        = any_final_witnesses
        anyone else?
        * not that I can think of #pause:1.8
            -> move_to_Olivia
            
        = move_to_Olivia
        2 people, that's pretty good
        * what about you? #pause:1.3
            ->Olivia_witnesses
            
        = Olivia_witnesses
        
        first there's my roommate, Ally #pause:1.3
        she took me to the hospital the morning after #pause:2.2
        then there's one of my professors. I wasn't turning in work for about two weeks and she was the only one who asked if I was okay #pause1:.5
        so I told her #pause:2.5
        she can confirm that I said the same shit to her as I did to Irene #pause:2
        and then there's Mikaela of course #pause:1.2
        so those are the 3
        *will Mikaela agree to be interviewed twice? #pause:1.1
            ->conversation_end
            
        = conversation_end
        I dunno #pause:2
        we can only hope I guess...
            ~conversation_happening = false
                ->Rudy_knot_1
        
=== Olivia_TitleIXpath_Mikaela_in ===
     * @
        ->ridiculous_intro
    
    = ridiculous_intro
    #triggerdate
     ~conversant_name = "Olivia"
     ~perfect_victim_score += 2
    whatever you said to Mikaela, it mustve worked #pause:2.4
    she just texted me and said she'd be a witness for both of us #pause:1.8
    good work, Agent Rosa
        *(Rosa_glad)I'm glad she could see our perspective #pause:2.3
            ~conversation_happening = true
            ->do_the_right_thing
        *(Rosa_upset)don't congratulate me. it felt manipulative #pause:1.5
            ~conversation_happening = true
            ->do_the_right_thing
            
    = do_the_right_thing
        {Rosa_glad:
            me too. I thought she might pussy out #pause:3.2
            imho, if someone asks you to testify in a title ix case, you SHOULD do it. you have the chance to help a person in an incredibly shitty situation #pause:2.3
            anything else is cowardly
                *Mikaela had her reasons for hesitating #pause:2.4
                    ->conclusion
            }
        {Rosa_upset:
            what? how?
                *because she's suffered too
                    **in different ways, but...it still counts #pause:3.8
                            imho, if someone asks you to testify in a title ix case, you SHOULD do it. you have the chance to help a person in an incredibly shitty situation
                            anything else is cowardly
                                ***Mikaela had her reasons for hesitating #pause:2.4
                                    ->conclusion
            }
    = conclusion
        if you say so
        thanks for talking to her tho. I appreciate it
            *any time
                ~conversation_happening = false
                    ->Olivia_book_storylet
            *I hope Mikaela will be okay
                ~conversation_happening = false
                    ->Olivia_book_storylet
                    
=== Olivia_TitleIXpath_Mikaela_out ===
     * @
        ->ridiculous_intro
    
    = ridiculous_intro
    #triggerdate
     ~conversant_name = "Olivia"
    damn girl
    whatever you said to Mikaela really pissed her off
    now she's screwing us over by not testifying for EITHER of us
        *(Rosa_no_blame)don't blame me
            ~conversation_happening = true
            ->Olivia_angry_at_Mikaela
        *(Rosa_betrayed)I can't believe her
            ~conversation_happening = true
            ->Olivia_angry_at_Mikaela
        *(Rosas_ruminating)she had her reasons
            ~conversation_happening = true
            ->Olivia_angry_at_Mikaela
        
    = Olivia_angry_at_Mikaela
    {Rosa_no_blame:
        it's hard not to
        she said you were an asshole and didn't listen to her
        }
    {Rosa_betrayed:
        it was not a quality friend move, that's for sure
        }
    {Rosas_ruminating:
        but what about us??
        we're the ones who have an actual case!
        }
        I guess it doesn't matter
        we lost that shot
        at least you have Rudy and I have my roommate
        so we still have witnesses
            *(Rosa_worried_case)I'm worried about the case
                ->conclusion
            *(Rosa_worried_Mikaela)I'm worried about Mikaela
                ->conclusion
                
    = conclusion
        {Rosa_worried_case:
            me too.
            it'll be fine
            I really really hope it'll still be fine.
                ~conversation_happening = false
                   -> Olivia_book_storylet
            }
        {Rosa_worried_Mikaela:
            she'll come around eventually, right?
            she's still our friend
            I think
                ~conversation_happening = false
                -> Olivia_book_storylet
            }
        ~conversation_happening = false
            ->Olivia_book_storylet
            
        
=== Olivia_TitleIxpath_Investigation ===
     * @
        ->ridiculous_intro
    
    = ridiculous_intro
    #triggerdate
     ~conversant_name = "Olivia"
    did you see the email??
    *what email? #pause:2
        ~conversation_happening = true
        {convinced_yujin == "yes" && convinced_mikaela == "yes":
            ->case_judgment_both
            }
        {convinced_mikaela == "yes" && convinced_yujin == "no":
            ->case_judgment_both
            }
        {convinced_mikaela == "no" && convinced_yujin == "yes":
            ->case_judgment_both
            }
        {convinced_yujin == "no" && convinced_mikaela == "no":
            ->case_judgment_one
            }
    
    = case_judgment_both
        from the Title IX people #pause:2
        they're taking BOTH of our cases!!
        ~TitleIX_taking_Rosas_case = "yes"
        *(shocked)ARE YOU SERIOUS #pause:1
            ->taking_Rosas_case
        *(Rosa_terrified)well this is terrifying #pause:2.3
            ->taking_Rosas_case
        *(get_this_far)I didn't think we'd actually get this far #pause:1.9
            ->taking_Rosas_case
            
    = taking_Rosas_case
        #IXyes
        {shocked:
            YES I AM #pause:3.3
            }
        {Rosa_terrified:
            are you joking???? I cant sit still right now Im so excited #pause:3.3
            }
        {get_this_far:
            I was trying not to get ahead of myself #pause:1.8
            THEY THINK WE'RE TELLING THE TRUTH #pause:2.5
            I mean maybe they think that #pause:1.3
            whatever! this is a victory #pause:3.3
            }
        what's your schedule like today? we should meet up at Jolly Molly's #pause: 3.7
        one of the bartenders was in the Into the Woods orchestra w me and she gives me free shots #pause:2
        WHICH WE WILL NEED FOR A CELEBRATION
        *(yes_jm)let's go now!
            ->celebrating
        *(no_fake_jm)I don't have a fake, remember?
            ->celebrating
        *(tea_please)can we drink tea in my apartment instead...?
            ->celebrating
    
    = celebrating
        {yes_jm:
            you are bold and I like that #pause:1.9
            see you there!!!
            ~conversation_happening = false
                ->Duane_knot_1
            }
        {no_fake_jm:
            then come over to my place and we'll have some shots there instead :)
            *if you insist!
                come over any time after 8
                I'm so happy
                I hope you are too
                    ~conversation_happening = false
                        ->Duane_knot_1
            *can we drink tea in my apartment instead...?
                uggghhhhh FINE but I will bring a flask of whiskey
                I'm making mine a hot toddy
                I won't make you drink one, don't worry
                see you sooooooooon
                    ~conversation_happening = false
                        ->Duane_knot_1
            }
        {tea_please:
            ggghhhhh FINE but I will bring a flask of whiskey
                I'm making mine a hot toddy
                I won't make you drink one, don't worry
                see you sooooooooon
                    ~conversation_happening = false
                        ->Duane_knot_1
            }
            
    = case_judgment_one
        #IXno
        ~TitleIX_taking_Rosas_case = "no"
        from the Title IX people #pause:2
        my case is moving forward!! #pause:4
        but...yours isn't
        *(relieved)that is a relief tbh #pause:2.1
            ->not_taking_Rosas_case
        *(disappointed)but I was so ready to do this... #pause:1.4
            ->not_taking_Rosas_case
        *(angry)fuck them.
            ->not_taking_Rosas_case
    
    = not_taking_Rosas_case
    {relieved:
        is it really? #pause:2.1
        I wasn't expecting you to say that #pause:2.4
            ->come_over
        }
    {disappointed:
        I know :( #pause:3.6
        I was afraid this might happen but I really hoped it wouldn't. #pause:2.4
            ->come_over
        }
    {angry:
        wait fuck who? me? the investigator?
            *everyone #pause:2
                I'm so sorry Rosa. #pause:3.5
                what happened to you IS worth investigating and I'm sorry someone couldn't see that. #pause:2.4
                    ->come_over
        }
    = come_over
        wanna come over to my dorm tonight? #pause:1.6
        Ally is at her boyfriend's #pause:2.4
        we can watch David Attenborough documentaries #pause:2.1
        which is what I do when I'm sad btw
            *(love_that)I'd love that #pause:1.2
                ->response_come_over
            *(no_thank_you)no thanks, I'm fine #pause:1.8
                ->response_come_over
            *(too_painful)that would be too painful
                ->response_come_over
                
    = response_come_over
    {love_that:
        great :) #pause:2.1
        come any time after 8! #pause:2.9
        heck, come whenever. you're always welcome here
            ~conversation_happening = false
                ->Pradhya_no_case
        }
    {no_thank_you:
        I feel like that isn't true #pause:1.9
        but I won't push you #pause:2.5
        I'll be here if you want to call
            ~conversation_happening = false
                ->Pradhya_no_case
        }
    {too_painful:
        yeah I get it.
        I'll see you soon then
            ~conversation_happening = false
                ->Pradhya_no_case
        }
    ->Duane_knot_1
    
=== post_threat_text ===
 * @
        ->ridiculous_intro
    = ridiculous_intro
    #triggerdate
    ~conversant_name = "Olivia"
    he texted me
    im sure itw as him
    an unknown number texted me "youll wish you didnt do this"
    *he texted me too
        ~conversation_happening = true
        I can't believe it #pause:1.6
        what did he say?
            **(insane)he said I was insane
                ->what_Duane_said
            **(wont_win)he said we won't win this
                ->what_Duane_said
            **(not_important)it's not important
                ->what_Duane_said
    = what_Duane_said
    {insane:
        you're NOT
        }
    {wont_win:
        was he threatening you?
        jesus ffffff
        }
    {not_important:
        rosa this is very important
        }
        we have to do something
        right?
        tell someone
        *who?
            **(police)the police? #pause:2.7
                ->who_tell
            **(title_ix)the title ix office? #pause:1.4
                ->who_tell
            **(martial_arts)your friends on the martial arts team?
                ->who_tell
    = who_tell
        {police:
            I can't think of any charges they could file #pause:1.6
            but why not right? #pause:2.1
            I'll call later when I'm calmer #pause:3
            }
        {title_ix:
            yeah I guess #pause:1.9
            I'm not sure what they can do but #pause:1.3
            I'll email later #pause:1.2
            when I'm calmer #pause:3
            }
        {martial_arts:
            come on take this seriously #pause:1.8
            I'm freaking out #pause:3
            }
        do we have to worry? #pause:2.4
        about duane hurting us I mean
        *it's smart to worry #pause:2
            exhausting too #pause:2.5
                and the case hasn't even been heard yet #pause:2.9
                    ->think_duane_might_kill
        *he won't actually do anything 
            **he's not that stupid...I think #pause:2.4
                -   it's not a question of stupidity #pause:1.8
                    (tho he's no genius) #pause:2.1
                    it's whether he gets mad enough #pause:2.9
                        ->think_duane_might_kill
            
    = think_duane_might_kill
        rosa, do you think #pause:3.4
        that if there were no laws, no police, nothing to stop him #pause:4
        duane would just kill us?
        *(he_would)he would #pause:1.9
            ->might_kill_2
        *(he_wouldnt)he wouldn't #pause:2.1
            ->might_kill_2
        
    = might_kill_2
        {he_would:
            that's what I think too. #pause:2.9
            }
        {he_wouldnt:
            I wish I could agree with you #pause:1.8
            I bet he'd do it
            }
        and if you could get away with killing him #pause:1.4
        no consequences #pause:1.2
        would you?
        *yes #pause:2
            me too #pause:2.9
            that makes us bad people I think #pause:2.2
            but also I don't care
                ->conclusion
        *no #pause:2
            you're better than me then #pause:1.8
            I'd off him #pause:2.4
            that makes me a bad person I think
                ->conclusion
        *I don't know #pause:2
            oh. I do #pause:2.2
            I'd off him
            that makes me a bad person I think
                ->conclusion
    
    = conclusion
        I'm gonna go hide under the covers for a while
        {police:
            then I'll call the police
            }
        {title_ix:
            then I'll email Shay
            }
        {martial_arts:
            then...dunno what
            punch my pillow maybe
            }
        this may sound too sappy but...I'm so glad to have you, Rosa
        *I hope I'm enough
            ~conversation_happening = false
            {TitleIX_taking_Rosas_case == "yes" && convinced_yujin == "yes":
                -> yujin_reacts_to_Duane_threat
            }
            {TitleIX_taking_Rosas_case  == "yes" && convinced_yujin == "no":
                ->Pradhya_pre_meeting
            }
            {TitleIX_taking_Rosas_case == "no":
                ->olivia_nervous_pre_trial
            }
            
        *I'm glad to have you too
            ~conversation_happening = false
            {TitleIX_taking_Rosas_case == "yes" && convinced_yujin == "yes":
                -> yujin_reacts_to_Duane_threat
            }
            {TitleIX_taking_Rosas_case  == "yes" && convinced_yujin == "no":
                ->Pradhya_pre_meeting
            }
            {TitleIX_taking_Rosas_case == "no":
                ->olivia_nervous_pre_trial
            }
    
=== olivia_nervous_pre_trial ===
* @
        ->ridiculous_intro
    = ridiculous_intro
    #triggerdate
    ~conversant_name = "Olivia"
    heyyyy hope the last week of classes has gone okay #pause:2.3
    just figured I'd check in since...you know #pause:1.9
    the hearing is next week #pause:2.1
    you're still gonna testify for me, right?
    *(yes_def)of course! #pause:1.3
        ~conversation_happening = true
            ->explain_reaction
    *(could_be_busy)mmm might be busy #pause:2.1
        ~conversation_happening = true
            ->explain_reaction
    *(feel_strange)it'll feel strange, but yeah #pause:1
        ~conversation_happening = true
            ->explain_reaction
    
    = explain_reaction
    {yes_def:
        okay good #pause:2.3
        I don't know I just thought #pause:2.5
        maybe you'd change your mind #pause:1.9
        }
    {could_be_busy:
        don't joke like that #pause:2.4
        this isn't funny to me #pause:1.9
        }
    {feel_strange:
        oh #pause:2.8
        since your case isn't going forward? #pause:2.4
        please don't hold it against me #pause:1.9
        }
    I'm so scared #pause:3.5
    especially since nothing happened to duane after he sent us those texts #pause:2.2
    this hearing better be worth the trouble
    *it will be #pause:1.5
        I want to believe that #pause:1.7
        but...it's hard these days.
            ~conversation_happening = false
            ->olivia_pep_talk_rosa_witness
    *I'm scared, too #pause:2.1
        yeah this isn't easy for either of us, is it? #pause:1.5
        one more week #pause:1.7
        then we can be free
            ~conversation_happening = false
            ->olivia_pep_talk_rosa_witness
    *we should prepare ourselves for losing #pause:1.4
        I know but #pause:1.9
        I can barely think about it #pause:2.9
        I have to believe we'll win. or I don't know how to get through this.
            ~conversation_happening = false
            ->olivia_pep_talk_rosa_witness

=== olivia_pep_talk_rosa_witness ===
* @
        ->ridiculous_intro
    = ridiculous_intro
    #triggerdate
    ~conversant_name = "Olivia"
    hello brave rosa #pause: 1.9
    where the offense is let the great axe fall
    *pardon me? #pause:2.2
        ~conversation_happening = true
        ->explains_quote
    *you've finally lost it #pause:2.2
        ~conversation_happening = true
        ->explains_quote

    = explains_quote
        it's from hamlet! what kind of english major are you?? #pause:3.5
        I wanted to give you a pep talk before you testify so I googled "literary quotes about revenge" #pause:2.1
        this one mentioned a great axe #pause:1.8
        seemed appropriate
        *that's very sweet #pause:2
            a great axe is not supposed to be sweet! #pause:1.1
            whatever #pause:2.5
                ->good_luck
        *weird, but okay #pause:1.9
            look I am doing my best #pause:2.5
                ->good_luck
        *...the villain says that #pause:1.8
            ahhh is that who claudius is? #pause:1.1
            oops #pause:1.8
            I stand by my effort though #pause:2.5
                ->good_luck
    = good_luck
    *shouldn't I be giving YOU a pep talk? it's your case, I'm just a witness #pause:2.4
        nahhhh that's not how it works #pause:2.7
        you gotta know I wouldn't be here without you #pause:2.5
        we got this. text me during breaks!
        ~conversation_happening = false
            ->olivia_wrap_up    
    
=== olivia_pep_talk_rosa_case ===
* @
        ->ridiculous_intro
    = ridiculous_intro
    #triggerdate
    ~conversant_name = "Olivia"
    hello brave rosa #pause: 1.9
    where the offense is let the great axe fall
    *pardon me? #pause:2.2
        ~conversation_happening = true
        ->explains_quote
    *you've finally lost it #pause:2.2
        ~conversation_happening = true
        ->explains_quote

    = explains_quote
        it's from hamlet! what kind of english major are you?? #pause:2.9
        I wanted to give you a pep talk so I googled "literary quotes about revenge" #pause:2.1
        this one mentioned a great axe #pause:1.8
        seemed appropriate
        *that's very sweet #pause:2
            a great axe is not supposed to be sweet! #pause:1.1
            whatever #pause:2.5
                ->good_luck
        *weird, but okay #pause:1.9
            look I am doing my best #pause:2.5
                ->good_luck
        *...the villain says that #pause:1.8
            ahhh is that who claudius is? #pause:1.1
            oops #pause:1.8
            I stand by my effort though #pause:2.5
                ->good_luck
    = good_luck
    since you're going first, I wanted to say good luck #pause:1.5
    text me during breaks! #pause:2.9
    both of us have strong cases. something will come of this
        ~conversation_happening = false
        {convinced_yujin == "yes":
            ->Yujin_post_hearing
            }
        {convinced_yujin == "no":
            ->olivia_wrap_up
            }
        
        
=== olivia_wrap_up ===
* @
        ->ridiculous_intro
    = ridiculous_intro
    #triggerdate
    ~conversant_name = "Olivia"
    it's over #pause:3
    {perfect_victim_score <= 2:
        and all he got was a slap on the wrist #pause:2
        }
    {perfect_victim_score == 3:
        and all he got was a slap on the wrist and some mandated therapy#pause:2
        }
    {perfect_victim_score == 4:
        and all he got was a slap on the wrist and some mandated therapy#pause:2
        }
    {perfect_victim_score == 5:
        I wanted more but at least it's going on his record#pause:2
        }
    {perfect_victim_score == 6:
        I wanted more but at least it's going on his record#pause:2
        }
    {perfect_victim_score == 7:
        and he's suspended#pause:2
        }
    {perfect_victim_score == 8:
        and he's suspended#pause:2
        }
    {perfect_victim_score == 9:
        and he's expelled#pause:2 
        }
    I can't believe it
        *I can't either #pause:2.5
            ~conversation_happening = true
                ->surprised_ending
        *I had a feeling it would always turn out this way #pause:2.5
            ~conversation_happening = true
                ->meant_to_be
    
    = surprised_ending
    {perfect_victim_score >= 7:
        it made a difference #pause:2.3
        I'm still in shock #pause:2.9
        something we did made a difference #pause:2.9
        }
    {perfect_victim_score <=4:
        was it a waste of time? #pause:1.5
        all of this #pause:1.9
        did it matter? #pause:2.4
        I have to believe it mattered #pause:2.7
        }
    {perfect_victim_score == 5:
        if Duane ever applies to grad school...they'll know #pause:1.4
        that's something #pause:2.7
        }
    {perfect_victim_score == 6:
        if Duane ever applies to grad school...they'll know #pause:1.4
        that's something #pause:2.9
        }
        ->ending_final
        
    = meant_to_be
    {perfect_victim_score >= 7:
        you mean you knew we'd hand him his ass??? #pause:2.9
        damn Rosa you shoulda shared that months ago! #pause:3.1
        I would have stressed so much less hahaaa #pase:2.8
        }
    {perfect_victim_score <=4:
        you mean you knew it wasn't going to be worth it? #pause:1.9
        wish you woulda shared #pause:2.9
        }
    {perfect_victim_score == 5:
        you mean you knew we'd feel kinda 'meh' about it all? #pause:2
        pretty underwhelming hahaaa #pause:2.9
        }
    {perfect_victim_score == 6:
        you mean you knew we'd feel kinda 'meh' about it all? #pause:2
        pretty underwhelming hahaa #pause:2.8
        }
        ->ending_final
    
    = ending_final
    anyway I don't want to talk about Duane anymore #pause:2.7
    let's flush him down the toilet yknow #pause:2.6
    instead what I wanted to say was #pause:1.8
    it's almost summer #pause:2
    school will be out #pause:2.4
    are we going to keep talking? #pause:3
    I really, really don't want to stop talking to you, Rosa.
        *do you even have to ask? #pause:1.9
            ok thank GOD #pause:3.1
            I've never made friends with someone like this before #pause:3
            and no offense but I hope it never happens again #pause:1.8
            you're my ride or die #pause:2.6
            no matter what happens...don't forget that.
                ~conversation_happening = false
                    ->extra_knot

=== extra_knot ===
* @
        ->ridiculous_intro
    = ridiculous_intro
    #triggerdate
    ~conversant_name = "Olivia"
    yep yep here we goooo
        ->DONE

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    