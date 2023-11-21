%% Tests forelasning 7


%% K?r n?rmaste grannemetoden
clear
load potatisMorotter

[Up, Sp, Vp] = svd(P_train);
[Um, Sm, Vm] = svd(M_train');

abc =  P_train';
%% Projicera objekt fran traningsm?ngden pa dim-1 underrum

P1 = Up(:,1)*(Sp(1,1)*Vp(:,1))';
P1 = P1';

M1 = Um(:,1)*(Sm(1,1)*Vm(:,1))';
M1 = M1';

clf
scatter3(P_train(:,1),P_train(:,2),P_train(:,3),'b')
hold on;
scatter3(P1(:,1),P1(:,2),P1(:,3),'b','filled')
scatter3(M_train(:,1),M_train(:,2),M_train(:,3),'r')
scatter3(M1(:,1),M1(:,2),M1(:,3),'r','filled')

axis equal;
xlim([0,15]); ylim([0,15]); zlim([0,8])
ylabel('x (hojd)')
xlabel('y (bredd)')
zlabel('z (vikt)')

%%
%print -depsc2 morPotProjDim1.eps


%% Titta p? residualen vid projektion p? morotter 

[Xm, Rm, Nm] = compProjection(M_train',Um(:,1));
[Xp, Rp, Np] = compProjection(P_train',Um(:,1));

clf
plot(1:20,Np,'b-o')
hold on 
plot(21:40,Nm,'r-o')
legend('Residual for potatisar', 'Residual for morotter')
title('Projektion pa underrum for morotter')
xlabel('Norm av residual')
grid on
hold off
%%
%print -depsc2 projMorotDim1.eps



%% Titta p? residualen vid projektion p? potatisar 

[Xm, Rm, Nm] = compProjection(M_train',Up(:,1));
[Xp, Rp, Np] = compProjection(P_train',Up(:,1));

clf
plot(1:20,Np,'b-o')
hold on 
plot(21:40,Nm,'r-o')
legend('Residual for potatisar', 'Residual for morotter')
title('Projektion pa underrum for potatis')
xlabel('Norm av residual')
grid on 
hold off

%%
%print -depsc2 projPotatisDim1.eps


%%  Projicera objekt fr?n tr?ningsm?ngden p? dim-2 underrum

P2 = Up(:,1:2)*(Sp(1:2,1:2)*Vp(:,1:2)');
P2 = P2';

M2 = Um(:,1:2)*(Sm(1:2,1:2)*Vm(:,1:2)');
M2 = M2';

clf
scatter3(P2(:,1),P2(:,2),P2(:,3),'b','filled')
hold on;
scatter3(P_train(:,1),P_train(:,2),P_train(:,3),'b')
scatter3(M_train(:,1),M_train(:,2),M_train(:,3),'r')
scatter3(M2(:,1),M2(:,2),M2(:,3),'r','filled')

axis equal;
xlim([0,15]); ylim([0,15]); zlim([0,8])
ylabel('x (hojd)')
xlabel('y (bredd)')
zlabel('z (vikt)')

%%
%print -depsc2 morPotProjDim2.eps


%% Titta pa residualen vid projektion pa morotter 

[Xm, Rm, Nm] = compProjection(M_train',Um(:,1));
[Xp, Rp, Np] = compProjection(P_train',Um(:,1));

[Xm2, Rm2, Nm2] = compProjection(M_train',Um(:,1:2));
[Xp2, Rp2, Np2] = compProjection(P_train',Um(:,1:2));

clf
plot(1:20,Np2,'b-o')
hold on 
plot(21:40,Nm2,'r-o')
grid on
title('Projektion pa underrum av dim-2 for morotter')
xlabel('Norm av residual')

plot(1:20,Np,'b--o')
plot(21:40,Nm,'r--o')
legend('Residual for potatisar, dim-2', 'Residual for morotter, dim-2',...
  'Residual for potatisar, dim-1', 'Residual for morotter, dim-1')
%legend('Residual for potatisar, dim-2', 'Residual for morotter, dim-2')
hold off
%%
%print -depsc2 projMorotDim2.eps


%% Titta p? residualen vid projektion p? potatisar 

[Xm, Rm, Nm] = compProjection(M_train',Up(:,1));
[Xp, Rp, Np] = compProjection(P_train',Up(:,1));

[Xm2, Rm2, Nm2] = compProjection(M_train',Up(:,1:2));
[Xp2, Rp2, Np2] = compProjection(P_train',Up(:,1:2));

clf
plot(1:20,Np2,'b-o')
hold on 
plot(21:40,Nm2,'r-o')
%legend('Residual for potatisar', 'Residual for morotter')
title('Projektion pa underrum for potatis')
xlabel('Norm av residual')

plot(1:20,Np,'b--o')
plot(21:40,Nm,'r--o')
grid on 
legend('Residual for potatisar, dim-2', 'Residual for morotter, dim-2',...
  'Residual for potatisar, dim-1', 'Residual for morotter, dim-1')
hold off
%%
%print -depsc2 projPotatisDim2.eps



%% Kor algoritmen p? morotter fran testdata! Underrum av dim-1, 

[Xm, Rm, Nm_p] = compProjection(M_test',Up(:,1));
[Xm, Rm, Nm_m] = compProjection(M_test',Um(:,1));
clf
plot(Nm_p,'b-o')
hold on
plot(Nm_m,'r-o')
grid on
title('Morotter (testdata)')
xlabel('Morot')
ylabel('Residual')
legend('Underrum for potatis, dim-1', 'Underrum for morot, dim-1')

%%
%print -depsc2 testMorotDim1.eps


%% Kor algoritmen p? potatis fran testdata! Underrum av dim-1, 
[Xp, Rp, Np_p] = compProjection(P_test',Up(:,1));
[Xp, Rp, Np_m] = compProjection(P_test',Um(:,1));

clf
plot(Np_p,'b-o')
hold on
plot(Np_m,'r-o')
grid on
title('Potatis (testdata)')
xlabel('Potatis')
ylabel('Residual')
legend('Underrum for potatis, dim-1', 'Underrum for morot, dim-1')
%%
%print -depsc2 testPotatisDim1.eps


%% Kor algoritmen p? morotter fran testdata! Underrum av dim-2, 

[Xm, Rm, Nm_p] = compProjection(M_test',Up(:,1:2));
[Xm, Rm, Nm_m] = compProjection(M_test',Um(:,1:2));
clf
plot(Nm_p,'b-o')
hold on
plot(Nm_m,'r-o')
grid on
title('Morotter (testdata)')
xlabel('Morot')
ylabel('Residual')
legend('Underrum for potatis, dim-2', 'Underrum for morot, dim-2')
%%
%print -depsc2 testMorotDim2.eps


%% Kor algoritmen p? potatis fran testdata! Underrum av dim-2, 
[Xp, Rp, Np_p] = compProjection(P_test',Up(:,1:2));
[Xp, Rp, Np_m] = compProjection(P_test',Um(:,1:2));

clf
plot(Np_p,'b-o')
hold on
plot(Np_m,'r-o')
grid on
title('Potatis (testdata)')
xlabel('Potatis')
ylabel('Residual')
legend('Underrum for potatis, dim-2', 'Underrum for morot, dim-2')

%%
%print -depsc2 testPotatisDim2.eps


