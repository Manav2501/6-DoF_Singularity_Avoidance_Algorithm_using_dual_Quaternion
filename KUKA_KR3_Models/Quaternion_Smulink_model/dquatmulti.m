%Dual Quaternion Multiplications

function [P_final,Q_final] = dquatmulti(P,Q) 
    
    n = length(P);
    for j = 1:n-1

        p_temp = uquatmulti(P(j),P(j+1));

        temp1 = uquatmulti(P(j),Q(j+1));

        temp2 = uquatmulti(Q(j),P(j+1));

        Q(j+1) = temp1 + temp2;
        P(j+1) = p_temp;
    end

P_final = P(n);  % Final Rotation Part Qr 
Q_final = Q(n);  % Final Translation Part Qt
end