//note: every paragraph break should be interpreted as a break between texts
VAR conversant_name = "Unknown Number"
VAR current_name = ""
VAR rosa_knew_duane = ""
VAR rosa_consented_to_kiss = ""
VAR rosa_alcohol_level = 0 //levels of drunkenness: 0 (sober), 1 (tipsy), 2 (drunk)
VAR rosa_resistance_level = 0 //levels of resistance: 0 (said no once), 1 (said no multiple times), 2 (pushed Duane away)

    hi Rosa. this is Rosa, right?
    my name is Olivia Montgomery. I'm a junior in the engineering school
    we met once at Mikaela's birthday party
    she gave me your number yesterday
    did she tell you I was going to text?
        * (Mikaela_didnt_text) no, she didn't mention anything. what's up?
        -> Mikaela_said_nothing
        * (player_remembers_Olivia) yeah I remember! good to hear from you
        ->Mikaela_said_nothing
    
    = Mikaela_said_nothing
        {Mikaela_didnt_text:
        oh
        okay
        }
        {player_remembers_Olivia:
        glad you remember me :)
        }
        I'm not sure how to start talking about this
        do you know Duane Hammond? he's a junior in the business school, I think?

        *...yes, I know Duane <>
        *Fuck Duane. we don't talk <>
        *Duane and I aren't friends anymore<>
        -   something happened. he did something to me.
        Mikaela said he did something to you too.
        did he?
    
        * I don't like discussing it
            I get that, but...
            it was bad, Rosa.
            Mikaela told me only a little bit about what happened to you. she said it would help me to know he'd done what he did to me to...someone else
            what would you call it? what happened with him?
            * * a bad night
                a bad night, huh?
                I had one of those too.
                a horrible night. the worst of my life.
                but before I get into that...what made your night bad?
                -> Rosa_explains_what_happened
            * * a sexual assault
                yeah. that's what Mikaela made it sound like.
                I'm so sorry that happened to you.
                but I texted you because it happened to me too.
                and now I don't know what to do
                I don't want to make you relive something so awful, but
                what exactly did he do to you
                -> Rosa_explains_what_happened
            * * just an asshole exhibiting typical asshole behavior
                yeah he's an asswipe, that can't be denied
                but was that all? because for me, it was more than just him acting like a jerk
                * * * there was more.
                haha yeah. isn't there always?
                oh sorry that sounded bad
                not funny 'haha,' of course. more like exhausted, can't control myself 'haha'
            -   don't worry. it's fine.
                -> Rosa_explains_what_happened
    
    = Rosa_explains_what_happened
        ~ current_name = "Rosa"
        I was at a Halloween party that some theater kids threw, and Duane was there too
        * I'd never met him before
            -> Rosa_Duane_strangers
        * he was in a class with me. we'd worked on a project before
            -> Rosa_Duane_acquaintances
        = Rosa_Duane_strangers
            ~ current_name = "Rosa"
            ~ rosa_knew_duane = "false"
            he was dressed as Burt Macklin from Parks and Rec, and I hate to say this now, but he was killing it 
            looked a lot like Chris Pratt 
            so I told him I liked his costume
            -> Duane_kissed_Rosa
        
        = Rosa_Duane_acquaintances
            ~ current_name = "Rosa"
            ~ rosa_knew_duane = "true"
            he pulled his weight in the group project. he said smart stuff in class. I didn't know him THAT well but he seemed like a nice guy, so I was happy to see him randomly at the party
            -> Duane_kissed_Rosa
        
        = Duane_kissed_Rosa
            ~ current_name = "Rosa"
            we went out to the back porch where a few other people were
            we were all talking
            then after a while it was just Duane and me. everyone else had wandered off
            he started kissing me and
            * I didn't mind that
                ~ rosa_consented_to_kiss = "true"
                but then he started doing other things
                touching me over my clothes, and then underneath them
                that was too much, so <>
            * I pulled back
                ~ rosa_consented_to_kiss = "false"
                I wasn't giving him any signals that I wanted him to kiss me anyway. I really thought we were just talking
                but he kept putting his hands on me <>
            -    -> why_Rosa_didnt_want_sex
        
        = why_Rosa_didnt_want_sex
            ~ current_name = "Rosa"
            I asked him to stop
            * I wasn't into him <>
            * I just wanted to get back to the party <>
            * I'm not that interested in guys, anyway <>
            -  but he didn't stop. it was like he didn't hear me at all.
                -> Rosa_reaction
                
                = Rosa_reaction
                    so then I
                    *  shut my eyes and stopped moving and waited it out
                    ~ rosa_resistance_level = 0
                    he got bored after a few minutes. it's no fun to grope someone who's acting like a dead body, I guess
                    I wish I'd done something else but idk what I was supposed to do<>
                    *  said what the fuck, I'm not joking
                    ~ rosa_resistance_level = 1
                    he said come on, we both know why we've been sitting out here waiting for everyone else to leave
                    and I was like ???
                    "we" don't know anything about that, my dude
                    didn't matter to him. he pressed me up against the railing and went for the zipper on my pants
                    I looked him in the eye and said "stop. now." like I would to a dog that wasn't behaving
                    and that did it. he stopped.<>
                    *  shoved him. not hard, but enough to make him notice
                    ~ rosa_resistance_level = 2
                    he got this weird look in his eye that I'll never forget
                    he said "I didn't know you were into rape play" and then he grabbed my wrists
                    he kept trying to kiss me while he held my hands down
                    I looked him in the eye and said "stop. now." like I would to a dog that wasn't behaving
                    and that did it. he stopped.<>
                    -   -> Duane_says_keep_secret
                    
                    = Duane_says_keep_secret
                        ~ current_name = "Rosa"
                        before he went inside, he said let's make sure this stays between us.
                        and he smiled as if we'd had a good time
                        I didn't say anything because I was just trying not to lose it
                        and...that's it
                        we didn't talk again, ever
                        -> Olivia_asks_about_drunkenness
                        
    = Olivia_asks_about_drunkenness
        ~ current_name = "conversant"
        wow. okay. when Mikaela said something had happened, I didn't think it would be
        well
        that
        that's horrifying
        I feel sick
        * oh shit sorry. I didn't mean to make you feel bad <>
        * you asked to hear it, didn't you? <>
        -   it's fine. I'm the one who texted you, anyway
        can I ask you something?
        were you drinking at that party?
            * * no. I don't drink
                ~rosa_alcohol_level = 0
                <>
            * *yeah, but I wasn't drinking so much that I was out of it 
                ~rosa_alcohol_level = 1
                <>
            * *it was Halloween haha. I was pretty drunk
                ~rosa_alcohol_level = 2
                <>
        - -   Duane was definitely drunk though 
            -> test_stitch

    = test_stitch
        {rosa_knew_duane == "true": Rosa knew Duane.}
        {rosa_knew_duane == "false": Rosa didn't know Duane.}
        {rosa_alcohol_level == 0: Rosa wasn't drunk.}
        {rosa_alcohol_level == 1: Rosa was tipsy.}
        {rosa_alcohol_level == 2: Rosa was drunk.}
        ->END
    
   
        
        
    