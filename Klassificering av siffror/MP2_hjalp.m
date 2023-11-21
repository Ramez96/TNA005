%% Matlab for forelasning 6

%% Handskrivna siffror:

clear; load uspsDigits;

% visa forsta 50 siffrorna i testmangden
for i = 1:50
  ima(testDigits(:,:,i))
  pause(0.1)
end

% ima(testDigits(:,:,3))
%print -depsc2 sampleDigit3.eps

%% Plotta data for morotter och potatisar

clear
load potatisMorotter
clf
scatter3(P_train(:,1),P_train(:,2),P_train(:,3))
hold on;
scatter3(M_train(:,1),M_train(:,2),M_train(:,3),'r')
axis equal;
xlim([0,15]); ylim([0,15]); zlim([0,8])
ylabel('x (hojd)')
xlabel('y (bredd)')
zlabel('z (vikt)')



%% Plotta in tva objekt som vi vill klassificera
clear
load potatisMorotter
clf
scatter3(P_train(:,1),P_train(:,2),P_train(:,3))
hold on;
scatter3(M_train(:,1),M_train(:,2),M_train(:,3),'r')
axis equal;
xlim([0,15]); ylim([0,15]); zlim([0,8])
ylabel('x (hojd)')
xlabel('y (bredd)')
zlabel('z (vikt)')

k = 3;
plot3(M_test(k,1),M_test(k,2),M_test(k,3),...
  'k-d','MarkerSize',8,'MarkerFaceColor','g')
k = 1;
plot3(P_test(k,1),P_test(k,2),P_test(k,3),...
  'k-d','MarkerSize',8,'MarkerFaceColor','m')

%%
% print -depsc2 morPot2nya.eps



%% Plotta in alla  objekt i testmangden
clear
load potatisMorotter
clf
scatter3(P_train(:,1),P_train(:,2),P_train(:,3))
hold on;
scatter3(M_train(:,1),M_train(:,2),M_train(:,3),'r')
axis equal;
xlim([0,15]); ylim([0,15]); zlim([0,8])
ylabel('x (hojd)')
xlabel('y (bredd)')
zlabel('z (vikt)')


plot3(M_test(:,1),M_test(:,2),M_test(:,3),...
  'kd','MarkerSize',8,'MarkerFaceColor','g')
k = 1;
plot3(P_test(:,1),P_test(:,2),P_test(:,3),...
  'kd','MarkerSize',8,'MarkerFaceColor','m')
title('Traningsmangd och testmangd')

%%
%print -depsc2 morPotTrainTest.eps




%% Plotta in alla  traningsobjekt tillsammans med medel for varje klass
clear
load potatisMorotter
clf
scatter3(P_train(:,1),P_train(:,2),P_train(:,3))
hold on;
scatter3(M_train(:,1),M_train(:,2),M_train(:,3),'r')
axis equal;
xlim([0,15]); ylim([0,15]); zlim([0,8])
ylabel('x (hojd)')
xlabel('y (bredd)')
zlabel('z (vikt)')

Mp = mean(P_train);
Mm = mean(M_train);

plot3(Mp(1),Mp(2),Mp(3),...
  'ks','MarkerSize',8,'MarkerFaceColor','b')
plot3(Mm(1),Mm(2),Mm(3),...
  'ks','MarkerSize',8,'MarkerFaceColor','r')



%%
%print -depsc2 morPotTrainMean.eps


%% Plotta medel for varje klass och alla objekt i testmangden
clear
load potatisMorotter
clf
plot3(P_test(:,1),P_test(:,2),P_test(:,3),'kd',...
  'MarkerSize',8,'MarkerFaceColor','g')
hold on;
plot3(M_test(:,1),M_test(:,2),M_test(:,3),'kd',...
  'MarkerSize',8,'MarkerFaceColor','m')
axis equal;
grid on
xlim([0,15]); ylim([0,15]); zlim([0,8])
ylabel('x (hojd)')
xlabel('y (bredd)')
zlabel('z (vikt)')

Mp = mean(P_train);
Mm = mean(M_train);

plot3(Mp(1),Mp(2),Mp(3),...
  'ks','MarkerSize',8,'MarkerFaceColor','b')
plot3(Mm(1),Mm(2),Mm(3),...
  'ks','MarkerSize',8,'MarkerFaceColor','r')

%%
%print -depsc2 morPotTestMean.eps

%%
clear
x = [1 2 3 4]';
y = [1 2 2 3]';

plot(x,y,'o','MarkerSize',10)
xlabel('x','FontSize',14)
ylabel('y(x)','FontSize',14)
title('Minstakvadratanpassning','FontSize',14)
axis equal
xlim([0,5])
grid on

A = [1 1; 1 2; 1 3; 1 4];
b = [1; 2; 2; 3];

s = A\b;

xx = linspace(0,5);
yy = s(1)+s(2)*xx;

hold on
plot(xx,yy,'-r')


% print -depsc2 leastSquares.eps


%%