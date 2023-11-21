

%Medelvärdesalgoritm
%Funkar fantastiskt bra 
%Gör det den ska, Snabbare än den andra men lite sämre 

clear
clc
load uspsDigits.mat
tic
%Skapar 256x1-vektorer
trainDigitsR = zeros(256,1,7291);
testDigitsR = zeros(256,1,2007);
medelR = zeros(256,1,10);

%Matris som lagrar datan för medelvärdet på respektive siffra
medel = zeros(16,16,10);

%Vektor som lagrar facit till medelv?rdena 
medelAns = [0;1;2;3;4;5;6;7;8;9];

for t = 1:1:7291 

    %Reshapear trainDigits till 256x1
    trainDigitsR(:,:,t) = reshape(trainDigits(:,:,t), [1 256]);
    
end 



for t = 1:1:2007
    
    %Reshapear testDigits till 256x1
    testDigitsR(:,:,t) = reshape(testDigits(:,:,t), [1 256]);
end


%Loop som räknar ut medelvärdet på varje siffra och lagrar siffra 0 på
%plats 1, siffra 1 på plats 2 osv i matrisen "medel" 
for t = 1:1:10
    
    %R?knare f?r antalet siffror som adderats
    k = 0;

    for p = 1:1:7291
        
        %If-sats som plockar ut de siffror som ?r lika och adderar dom
        if trainAns(p,1) == t-1
            
            medel(:,:,t) = medel(:,:,t) + trainDigits(:,:,p);
            k = k+1;
        end
        
    end
    
    %Delar med antalet adderade siffror
    medel(:,:,t) = medel(:,:,t)/k;
end


for t = 1:1:10 

    %Reshapear medel till 256x1
    medelR(:,:,t) = reshape(medel(:,:,t), [1 256]);
    
end 


q = 0;

%Skapar vektor som lagrar utr?knade v?rdet p? normalen mellan
%siffran och medelv?rdet som j?mf?rs 
testNorm = nan(10,1);

%R?knare f?r algoritmens korrekthet
sant = 0; 
falsk = 0; 

%Loop f?r klassificering av de 2007 testsiffrorna
for t = 1:1:2007
    
    %S?tter till godtyckligt "h?gt" v?rde
    norm1 = 100;
    
    %Loop som j?mf?r en av testsiffrorna med en medelv?rdessiffra
    for o = 1:1:10
        
        %R?knar normalen mellan testsiffran och den aktuella
        %medelv?rdessiffran
        testNorm(o,1) = norm(testDigitsR(:,:,t) - medelR(:,:,o));
        
       
        %If-sats som h?ller koll p? vilken siffra som varit n?rmsta granne
        %bland medelv?rdessiffrorna
        if testNorm(o,1) < norm1
            norm1 = testNorm(o,1);
            q = o; 
        end
        
        
    end
    
   %R?knare som h?ller koll p? hur m?nga r?tt respektive fel algoritmen
   %gjort
   if testAns(t) == medelAns(q) 
       sant = sant+1;
   else 
       falsk = falsk+1;
       
%        Kommandona nedan kan anv?ndas om det ?nskas att visa vilka siffror
%        som klassificerats fel
%        ima(testDigits(:,:,t))
%        pause(0.5)
%        ima(medel(:,:,1))
%        pause(0.5)

       
   end 
end
toc
%Visar hur korrekt algoritmen varit i procent
disp([num2str((sant/2007)*100), '% Korreta klassificeringar'])