-------------------------------- MODULE quiz --------------------------------

CONSTANTS WhiteBill, WhiteTower, BlackBill, BlackTower, ShorterThan50, TallerThan50


VARIABLE obj1, obj2, obj3, height1, height2, height3
vars == <<obj1, obj2, obj3, height1, height2, height3>>

TypeInv ==
    /\ obj1 \in {WhiteBill, WhiteTower, BlackBill, BlackTower}
    /\ obj2 \in {WhiteBill, WhiteTower, BlackBill, BlackTower}
    /\ obj3 \in {WhiteBill, WhiteTower, BlackBill, BlackTower}
    /\ height1 \in {ShorterThan50, TallerThan50}
    /\ height2 \in {ShorterThan50, TallerThan50}
    /\ height3 \in {ShorterThan50, TallerThan50}


Cond1 ==
    /\ height1 = ShorterThan50 => obj1 \in {WhiteBill, BlackBill}
    /\ height2 = ShorterThan50 => obj2 \in {WhiteBill, BlackBill}
    /\ height3 = ShorterThan50 => obj3 \in {WhiteBill, BlackBill}

Cond2 ==
    /\ obj1 /= WhiteBill
    /\ obj2 /= WhiteBill
    /\ obj3 /= WhiteBill
    
Cond3 ==
    /\
        \/ obj1 \in {WhiteBill, BlackBill}
        \/ obj2 \in {WhiteBill, BlackBill}
        \/ obj3 \in {WhiteBill, BlackBill}
    /\
        \/ obj1 \in {WhiteTower, BlackTower}
        \/ obj1 \in {WhiteTower, BlackTower}
        \/ obj3 \in {WhiteTower, BlackTower}

Init ==
    \/
        /\ obj1 = BlackTower
        /\ height1 = TallerThan50
        /\ obj2 = WhiteBill
        /\ height2 = ShorterThan50
        /\ obj3 = WhiteTower
        /\ height3 = TallerThan50
    \/
        /\ obj1 = WhiteTower
        /\ height1 = TallerThan50
        /\ obj2 = WhiteBill
        /\ height2 = TallerThan50
        /\ obj3 = BlackBill
        /\ height3 = ShorterThan50
    \/
        /\ obj1 = BlackBill
        /\ height1 = ShorterThan50
        /\ obj2 = WhiteBill
        /\ height2 = ShorterThan50
        /\ obj3 = BlackTower
        /\ height3 = TallerThan50


Next == <>Init

Spec ==
    /\ ~Cond1
    /\ ~Cond2
    /\ ~Cond3

=============================================================================
\* Modification History
\* Last modified Sun Mar 31 12:26:38 JST 2019 by yuki.kokubun
\* Created Sun Mar 31 12:00:19 JST 2019 by yuki.kokubun
