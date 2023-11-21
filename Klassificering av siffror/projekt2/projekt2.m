%Version 2 
%Den h?r kommer att funka 
%Hoppas jag

%R?tt tr?g algoritm d? tv? stycken vektorer med 256 dimensioner ska
%j?mf?ras 2007x4921 g?nger 

clear
clc
load uspsDigits.mat
tic 
%Skapar 256x1-vektorer 
trainDigitsR = zeros(256,1,7291);
testDigitsR = zeros(256,1,2007);

for t = 1:1:7291 
    %Reshapear trainDigits till 256x1
    trainDigitsR(:,:,t) = reshape(trainDigits(:,:,t), [1 256]); 
end 



for t = 1:1:2007
    %Reshapear testDigits till 256x1
    testDigitsR(:,:,t) = reshape(testDigits(:,:,t), [1 256]);
end


q = 0;
%Skapar vektor som lagrar utr?knade v?rdet p? normalen mellan
%de tv? siffror som j?mf?rs
testNorm = nan(7291,1);

%R?knare f?r algoritmens korrekthet
sant = 0; 
falsk = 0; 

%Loop f?r klassificering av de 2007 testsiffrorna
for t = 1:1:2007
    
    %S?tter till godtyckligt "h?gt" v?rde
    norm1 = 100;
    
    %Loop som j?mf?r en av testsiffrorna med en tr?ningssiffra
    for o = 1:1:7291
        
        %R?knar normalen mellan testsiffran och den aktuella
        %tr?ningssiffran
        testNorm(o,1) = norm(testDigitsR(:,:,t) - trainDigitsR(:,:,o));
        
        %If-sats som h?ller koll p? vilken siffra som varit n?rmsta granne
        %bland tr?ningssiffrorna
        if testNorm(o,1) < norm1
            norm1 = testNorm(o,1);
            q = o;
        end
        
        
    end
    
   %R?knare som h?ller koll p? hur m?nga r?tt respektive fel algoritmen
   %gjort
   if testAns(t) == trainAns(q) 
       sant = sant+1;
   else 
       falsk = falsk+1;
      
       %Kommandona nedan kan anv?ndas om det ?nskas att visa vilka siffror
       %som klassificerats fel
       % ima(testDigits(:,:,t))
       % pause(0.5)
        
   end
   
    
end
toc

%Visar hur korrekt algoritmen varit i procent
disp([num2str((sant/2007)*100), '% Korreta klassificeringar'])