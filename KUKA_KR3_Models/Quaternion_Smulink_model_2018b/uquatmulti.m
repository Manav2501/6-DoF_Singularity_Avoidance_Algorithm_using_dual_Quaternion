 %Unit Quaternion Multiplications
function[out] = uquatmulti(P,Q)
    P_tmp = compact(P);
    Q_tmp = compact(Q);
    
    P_tmp1 = P_tmp(1)*Q_tmp(1) - dot(P_tmp(2:4),Q_tmp(2:4));
    Q_tmp1 =  P_tmp(1)*Q_tmp(2:4) + Q_tmp(1)*P_tmp(2:4) + cross(P_tmp(2:4),Q_tmp(2:4));
    
    out = quaternion([P_tmp1 Q_tmp1]);
end