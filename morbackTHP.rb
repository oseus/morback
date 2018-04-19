class BoardCase
	# La classe a 2 attr_accessor, sa val, ainsi que son numéro de case
	attr_accessor :value, :numero_de_case

	def initialize(numero_de_case)
		@value = " "
		@numero_de_case = numero_de_case
	end
end

class Board

	attr_accessor 	:plateau
  # Quand la classe s'initialize, elle doit créer 9 instances BoardCases ici @case1--case9
  # Ces instances sont rangées dans une array qui est l'attr_accessor de la classe ici @plateau
	def initialize
		@case1 = BoardCase.new(1)
		@case2 = BoardCase.new(2)
		@case3 = BoardCase.new(3)
		@case4 = BoardCase.new(4)
		@case5 = BoardCase.new(5)
		@case6 = BoardCase.new(6)
		@case7 = BoardCase.new(7)
		@case8 = BoardCase.new(8)
		@case9 = BoardCase.new(9)
		@plateau = [@case1.value, @case2.value, @case3.value, @case4.value, @case5.value, @case6.value, @case7.value, @case8.value, @case9.value]
	end

	def play(joueur)
		# On choisi ici d'uiliser la méthode include pour vérifier l'état de la case si elle renvoit bien une dispo " "
		if @plateau.include? " "
			# Notre array tableau n'accepte que des chiffres donc on convertie systématiquement l'input du joueur en integer avec to_i
			input = gets.chomp.to_i
		#Si le choix de case par l'un des deux joueurs renvoie à la  victory == true alors la partie se termine
			if (@plateau[input - 1] === " ")
				@plateau[input - 1] = joueur.value
				victory(joueur)

		#Si la case est déjà prise la console CLI renvoie un message d'erreur
			else
				puts "Essaie encore!"
				play(joueur)
			end
	  #Si la case est déjà prise ET que toutes les cases sont prises ET qu'il n'y  a pas de vainqueur :
		else
			puts "Match nul, honneur aux chanceux et aux challengers"
			exit
		end

	end

	def display
		# On divise le plateau en 3 array pour chacune on coince un espace et un string par case avec .each do
		@plateau[0..2].each do |val|
			print "|" + val + " "
		end
		print "|"
		print "\n"
		print "----------"
		print "\n"
		@plateau[3..5].each do |val|
			print "|" + val + " "
		end
		print "|"
		print "\n"
		print "----------"
		print "\n"
		@plateau[6..8].each do |val|
			print "|" + val + " "
		end

		print "|"
		print "\n"
		puts " "

	end
	# On range ici les combinaisons gagnantes par array
	def victory(joueur)
		# On définit les 8 possibilités de victoires si elles se vérifient les 3 dans la combinaison donnée alors la partie s'arrête
		if (plateau[0] == joueur.value) && (plateau[1] == joueur.value) && (plateau[2] == joueur.value)
			puts "#{joueur.name} a eu plus de chance que toi ¯\_(ツ)_/¯"
			display
			exit

		elsif (plateau[3] == joueur.value) && (plateau[4] == joueur.value) && (plateau[5] == joueur.value)
			puts "#{joueur.name} a eu plus de chance que toi ¯\_(ツ)_/¯"
			display
			exit
		elsif (plateau[0] == joueur.value) && (plateau[3] == joueur.value) && (plateau[6] == joueur.value)
			puts "#{joueur.name} a eu plus de chance que toi ¯\_(ツ)_/¯"
			display
			exit
		elsif (plateau[2] == joueur.value) && (plateau[4] == joueur.value) && (plateau[6] == joueur.value)
			puts "#{joueur.name} a eu plus de chance que toi ¯\_(ツ)_/¯"
			display
			exit
		elsif (plateau[0] == joueur.value) && (plateau[4] == joueur.value) && (plateau[8] == joueur.value)
			puts "#{joueur.name} a eu plus de chance que toi ¯\_(ツ)_/¯"
			display
			exit
		elsif (plateau[2] == joueur.value) && (plateau[5] == joueur.value) && (plateau[8] == joueur.value)
			puts "#{joueur.name} a eu plus de chance que toi ¯\_(ツ)_/¯"
			display
			exit
		elsif (plateau[1] == joueur.value) && (plateau[4] == joueur.value) && (plateau[7] == joueur.value)
			puts "#{joueur.name} a eu plus de chance que toi ¯\_(ツ)_/¯"
			display
			exit
		else
			return
		end
	end

end

class Player
	#la classe a 2 attr_accessor, son nom, sa valeur (X ou O). Elle a un attr_writer : il a gagné ?
	attr_accessor :name, :value
	attr_writer :il_a_gagne

	def initialize(name, value)
		@name = name
		@value = value
	end

end

class Game
	attr_accessor :joueur
	# On démarre la partie, tableau de préz des combinaisons et un petit mot d'encouragement
	def initialize
		@joueur = joueur
		puts "T__tic__H__tac__P__toe__Team_Lyon06!"
		puts "Jouez les positions comme suit:"
		puts "1 | 2 | 3",
				 "---------",
		     "4 | 5 | 6",
		     "---------",
		     "7 | 8 | 9"
		print "\n"
		# end
		puts "Hello le chanceux(tu commences en 1er :Ъ), quel est ton pseudo ?"
		joueur1 = gets.chomp
		puts "Hello l'adversaire(courage le challenger!), quel est ton pseudo ?"
		joueur2 = gets.chomp
		# On appelle nos classes Joueurs et Board on crée 2 joueurs, on crée un board
		@joueur1 = Player.new(joueur1, "X")
		@joueur2 = Player.new(joueur2, "O")
		@nouveau_plateau = Board.new
	end

	def go
		turn
	end

	def turn
		# On affiche le plateau, demande au joueur il joue quoi, vérifie si un joueur a gagné, passe au joueur suivant
		while (true)
			@nouveau_plateau.display
			puts "#{@joueur1.name} honneur au chanceux, ton choix ?"
			@nouveau_plateau.play(@joueur1)
			@nouveau_plateau.display
			puts "#{@joueur2.name} honneur au challenger, ton choix?"
			@nouveau_plateau.play(@joueur2)
		end
	end

end
# On balance la game
Game.new.go
