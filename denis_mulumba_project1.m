clc
close all

%1. subplot(2,2,1) illustrating Fn and Rn computed with the initial values F1 = 500,
%R1 = 200 and the model parameters α = 0.5, β = 0.4, γ = 0.1, δ = 0.17
%2. subplot(2,2,2) illustrating Fn and Rn computed with the initial values F1 = 500,
%R1 = 200 and the model parameters α = 0.5, β = 0.4, γ = 0.1, δ = 0.05
%3. subplot(2,2,3) illustrating Fn and Rn computed with the initial values F1 = 10,
%R1 = 200 and the model parameters α = 0.5, β = 0.4, γ = 0.1, δ = 0.05
%4. subplot(2,2,4) illustrating Fn and Rn computed with the initial values F1 = 2300,
%R1 = 200 and the model parameters α = 0.5, β = 0.4, γ = 0.1, δ = 0.05

%Calling the function with given values of thearguments
[Fox_n1,Rab_n1,n1]= Prey_Pred_model(0.17,500);
[Fox_n2,Rab_n2,n2]= Prey_Pred_model(0.05,500);
[Fox_n3,Rab_n3,n3]= Prey_Pred_model(0.05,10);
[Fox_n4,Rab_n4,n4]= Prey_Pred_model(0.05,2300);

% Fox_new and Rab_new represent the number of new foxes and rabbits,
% respectively, for a given sigma and foxes.
%F_init and Rab_init represent the initial number of foxes and rabits
%respectively.


%Subplots for the four cases under cosideration%%%
subplot(2,2,1)
plot(n1,Fox_n1), hold on
plot(n1,Rab_n1)
xlabel('n')
ylabel('Foxes and Rabbits ')
title('sigma = 0.17 and F1= 500')
legend('Foxes', ' Rabbits')
axis tight


subplot(2,2,2)
plot(n2,Fox_n2), hold on
plot(n2,Rab_n2)
xlabel('n')
ylabel('Foxes and Rabbits ')
title('sigma = 0.05 and F1 = 500')
legend('Foxes', ' Rabbits')
axis tight

subplot(2,2,3)
plot(n3,Fox_n3), hold on
plot(n3,Rab_n3)
xlabel('n')
ylabel('Foxes and Rabbits ')
title('sigma = 0.05 and F1 = 10')
legend('Foxes', ' Rabbits')
axis tight

subplot(2,2,4)
plot(n4,Fox_n4), hold on
plot(n4,Rab_n4)
xlabel('n')
ylabel('Foxes and Rabbits')
title('sigma = 0.05 and F1 = 2300')
legend('Foxes', ' Rabbits')
axis tight
%Defining a function that takes in delta and the initial number of Foxes and outputs n, the numer of new Rabbits and that of Foxes

function [Fox_n,Rab_n,n]= Prey_Pred_model(sigma,F1) 
alpha = 0.5; 
beta = 0.4;
gamma = 0.1;
N = 30;                     
n = linspace(1,30,30); %inspace to form an array of 30 values of n fom 1 to 30
%Initial number of Foxes ans Rabbits
Fox_int = F1;      
Rab_int = 200;

%Setting up arrays of ones that will later be updated and used to store new numbers of Foxes and Rabbits
Fox_n = ones(length(n),1);
Rab_n = ones(length(n),1);
%Updating the arrays with the initial values
Fox_n(1) = Fox_int;
Rab_n(1) = Rab_int;
for i = 1:N-1 %For loop to look for the other 29 values of Fox_new and Rab_new
    Fox_n(i+1) = Fox_n(i)- alpha*Fox_n(i) + beta*Rab_n(i); %The model for foxes
    Rab_n(i+1)= Rab_n(i) + gamma*Rab_n(i)-sigma*Fox_n(i); %Model for rabbits
end
end

%%%%%%ommenting on the plots%%%%%%%%

% For Subplot(2,2,1) with the initial number of Rabbits as 200 and 500
% foxes at the begining, the number of rabbits and that of foxes
% dicreases with time until a time when both the prey and predator are
% nearly completely die out. This is because of a bigger number of foxes
%initially present that predate on a relatively fewer number of rabbits.
% However, with time, many foxes will die out in the battle for food
% (rabbits) and only a few will survive due to reproduction for both the
% prey and predator.

%For Sobplot(2,2,2) with F1 = 500 but with a low late of decrease of
%rabbits, the number of foxes presents drops rapidly in early days sice
%the number of foxes rabbits initially is less than half the number of
%foxes at that  time. However, the population of foxes grows with time
%since the number of rabbits also grows, This is dues to a smaller
%decrease rate of rabbits. It implies that foxes have food to survive and
%hence coexistence.

%For Subplot(2,2,3), with a smaller decrease rate for food(rabbits) but
%with much less foxes at the start, the number of foxes will increase
%with time but will never surpass the number of rabbits. The initial
%number of foxes allows coexistance since foxes have food. Also, since
%the decrease rate of rabbits is small, the number of rabbits grows
%steadly with time.

%For subplot(2,2,4), with the initial number of foxes much bigger than
%that of their food (rabits), foxes will wipe out rabbits. This will also
%lead to foxes wiping out lacking food to feed on, This explains the
%drastic drop of boh curves in this subplot. However, these curves curves
%do not completely go to zero with time due to reproduction.