function [jacob,jacob_trans,jacob_rot] = ABB_JacobQ(Th)

    load('abb_jacobQ.mat');
    syms th1 th2 th3 th4 th5 th6;        
    jacob = double(subs(Jacobian,{th1,th2,th3,th4,th5,th6},{Th(1),Th(2),Th(3),Th(4),Th(5),Th(6)}));
    jacob_trans = double(subs(Jacobian(6:end,1:3),{th1,th2,th3,th4,th5,th6},{Th(1),Th(2),Th(3),Th(4),Th(5),Th(6)}));
    jacob_rot = double(subs(Jacobian(1:4,:),{th1,th2,th3,th4,th5,th6},{Th(1),Th(2),Th(3),Th(4),Th(5),Th(6)}));
end