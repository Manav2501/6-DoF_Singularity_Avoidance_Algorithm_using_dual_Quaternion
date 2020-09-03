function [jacob,jacob_trans,jacob_rot] = KR3_JacobQ(Th)

    load('kr3_jacobQ.mat');
    syms th1 th2 th3 th4 th5 th6;     
    jacob = double(subs(Jacobian,{th1,th2,th3,th4,th5,th6},{Th(1),Th(2),Th(3),Th(4),Th(5),Th(6)}));
    jacob_trans = double(subs(Jacobian1_3,{th1,th2,th3,th4,th5,th6},{Th(1),Th(2),Th(3),Th(4),Th(5),Th(6)}));
    jacob_rot = double(subs(Jacobian4_6,{th1,th2,th3,th4,th5,th6},{Th(1),Th(2),Th(3),Th(4),Th(5),Th(6)}));
end