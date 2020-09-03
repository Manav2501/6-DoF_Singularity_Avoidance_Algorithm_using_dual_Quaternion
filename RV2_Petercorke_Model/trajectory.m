% Generating the Quintic Polynomial Trajectory for the task space points.
function [traj,t] = trajectory(Points,TimeDuration)
    N = length(Points(1,:));
    for i=1:N
        trans(i,1) = Points(1,i);
        trans(i,2) = Points(2,i);
        trans(i,3) = Points(3,i);
        rot(i,1) = Points(4,i);
        rot(i,2) = Points(5,i);
        rot(i,3) = Points(6,i);
    end
    T = 0: TimeDuration/(N-1) :TimeDuration;
    for j=1:N-2
        distance(1,:) = [0 0 0];
        distance(N,:) = [0 0 0];
        angle(1,:) = [0 0 0];
        angle(N,:) = [0 0 0];
        Jerk(1,:) = [0 0 0];
        Jerk(N,:) = [0 0 0];

        velocity(1,:) = [0 0 0];
        velocity(N,:) = [0 0 0];
        omega(1,:) = [0 0 0];
        omega(N,:) = [0 0 0];

        acceleration(1,:) = [0 0 0];
        acceleration(N,:) = [0 0 0];
        alpha(1,:) = [0 0 0];
        alpha(N,:) = [0 0 0];
        
        Dx = Points(1,j+1) - Points(1,j);dt = T(1,j+1)-T(1,j);
        Dy = Points(2,j+1) - Points(2,j);
        Dz = Points(3,j+1) - Points(3,j);
        
        velocity(j+1,:) = [Dx/dt Dy/dt Dz/dt];
        
        Vx = velocity(j+1,1) - velocity(j,1);
        Vy = velocity(j+1,2) - velocity(j,2);
        Vz = velocity(j+1,3) - velocity(j,3);
        
        acceleration(j+1,:) = [Vx/dt Vy/dt Vz/dt];
        
        Ax = acceleration(j+1,1) - acceleration(j,1);
        Ay = acceleration(j+1,2) - acceleration(j,2);
        Az = acceleration(j+1,3) - acceleration(j,3);
        
        Jerk(j+1,:) = [Ax/dt Ay/dt Az/dt];

        Rx = Points(4,j+1) - Points(4,j);
        Ry = Points(5,j+1) - Points(5,j);
        Rz = Points(6,j+1) - Points(6,j);
        
        omega(j+1,:) = [Rx/dt Ry/dt Rz/dt];
        
        Rvx = omega(j+1,1) - omega(j,1);
        Rvy = omega(j+1,2) - omega(j,2);
        Rvz = omega(j+1,3) - omega(j,3);
        
        alpha(j+1,:) = [Rvx/dt Rvy/dt Rvz/dt];
    end
    
    plot(T,Points(1,:)'.*1000,'r');
    hold on
    plot(T,Points(2,:)'.*1000,'g');
    plot(T,Points(3,:)'.*1000,'b');
    legend('Pos_X','Pos_Y','Pos_Z');
    xlabel('Time');
    ylabel('Position');
    hold off
    grid on
    for k=1:N-1
        q0 = trans(k,:);
        v0 = velocity(k,:);
        ac0 = acceleration(k,:);
        q1 = trans(k+1,:);
        v1 = velocity(k+1,:);
        ac1 = acceleration(k+1,:);
        t0 = 0;
        tf = TimeDuration/(N-1);
        
        qr0 = rot(k,:);
        vr0 = omega(k,:);
        acr0 = alpha(k,:);
        qr1 = rot(k+1,:);
        vr1 = omega(k+1,:);
        acr1 = alpha(k+1,:);
        
        t = linspace(t0,tf,2);
        c = ones(size(t));
        for l=1:3
            M(:,:,l) = [ 1  t0 t0.^2 t0.^3   t0.^4    t0.^5;
						 0  1  2*t0  3*t0.^2 4*t0.^3  5*t0.^4;
						 0  0  2     6*t0    12*t0.^2 20*t0.^3;
						 1  tf tf.^2 tf.^3   tf.^4    tf.^5;
						 0  1  2*tf  3*tf.^2 4*tf.^3  5*tf.^4;
						 0  0  2     6*tf    12*tf.^2 20*tf.^3];

            b(:,l)=[q0(l); v0(l); ac0(l); q1(l); v1(l); ac1(l)];
            a(:,l) = inv(M(:,:,l))*b(:,l);

            br(:,l)=[qr0(l); vr0(l); acr0(l); qr1(l); vr1(l); acr1(l)];
            ar(:,l) = inv(M(:,:,l))*br(:,l);
            
            qd(:,l) = a(1,l).*c + a(2,l).*t +a(3,l).*t.^2 + a(4,l).*t.^3 +a(5,l).*t.^4 + a(6,l).*t.^5;
            vd(:,l) = a(2,l).*c +2*a(3,l).*t +3*a(4,l).*t.^2 +4*a(5,l).*t.^3 +5*a(6,l).*t.^4;
            ad(:,l) = 2*a(3,l).*c + 6*a(4,l).*t +12*a(5,l).*t.^2 +20*a(6,l).*t.^3;
            
            qrd(:,l) = ar(1,l).*c + ar(2,l).*t +ar(3,l).*t.^2 + ar(4,l).*t.^3 +ar(5,l).*t.^4 + ar(6,l).*t.^5;
            vrd(:,l) = ar(2,l).*c +2*ar(3,l).*t +3*ar(4,l).*t.^2 +4*ar(5,l).*t.^3 +5*ar(6,l).*t.^4;
            ard(:,l) = 2*ar(3,l).*c + 6*ar(4,l).*t +12*ar(5,l).*t.^2 +20*ar(6,l).*t.^3;

        end
        for m = 1:length(t)-1
            traj(:,:,m,k) = transl(qd(m,:)) * rpy2tr(qrd(m,1),qrd(m,2),qrd(m,3));
        end   
    end
end
