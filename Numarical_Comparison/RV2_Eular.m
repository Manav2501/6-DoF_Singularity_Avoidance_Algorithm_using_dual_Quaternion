function x = RV2_Eular(Th,rv2)

    x.jcob = rv2.jacob0(Th);
    x.jdet = det(x.jcob'*x.jcob);
    x.jcond = cond(x.jcob);
    x.jrank = rank(x.jcob);

    x.trans = rv2.jacob0(Th,'trans');
    x.tdet = det(x.trans(:,1:5)*x.trans(:,1:5)');
    x.tcond = cond(x.trans);
    x.trank = rank(x.trans);

    x.rot = rv2.jacob0(Th,'rot');
    x.rdet = det(x.rot*x.rot');
    x.rcond = cond(x.rot);
    x.rrank = rank(x.rot);

end