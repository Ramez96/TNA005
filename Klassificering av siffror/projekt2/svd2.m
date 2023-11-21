%ProjektionsAlgoritm
%Den ?r s?kert bra n?r man kommer p? hur man ska g?ra
%Linj?r algebra osvosv

clear
clc
load uspsDigits.mat

[trainAnsSort,I] = sort(trainAns);

sortTrain = trainDigits(:,:,I);

SVDAns = [0;1;2;3;4;5;6;7;8;9];

n = [0;0;0;0;0;0;0;0;0;0];

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

test2 = zeros(16,16,100);
test2R = zeros(256,1,100);

for t = 1:1:2007
    
    if testAns(t,1) == siffra
        x = x+1;
        test2(:,:,x) = testDigits(:,:,t);
        
        test2R(:,:,x) = testDigitsR(:,:,t);
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
        
        testNorm(o,1) = norm(test2R(:,1,t) - Us(:,:,o) * Us(:,:,o).' * test2R(:,1,t));
        
       
        %If-sats som h?ller koll p? vilken siffra som varit n?rmsta granne
        %bland medelv?rdessiffrorna
        if testNorm(o,1) < norm1
            norm1 = testNorm(o,1);
            q = o; 
        end
        
        
    end
    
   %R?knare som h?ller koll p? hur m?nga fel algoritmen
   %gjort och hur m?nga av felen som klassificeras som ettor
   if siffra ~= SVDAns(q)
       falsk = falsk+1;
       
    
      
       
%        Kommandona nedan kan anv?ndas om det ?nskas att visa vilka siffror
%        som klassificerats fel
         ima(test2(:,:,t))
         pause(1.0)

      
      
     
        if SVDAns(q) == 0
            n(1,1) = n(1,1) + 1;
            
        elseif SVDAns(q) == 1
            n(2,1) = n(2,1) + 1;
            
        elseif SVDAns(q) == 2
            n(3,1) = n(3,1) + 1;
            
        elseif SVDAns(q) == 3
            n(4,1) = n(4,1) + 1;
            
        elseif SVDAns(q) == 4
            n(5,1) = n(5,1) + 1;
            
        elseif SVDAns(q) == 5
            n(6,1) = n(6,1) + 1;
            
        elseif SVDAns(q) == 6
            n(7,1) = n(7,1) + 1;
         
        elseif SVDAns(q) == 7
            n(8,1) = n(8,1) + 1;
            
        elseif SVDAns(q) == 8
            n(9,1) = n(9,1) + 1;
            
        elseif SVDAns(q) == 9
            n(10,1) = n(10,1) + 1;
        end
        
   end
   
    
end 

disp([num2str((falsk/x)*100), '% felaktiga klassificeringar'])