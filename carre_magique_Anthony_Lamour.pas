program carre_magique;

uses crt;

{ALGO carre magique
BUT faire un carre magique de taille impaire
SORTIE carre magique

CONST
	MAX=7
	
procedure affichage(carre:tableau)
BUT afficher le tableau

VAR
	i,j:ENTIER
DEBUT
	POUR i DE 1 A MAX FAIRE
		POUR j DE 1 A MAX FAIRE
			SI carre[i,j]<10 ALORS
				ECRIRE"0"&carre[i,j]&" "
			SINON
				ECRIRE carre[i,j]" "
			FINSI
		FINPOUR
	FINPOUR
FINPROCEDURE

fonction initTab(carre:tableau):tableau
BUT initialiser le tableau avec des 0

VAR
	i,j:ENTIER
DEBUT
	POUR i DE 1 A MAX FAIRE
		POUR j DE 1 A MAX FAIRE
			carre[i,j]<-0
		FINPOUR
	FINPOUR
	i<-(MAX div 2)
	j<-(MAX div 2)+1
	carre[i,j]<-1
	initTab<-carre
FINFONCTION

fonction remplirTab(carre:tableau):tableau;
BUT remplir le carre magique

VAR
	i,j,compteur:ENTIER
DEBUT
	i<-(MAX div 2)
	j<-(MAX div 2)+1
	POUR compteur DE 2 A (MAX*MAX) FAIRE
		SI j+1>MAX ALORS
			j<-0
		FINSI
		SI i-1=0 ALORS
			i<-MAX+1
		FINSI
		i<-i-1
		j<-j+1
		SI carre[i,j]<>0 ALORS
			TANTQUE carre[i,j]<>0 FAIRE
				SI j-1=0 ALORS		
					j<-MAX+1
				FINSI
				SI i-1=0 ALORS
					i<-MAX+1
				FINSI
				i<-i-1
				j<-j-1
			FINTANTQUE
		FINSI
		carre[i,j]<-compteur
	FINPOUR
	remplirTab<-carre
FINFONCTION

VAR
	carre:TABLEAU[1..MAX,1..MAX] D'ENTIER

DEBUT

	carre<-initTab(carre)
	carre<-remplirTab(carre)
	affichage(carre)

FIN
}

CONST
	MAX=5;{Taille du carre magique}

TYPE
	Tab2dim=array[1..MAX,1..MAX] of integer;{creation du type Tab2dim utiliser pour pouvoir ce servir du Tableau carre dans les fonctions et procedure}
	
procedure affichage(carre:Tab2dim);{procedure permettant d'afficher le Tableau (ici la carre magique}
VAR
	i,j:integer;{variables locales de la fonction permettant de parcourir le Tableau}
BEGIN
	FOR i:=1 to MAX do
		begin
			for j:=1 to MAX do
				begin
					if carre[i,j]<10 then{Commande pour afficher un 0 devant la valeur si elle est inferieur a 10 afin de rendre le resltat plus lisible}
						begin
							write('0',carre[i,j],' ');
						end
					else
						begin
							write(carre[i,j],' ');{ecrire chaque ligne du Tableau}
						end;
				end;
				writeln();{saut de ligne a la fin de chaque ligne du Tableau}
		end;
END;

function initTab(carre:Tab2dim):Tab2dim;{fonction servant a initialiser le Tableau avec des 0}
VAR
	i,j:integer;{variables locales de la fonction permettant de parcourir le Tableau}
BEGIN
	FOR i:=1 to MAX DO
		begin
			FOR j:=1 to MAX DO
				begin
					carre[i,j]:=0;{commande pour mettre un 0 dans chaque case du Tableau}
				end;
		end;
	i:=(MAX div 2);{coordonnee du 1}
	j:=(MAX div 2)+1;{coordonnee du 1}
	carre[i,j]:=1;{positioinnement du 1}
	initTab:=carre;	
END;

function remplirTab(carre:Tab2dim):Tab2dim;{fonction servant a remplir le Tableau}
VAR
	i,j,compteur:integer;{variables locales de la fonction permettant de parcourir le Tableau compteur represente le chiffre qui sera placer dans la case}
BEGIN
	i:=(MAX div 2);{coordonnee du 1}
	j:=(MAX div 2)+1;{coordonnee du 1}
	FOR compteur:=2 TO (MAX*MAX)DO
		begin
			IF j+1>MAX then{verification de i et j si jamais j est hors du Tableau il revient a 0 et si i sort du Tableau il revient a MAX+1 (+1 car il faut aussi remplir la derniere ligne)}
				begin
					j:=0;
				end;
			IF i-1=0 then
				begin
					i:=MAX+1;
				end;
			i:=i-1;{les coordonnee prennent leurs nouvelles valeurs se qui correspond aux deplacement}
			j:=j+1;
			IF carre[i,j]<>0 THEN{verification de l'interrieur de la case si il y a qqch alors...}
				begin
					WHILE carre[i,j]<>0 DO{... jusqu'a ce que la case soit vide faire Nord Ouest}
						begin
							IF j-1=0 then{verification de i et j si jamais j est hors du Tableau il revient a MAX+1 et si i sort du Tableau il revient a MAX+1 (+1 car il faut aussi remplir la derniere ligne et la derniere colonne)}		
								begin
									j:=MAX+1;
								end;
							IF i-1=0 then
								begin
									i:=MAX+1;
								end;
							i:=i-1;{les coordonnee prennent leurs nouvelles valeurs}
							j:=j-1;
						end;
				end;
			carre[i,j]:=compteur;{remplissage du Tableau}
		end;
	remplirTab:=carre;
END;

VAR
	carre:array[1..MAX,1..MAX] of integer;{Tableau correspondant au carre magique}

BEGIN

	clrscr;{nettoyage d'ecran}
	writeln('Programme du carre magique :');{nom du programme}
	writeln('Appuyez sur entrer pour lancer le programme');{invitation a lancer le programme}
	readln;
	writeln('Voici un carre magique de ',MAX,' par ',MAX,' :');
	writeln();
	carre:=initTab(carre);{initialisation du carre avec des 0}
	carre:=remplirTab(carre);{remplissage du carre}
	affichage(carre);{affichage du carre}
	writeln();
	writeln('Appuiyez sur entrer pour quitter le programme.');
	readln;
	
END.