function x = ABB_Quaternion(Th)

    [x.jcob,x.trans,x.rot] = ABB_JacobQ(Th);
    x.jdet = det(x.jcob'*x.jcob);
    x.jcond = cond(x.jcob);
    x.jrank = rank(x.jcob);

    x.tdet = det(x.trans);
    x.tcond = cond(x.trans);
    x.trank = rank(x.trans);

    x.rdet = det(x.rot*x.rot');
    x.rcond = cond(x.rot);
    x.rrank = rank(x.rot);
end