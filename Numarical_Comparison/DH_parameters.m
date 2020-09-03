clear all;
clc;
close all;
%% Kuka KR3 R540 DH Parameters
L_kr3 (1) = Revolute('d',0.345  ,'a',0.02   ,'alpha',pi/2       ,'qlim',[-2.9671 2.9671],   'offset',0);
L_kr3 (2) = Revolute('d',0      ,'a',0.260  ,'alpha',0          ,'qlim',[-0.8727 2.9671],   'offset',0);
L_kr3 (3) = Revolute('d',0      ,'a',0.02   ,'alpha',pi/2       ,'qlim',[-2.7053 1.9198],   'offset',pi/2);
L_kr3 (4) = Revolute('d',0.260  ,'a',0      ,'alpha',(-pi/2)    ,'qlim',[-3.0543 3.0543],   'offset',(-80*pi)/180);
L_kr3 (5) = Revolute('d',0      ,'a',0      ,'alpha',(pi/2)     ,'qlim',[-2.0945 2.0945],   'offset',0);
L_kr3 (6) = Revolute('d',0.075  ,'a',0      ,'alpha',0          ,'qlim',[-6.1087 6.1087],   'offset',0);
KR3 = SerialLink(L_kr3,'name','KUKA KR3 Agilus');
KR3.manufacturer = 'JD & M';
KR3.ikineType = 'KR3';

%% ABB IRB140  DH Parameters
mdl_irb140;

%% Mitsubishi RV-2AJ  DH Parameters
L_rv2 (1) = Revolute('d',0.300  ,'a',0      ,'alpha',-pi/2      ,'qlim',[-2.6180 2.6180],   'offset',0);
L_rv2 (2) = Revolute('d',0      ,'a',0.250  ,'alpha',0          ,'qlim',[-1.0472 2.0944],   'offset',-pi/2);
L_rv2 (3) = Revolute('d',0      ,'a',0.160  ,'alpha',0          ,'qlim',[-1.9199 2.0944],   'offset',0);
L_rv2 (4) = Revolute('d',0      ,'a',0      ,'alpha',-pi/2      ,'qlim',[-1.5708 1.5708],   'offset',-pi/2);
L_rv2 (5) = Revolute('d',0.072  ,'a',0      ,'alpha',0          ,'qlim',[-3.4907 3.4907],   'offset',0);
rv2 = SerialLink(L_rv2,'name','RV-2AJ');
rv2.manufacturer = 'JD & M';
