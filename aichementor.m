clc;
clearvars;
close all;

 
intro = ["☆◦Welcome to the AIChE Alumni Mentor Search!◦☆ "...
    "This script will recommend an alumni mentor based on your post-grad preferences.",...
    "Keep in mind that these are just recommendations!",...
    "All our alumni mentors are awesome and will give great advice°˖✧◝(⁰▿⁰)◜✧˖°",...
    "To restart the script at anytime press ctrl + c"];

for i = 1:length(intro)
    fprintf("%s\n", intro(i))
    pause(1)
end

twoRoadsDiverge = twoWolves("I would like to","Find an Alumni Mentor", "Learn more about this script", ...
    "mentor", "script");

switch twoRoadsDiverge
    case "mentor"
        academia_or_industry = twoWolves("Do you prefer a mentor in", "academia","industry", 1, 2);

        switch academia_or_industry
            case 1
                academiArray = ["Biotech/Pharma", "Kushal Nimkar or Nolan Origer";...
                                "Environmental", "Hanoz Santoke";
                                "Energy","Richa Ghosh or Nicholas Snyder"];
                
                pause(0.25)
                [specAcademia, numAcademia] = waffle(academiArray,"Please select a field");
                pause(0.25)
                fprintf('I recommend %s as your mentor!\n', specAcademia)
                pause(0.25)

                deepdive = twoWolves("View mentor careers?", "Yes", "I'm done", 1, 2);
                switch deepdive
                    case 1
                        switch numAcademia
                            case 1
                                bioArray = ["Kushal", "UC Berkeley, ChemE PhD Student";
                                    "Nolan", "UC Irvine Biomedical Engineering PhD Student"];
                                bioMentor = pseudoloop(bioArray,"select mentor");

                            case 2 
                                environmentArray = ["Hanoz Santoke","CSU Bakersfield, Associate Professor"];
                                environMentor = pseudoloop(environmentArray,"select mentor");
                                
                            case 3
                                energyArray = ["Richa","PhD Student, University of Illinois Urbana-Champaign";
                                               "Nicholas","Master's Student at EPFL (continuing to Ph.D. afterwards)"];
                        end
                end         

            case 2
                industryArray = ["Biotech/Pharma","Demetri Nicolaou, Albert Ma, or Emma Salvestrini";...
                                   "Consulting","Tarang Lal or Michael Soebroto";...
                                   "Energy","Lisa Luna, Stephanie Du, Nick Stoner, Mark Keller, Brandan Taing, or Sahil Singal";...
                                   "Food & Beverage","Bill Chuang or Pavni Misra";...
                                   "Sales","Chris Mazmanian";...
                                   "Semiconductor","Taylor Kashiwagi ";...
                                   "Tech","Tim Royer or Kathleen Young"];

                pause(0.25)
                [specIndustry, numIndustry] = waffle(industryArray,"Please select an industry");
                fprintf('I recommend %s as your mentor!\n', specIndustry)

                deepdive = twoWolves("View mentor careers?", "Yes", "I'm done", 1, 2);
                switch deepdive
                    case 1
                        switch numIndustry
                            case 1
                                bioArray = ["Demetri", "GRAIL/Software Engineer"; ...
                                    "Albert","CAI, CQV Engineer";
                                   "Emma","InstilBio/Research Associate"];
                                bioMentor = pseudoloop(bioArray,"select mentor");
                            case 2
                                consultArray = ["Tarang","PwC / Senior Associate";
                                   "Michael","ZS/Decision Analytics Associate"];
                                consultMentor = pseudoloop(consultArray, "please select mentor");
                            case 3
                                energyArray = ["Lisa","Chevron/Process Engineering Team Lead";...
                                            "Stephanie","Process Engineer at Phillips 66";...
                                           "Nick","Caterpillar Advanced Power Solutions Engineer";...
                                            "Mark","Chevron, Process Engineer";...
                                            "Brandan","Lyten, associate battery engineer ";...
                                            "Sahil","Aera Energy LLC/ Facilities Engineer"];
                                energyMentor = pseudoloop(energyArray, "select mentor");
                            case 4
                               
                                foodArray = ["Bill","Associate Downstream Process Engineer at Nature's Fynd";...
                                            "Pavni", "R&D Associate Engineer at PepsiCo"];
                                foodMentor = pseudoloop(foodArray, "select mentor");
                            case 5 
                                
                                salesArray = ["Chris", "Nalco Water District Representative"];
                                salesMentor = pseudoloop(salesArray, "select mentor");
                            case 6
                                semiArray = ["Taylor","Intel, Process Engineer"];
                                semiMentor = pseudoloop(semiArray, "select mentor");
                            case 7
                                techArray = ["Tim","TrueCar Product Analyst";...
                                              "Kathleen","Software Engineer (between jobs)"];
                                techMentor = pseudoloop(techArray, "select mentor");
                              
                        end
                    case 2
                        fprintf("thanks")
                end
        end
    case "script"

        manifesto = ["I dreamt up this Matlab script amidst the lazy heat of mid August.",...
            "As Alumni Chair, I wanted to create a simple way for mentees",...
            "to find a mentor that would best suit their needs.",...
            "While Matlab may not be the most efficient execution of such a project,",...
            "it's the language I'm most familiar with",...
            "(and I've grown quite fond of it after the 102B Thermo project with Prof. Sautet).",...
            "Feel free to send any script optimizations, critiques, or comments to aiche.alumni@gmail.com --",...
            "I am still learning and always open to hearing your thoughts!",...
            " ",...
            "Best,",...
            "Emily Chang", "AIChE Alumni Chair, C.O. 2024",...
            "August 13, 2022"];

        for i = 1:length(manifesto)
            fprintf("%s\n", manifesto(i))
            pause(1.5)
        end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Function Junction, what's your Conjunction?

function[sigma] = twoWolves(pack, alpha, beta, alphaA, betaB)
% twoWolves asks and answers a binary question based on user's choice.
% User must enter either 1 or 2
% input:
% input 'pack' is a binary question (string)
% input 'alpha' is option #1, 'alphaA' is corres. answer
% likewise for 'beta', 'betaB'
% Output:
% Output sigma is either answer #1 or answer #2

topDog= 0;
while topDog == 0
    topDog = 1;
    fprintf('%s:\n',pack)
    fprintf('1 - %s\n', alpha)
    fprintf('2 - %s\n', beta)
    field= input("");

    switch field
        case 1
            sigma = alphaA;
            
        case 2
            sigma = betaB;
            

        otherwise
            topDog = 0;
            fprintf('invalid entry! Try again\n')
            pause(0.5)
    end
end
end

function[syrup,strawberry] = waffle(batter, topping)
% waffle is similar to twoWolves, but for more than one path. In an array (batter), 
% column 1 contains the option and column 2 contains the corresponding
% answer.
% topping is the question (string)
% user must choose between choices 1-n

    crispy = 0;
    while crispy == 0
        fprintf("%s:\n", topping)
        for x =1:length(batter(:,1))
            fprintf("%i - %s\n", x, batter(x,1))
        end

        strawberry = input("");

        if strawberry == round(strawberry)&& strawberry>= 1&& strawberry<= length(batter(:,1))

            syrup = batter(strawberry,2);
            crispy = 1;

        elseif strawberry == 19
            joke = ["Two atoms walk into a bar.";
                    "The first one turns to the other and says 'I think I've lost an electron!'";
                    "The second one goes 'Are you sure?'";
                    "To which the first one replies"; "'I'm positive.'"];
            for i = 1:length(joke)
            fprintf("%s\n", joke(i))
            pause(1)
            end
            
        else
            fprintf('Invalid entry! Try again\n')
            pause(0.5)

        end
    end
end

function careerMentor = pseudoloop(careerArray,question)
% careerMentor builds off of waffle, but allows the user to go back and
% view other options as well.

goBack= 1;
while goBack == 1

    careerMentor = waffle(careerArray, question);
    fprintf("%s\n",careerMentor)
    pause(1.5)
    goBack = twoWolves("Go back?","Yes","I'm done", 1, 0); % go Back

end
end

% Coded with <3 at 447 Midvale Avenue, Westwood, CA 90024
