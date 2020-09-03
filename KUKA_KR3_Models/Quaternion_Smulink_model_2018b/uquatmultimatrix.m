 %Unit Quaternion Multiplications in matrix form
function[out] = uquatmultimatrix(P,Q)
    
    P_tmp1 = P(1)*Q(1) - dot(P(2:4),Q(2:4));
    Q_tmp1 =  P(1)*Q(2:4) + Q(1)*P(2:4) + cross(P(2:4),Q(2:4));
    
    out = [simplify(simplify(P_tmp1)) simplify(simplify(Q_tmp1(1))) simplify(simplify(Q_tmp1(2))) simplify(simplify(Q_tmp1(3)))];
end