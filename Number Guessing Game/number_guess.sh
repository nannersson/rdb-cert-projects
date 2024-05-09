#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess -t -c"

NEW_GAME() {
  NUMBER_TO_GUESS=$(( RANDOM % 1000 + 1 ))
  GUESS_COUNT=0
  echo Guess the secret number between 1 and 1000:
  GAME_LOOP
}

GAME_LOOP() {
  read GUESS_INPUT
  ((GUESS_COUNT++))

  if [[ ! $GUESS_INPUT =~ ^[0-9]+$ ]]
  then
    #not a number
    echo That is not an integer, guess again:
    GAME_LOOP
    return
  else

    if [[ $GUESS_INPUT > $NUMBER_TO_GUESS ]]
    then
      echo It\'s lower than that, guess again:
      GAME_LOOP
      return
    elif [[ $GUESS_INPUT < $NUMBER_TO_GUESS ]]
    then
      echo It\'s higher than that, guess again:
      GAME_LOOP
      return
    else
      #must be right
      echo -e "\nYou guessed it in $GUESS_COUNT tries. The secret number was $NUMBER_TO_GUESS. Nice job!"

      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games (user_id, guesses) VALUES ($USER_ID, $GUESS_COUNT)")
    fi

  fi
}

NEW_USER() {
  INSERT_RESULT=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  NEW_GAME
}

GET_USER() {
  SELECT_RESULT=$($PSQL "SELECT COUNT(*) as games_played, MIN(guesses) as best_game FROM games WHERE user_id=$USER_ID")
  IFS=" | " read GAMES_PLAYED BEST_GAME <<< $SELECT_RESULT
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  NEW_GAME
}

MAIN() {
  echo -e "\nEnter your username:"
  read USERNAME

  if [[ -z $USERNAME ]]
  then
    MAIN
    return
  fi
  
  #attempt to find user ID
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

  if [[ -z $USER_ID ]]
  then
    #not found, new user
    NEW_USER
  else
    GET_USER
  fi
}

MAIN