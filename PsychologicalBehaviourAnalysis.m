%Τα ψυχομετρικά βάρη των χαρακτηριστικών για κάθε κίνητρο είναι σε έναν 26x9 πίνακα σε
%ενα αρχείο με όνομα ImpactMatrix.dat το οποίο γεμίζει τον πίνακα Α
fid=fopen('ImpactMatrix.dat','r');
A= fscanf(fid, '%f');
fclose(fid);

%παίρνω τα ψυχομετρικά βάρη των χαρακτηριστικών της προσωπικότητας ενος χρήστη χωριστά
%απο τον πινακα Α
Extraversion= A(1:1:26);
Openness_to_Experience= A(27:1:52);
Agreeableness= A(53:1:78);
Neuroticism= A(79:1:104);
Conscientiousness= A(105:1:130);
Self_esteem= A(131:1:156);
Collective_self_esteem= A(157:1:182);
Loneliness= A(183:1:208);
Shyness= A(209:1:234);
Narcissism= A(235:1:260);
Social_factors= A(261:1:286);
Altruism= A(287:1:312);
Social_interdependent_self_construal= A(313:1:338);

%διαβάζω τα στοιχεία του χρήστη που πήρα απο το ερωτηματολόγιο στην κλίμακα απο καθόλου=0 έως πάντα=9 (9
%διαφορετικά linguistic terms)και τα βάζω στον πίνακα Β
fid=fopen('UserMatrix.dat','r');
B= fscanf(fid, '%f');
fclose(fid);
ds = size(B);

%εδώ πολλαπλασιάζω τα στοιχεία του χρήστη με τα αντίστοιχα ψυχομετρικά βάρη
sExtraversion= zeros(ds);
sOpenness_to_Experience= zeros(ds);
sAgreeableness= zeros(ds);
sNeuroticism= zeros(ds);
sConscientiousness= zeros(ds);
sSelf_esteem= zeros(ds);
sCollective_self_esteem= zeros(ds);
sLoneliness= zeros(ds);
sShyness= zeros(ds);
sNarcissism= zeros(ds);
sSocial_factors= zeros(ds);
sAltruism= zeros(ds);
sSocial_interdependent_self_construal= zeros(ds);
for sd=1:1:ds
    sExtraversion(sd)=((100+Extraversion(sd))/100)*((B(sd)+9)/9);
    sOpenness_to_Experience(sd)= ((100+Openness_to_Experience(sd))/100)*((B(sd)+9)/9);
    sAgreeableness(sd)= ((100+Agreeableness(sd))/100)*((B(sd)+9)/9);
    sNeuroticism(sd)= ((100+Neuroticism(sd))/100)*((B(sd)+9)/9);
    sConscientiousness(sd)= ((100+Conscientiousness(sd))/100)*((B(sd)+9)/9);
    sSelf_esteem(sd)= ((100+Self_esteem(sd))/100)*((B(sd)+9)/9);
    sCollective_self_esteem(sd)= ((100+Collective_self_esteem(sd))/100)*((B(sd)+9)/9);
    sLoneliness(sd)= ((100+Loneliness(sd))/100)*((B(sd)+9)/9);
    sShyness(sd)= ((100+Shyness(sd))/100)*((B(sd)+9)/9);
    sNarcissism(sd)= ((100+Narcissism(sd))/100)*((B(sd)+9)/9);
    sSocial_factors(sd)= ((100+Social_factors(sd))/100)*((B(sd)+9)/9);
    sAltruism(sd)= ((100+Altruism(sd))/100)*((B(sd)+9)/9);
    sSocial_interdependent_self_construal(sd)= ((100+Social_interdependent_self_construal(sd))/100)*((B(sd)+9)/9);
end

%-------------Facebook User Profile Plot------------
%το ψυχολογικό προφίλ του χρήστη είναι η αναπαρασταση στον χωρο των
%κινήτρων/χαρακτηριστικο
z = [sExtraversion(1:1:26),sOpenness_to_Experience(1:1:26),sAgreeableness(1:1:26),sNeuroticism(1:1:26),sConscientiousness(1:1:26),sSelf_esteem(1:1:26),sCollective_self_esteem(1:1:26),sLoneliness(1:1:26),sShyness(1:1:26),sNarcissism(1:1:26),sSocial_factors(1:1:26),sAltruism(1:1:26),sSocial_interdependent_self_construal(1:1:26)];
figure
h = bar3(z);
colorbar
Personal = {'Extraversion', 'Openness to Experience', 'Agreeableness', 'Neuroticism', 'Conscientiousness', 'Self Esteem', 'Collective Self Esteem', 'Loneliness', 'Shyness', 'Narcissism', 'Social Factors', 'Altruism','Social Interdependent Self Construal'};
Motivations ={'Connected with creating and expressing oneself','Self-presentation','Expressing personal identity','The need to belong','Manifesting ones intent, e.g., to vote in elections','Controlling one’s self-image and creating a more desirable image compared to offline communication','Debating','Free texting','Self-status seeking','Connected with socializing','Looking for new relationships','Keeping up with friends','Family contact','Socializing','The need for communication','Connected with the need for information','Obtaining information','Reading information about others','Sharing information','Looking for help with their studies, e.g., sharing lecture notes or collaborating on projects','Connected with time management','Time-killing','Boredom','A task management tool, i.e. to organize time and store email addresses phone numbers or friends’ birthdays','Connected with fun','Entertainment'};
set(gca, 'YTick', 1:26)
set(gca, 'YTickLabel',Motivations )
set(gca, 'XTick', 1:13)
set(gca, 'XTickLabel',Personal )
title('Facebook User Profile')
xlabel('Characteristics')
ylabel('Motivations')
zlabel('Level')
%-------------------------

%διαδικασία εξαγωγής του Μ.Ο για το καθε χαρατηριστικο απο τα κινητρα του
perso1=sum(sExtraversion)/26;
perso2=sum(sOpenness_to_Experience)/26;
perso3=sum(sAgreeableness)/26;
perso4=sum(sNeuroticism)/26;
perso5=sum(sConscientiousness)/26;
perso6=sum(sSelf_esteem)/26;
perso7=sum(sCollective_self_esteem)/26;
perso8=sum(sLoneliness)/26;
perso9=sum(sShyness)/26;
perso10=sum(sNarcissism)/26;
perso11=sum(sSocial_factors)/26;
perso12=sum(sAltruism)/26;
perso13=sum(sSocial_interdependent_self_construal)/26;

%------Plot Personality Traits of Facebook User--------
User = [perso1,perso2,perso3,perso4,perso5,perso6,perso7,perso8,perso9,perso10,perso11,perso12,perso13];
figure
barh(User)
axis([0 4 0 14])
title('Personality Traits of Facebook User')
set(gca, 'YTick', 1:13)
set(gca, 'YTickLabel',Personal )
%------------------------------------------------------
