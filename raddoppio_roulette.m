%ogni volta riinizio una nuova partita con budget iniziale
simulazioni = 10000;
budget_finale = nan(simulazioni,1);

%simulazioni
for j=1:simulazioni

% Definisci la lunghezza della serie
lunghezza_serie = 1000;

% Genera una serie di 0 e 1 casuali con probabilità del 50% ciascuno
casuale = rand(1, lunghezza_serie - 1);

% Probabilità di ottenere 0 e 1
prob_0 = 15/37;
prob_1 = 22/37;

% Applica la distribuzione desiderata a ciascun elemento del vettore
roulette = zeros(size(casuale)); % Inizializza il vettore risultato con zeri
roulette(casuale <= prob_0) = 0; % Assegna 0 se il numero casuale è inferiore o uguale a prob_0
roulette(casuale > prob_0) = 1;  % Assegna 1 se il numero casuale è maggiore di prob_0
roulette(1000) = 1;


budget_iniziale = 10000;
budget = budget_iniziale;
puntata = 1;
cont = 1;

for i=1:lunghezza_serie
    budget = budget - cont*puntata; 
    if (budget<0) 
        budget = budget + cont*puntata;
        break;
    end
   
    if (roulette(i)==1)
        budget = budget + 2*cont*puntata;
        cont = 1;
        
    else cont = 2*cont;
        
        if (budget/budget_iniziale > 1.2)
            break;
        end
    end
end

budget_finale(j)=budget;

end

totale = sum(budget_finale)/(budget_iniziale*simulazioni)
media_budget = mean(budget_finale);
deviazione_std = std(budget_finale);
successi_rate = sum(budget_finale > budget_iniziale)/simulazioni;

%ogni volta riinizio una nuova partita con budget precedente
simulazioni = 10000;
budget_iniziale = 10000;
budget_ = budget_iniziale;
traccio_budget = nan(simulazioni,1);
puntata = 1;

%simulazioni
for j=1:simulazioni

% Definisci la lunghezza della serie
lunghezza_serie = 100;

% Genera una serie di 0 e 1 casuali con probabilità del 50% ciascuno
casuale = rand(1, lunghezza_serie - 1);

% Probabilità di ottenere 0 e 1
prob_0 = 15/37;
prob_1 = 22/37;

% Applica la distribuzione desiderata a ciascun elemento del vettore
roulette = zeros(size(casuale)); % Inizializza il vettore risultato con zeri
roulette(casuale <= prob_0) = 0; % Assegna 0 se il numero casuale è inferiore o uguale a prob_0
roulette(casuale > prob_0) = 1;  % Assegna 1 se il numero casuale è maggiore di prob_0
roulette(1000) = 1;

cont = 1;

for i=1:lunghezza_serie
    budget_ = budget_ - cont*puntata; 
    if (budget_<0) 
        budget_ = budget_ + cont*puntata;
        break;
    end
   
    if (roulette(i)==1)
        budget_ = budget_ + 2*cont*puntata;
        cont = 1;
        
    else cont = 2*cont;
        
        
    end
end

traccio_budget (j) = budget_;

end

totale = budget_/budget_iniziale

               
               
               
