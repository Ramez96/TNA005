%ProjektionsAlgoritm
%Den ?r s?kert bra n?r man kommer p? hur man ska g?ra
%Linj?r algebra osvosv

clear
clc
load uspsDigits.mat
tic
[trainAnsSort,I] = sort(trainAns);

sortTrain = trainDigits(:,:,I);

SVDAns = [0;1;2;3;4;5;6;7;8;9];

x = 0;
siffra = 1;
di = 10; 

trainDigitsR = zeros(256,2007);
testDigitsR = zeros(256,1,2007);

Us = zeros(256,di,10);

for t = 1:1:7291
    
    %Reshapear testDigits till 256x1
    trainDigitsR(:,t) = reshape(sortTrain(:,:,t), [1 256]);
end

for t = 1:1:2007
    
    %Reshapear testDigits till 256x1
    testDigitsR(:,:,t) = reshape(testDigits(:,:,t), [1 256]);
end

test1 = zeros(16,16,100);
test1R = zeros(256,1,100);

for t = 1:1:2007
    
    if testAns(t,1) == siffra
        x = x+1;
        test1(:,:,x) = testDigits(:,:,t);
        
        test1R(:,:,x) = testDigitsR(:,:,t);
    end
end



for t = 0:1:9 
      
    if t == 0
        
        [U,S,V] = svd(trainDigitsR(:,1:1194));
        
        Us(:,:,1) = U(:,1:di);
        
        
    elseif t == 1
        
        [U,S,V] = svd(trainDigitsR(:,1195:2199));
        
        Us(:,:,2) = U(:,1:di);
        
    elseif t == 2
   
        [U,S,V] = svd(trainDigitsR(:,2200:2930));
        
        Us(:,:,3) = U(:,1:di);
        
    elseif t == 3
        
        [U,S,V] = svd(trainDigitsR(:,2931:3588));
        
        Us(:,:,4) = U(:,1:di);
        
    elseif t == 4
        
        [U,S,V] = svd(trainDigitsR(:,3589:4240));
        
        Us(:,:,5) = U(:,1:di);
        
    elseif t == 5
        
        [U,S,V] = svd(trainDigitsR(:,4241:4796));
        
        Us(:,:,6) = U(:,1:di);
        
    elseif t == 6
        
        [U,S,V] = svd(trainDigitsR(:,4797:5460));
        
        Us(:,:,7) = U(:,1:di);
        
    elseif t == 7
        
        [U,S,V] = svd(trainDigitsR(:,5461:6105));
        
        Us(:,:,8) = U(:,1:di);
        
    elseif t == 8
        
        [U,S,V] = svd(trainDigitsR(:,6106:6647));
        
        Us(:,:,9) = U(:,1:di);
        
    elseif t == 9
        
        [U,S,V] = svd(trainDigitsR(:,6648:7291));
        
        Us(:,:,10) = U(:,1:di);
        
    end

end

q = 0;

%Skapar vektor som lagrar utr?knade v?rdet p? normalen mellan
%siffran och medelv?rdet som j?mf?rs 
testNorm = nan(10,1);

%R?knare f?r algoritmens korrekthet
sant = 0; 
falsk = 0; 


%Loop f?r klassificering av de 2007 testsiffrorna
for t = 1:1:x
    
    %S?tter till godtyckligt "h?gt" v?rde
    norm1 = 100;
    
    %Loop som j?mf?r en av testsiffrorna med en medelv?rdessiffra
    for o = 1:1:di
        
        %R?knar normalen mellan testsiffran och den aktuella
        %medelv?rdessiffran
        
        testNorm(o,1) = norm(test1R(:,1,t) - Us(:,:,o) * Us(:,:,o).' * test1R(:,1,t));
        
       
        %If-sats som h?ller koll p? vilken siffra som varit n?rmsta granne
        %bland medelv?rdessiffrorna
        if testNorm(o,1) < norm1
            norm1 = testNorm(o,1);
            q = o; 
        end
        
        
    end
    
   %R?knare som h?ller koll p? hur m?nga r?tt respektive fel algoritmen
   %gjort
   if siffra == SVDAns(q)
       sant = sant+1;

   else 
       falsk = falsk+1;
      
       
%        Kommandona nedan kan anv?ndas om det ?nskas att visa vilka siffror
%        som klassificerats fel
     ima(test1(:,:,t))
      pause(1.0)
        
   end
   
    
end 
toc

disp([num2str((sant/x)*100), '% Korreta klassificeringar'])
