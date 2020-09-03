function x = ABB_Eular(Th,irb140)

    x.jcob = irb140.jacob0(Th);
    x.jdet = det(x.jcob);
    x.jcond = cond(x.jcob);
    x.jrank = rank(x.jcob);

    x.trans = irb140.jacob0(Th,'trans');
    x.tdet = det(x.trans(:,1:3));
    x.tcond = cond(x.trans);
    x.trank = rank(x.trans);

    x.rot = irb140.jacob0(Th,'rot');
    x.rdet = det(x.rot*x.rot');
    x.rcond = cond(x.rot);
    x.rrank = rank(x.rot);

end