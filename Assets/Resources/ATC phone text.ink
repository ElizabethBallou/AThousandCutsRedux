//note: every paragraph break should be interpreted as a break between texts
VAR conversant_name = "Unknown Number"

    hi Rosa. this is Rosa, right?
    my name is Olivia Montgomery. I'm a junior in the engineering school
    we met once at Mikaela's birthday party
    she gave me your number yesterday
    did she tell you I was going to text?
        *no, she didn't mention anything. what's up?
        -> Mikaela_said_nothing
        *yeah I remember! good to hear from you
        ->Mikaela_said_nothing
    = Mikaela_said_nothing
        {Mikaela_said_nothing:
            oh
            okay
        }
        - I'm not sure how to start talking about this
        do you know Duane Hammond? he's a junior in the business school, I think?

        *...yes, I know Duane <>
        //    -> Duane_did_something
        *Fuck Duane. we don't talk <>
        //    -> Duane_did_something
        *Duane and I aren't friends anymore<>
        //    -> Duane_did_something
   // = Duane_did_something    
        -   something happened. he did something to me.
        Mikaela said he did something to you too.
        did he?
    
        *I don't like discussing it
        -> I_dont_like_talking_about_it
    = I_dont_like_talking_about_it
        I get that, but...
        it was bad, Rosa.
        Mikaela told me only a little bit about what happened to you. she said it would help me to know he'd done what he did to me to...someone else
        what would you call it? what happened with him?
        *a bad night
            -> it_was_bad_night
        *a sexual assault
            -> it_was_sexual_assault
        *just an asshole exhibiting typical asshole behavior
            -> it_was_Duane_being_asshole
    = it_was_bad_night
        a bad night, huh?
        I had one of those too.
        a horrible night. the worst of my life.
        but before I get into that...what made your night bad?
        ->END
    = it_was_sexual_assault
        yeah. that's what Mikaela made it sound like.
        I'm so sorry that happened to you.
        but I texted you because it happened to me too.
        and now I don't know what to do 
        ->END
    = it_was_Duane_being_asshole
        yeah he's an asswipe, that can't be denied
        but was that all? because for me, it was more than just him acting like a jerk
        ->END
    