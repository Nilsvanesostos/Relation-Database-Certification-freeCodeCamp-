#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --tuples-only -c"
RANDOM_NUMBER=$(($RANDOM % 1000 + 1))

# entering message

echo "Enter your username:"
read USERNAME

# check if it's his first time playing

NAME=$($PSQL "SELECT name FROM games WHERE name='$USERNAME'")

# if not found 

if [[ -z $NAME ]]
then
  # it is his first time playing 

  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else 
  # he has been here before

  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE name='$USERNAME'")
  COUNT=$($PSQL "SELECT COUNT(number_of_guesses) FROM games WHERE name='$USERNAME'")

  echo -e "\nWelcome back, $USERNAME! You have played $COUNT games, and your best game took $BEST_GAME guesses."
fi

# do the game loop

COUNT_GUESS=0
NUMBER_GUESS=-1

until [ $NUMBER_GUESS == $RANDOM_NUMBER ]
do
  echo -e "\nGuess the secret number between 1 and 1000:"
  read NUMBER_GUESS

  # if not a number 

  if [[ ! $NUMBER_GUESS =~ ^[0-9]+$ ]]
  then
    # pop an error

    echo -e "\nThat is not an integer, guess again:"
  else
    # increase the count

    (( GUESS_COUNT++ ))

    if [[ NUMBER_GUESS -gt RANDOM_NUMBER ]]
    then
      # if the number guessed is lower

      echo -e "It's lower than that, guess again:"
    else
      # if the number guessed is higher

      echo -e "It's higher than that, guess again:"
    fi
  fi

done

# insert the data in the database

INSERT_DATA=$($PSQL "INSERT INTO games(name, number_of_guesses) VALUES('$USERNAME',$COUNT_GUESS")

# finish the game

echo -e "\nYou guessed it in $COUNT_GUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"
