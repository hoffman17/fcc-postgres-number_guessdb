#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
RANDOM_NUMBER=$((1 + $RANDOM % 1000))
NUMBER_OF_GUESSES=0

MAIN(){
  echo Enter your username:
  read USERNAME

  # query database if user exists
  USERNAME_QUERY=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")

  # if no username found in database
  if [[ -z $USERNAME_QUERY ]]
  then
    # insert username into database
    INSERT_USERNAME=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME')")

    # display welcome message
    echo Welcome, $USERNAME! It looks like this is your first time here.

    # start game
    START_GAME
  else
    # pull previous user's current stats
    USERNAME_STAT_PULL=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")
    echo "$USERNAME_STAT_PULL" | while IFS="|" read GAMES_PLAYED BEST_GAME
    do
      echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
    done
    START_GAME
  fi
}

START_GAME(){
  
  echo Guess the secret number between 1 and 1000:
  read USER_GUESS

  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    START_GAME
  fi

  # increment guesses
  ((NUMBER_OF_GUESSES++))

  # user guess was too low
  if (( USER_GUESS < RANDOM_NUMBER ))
  then
    echo "It's higher than that, guess again:"
    START_GAME

  # user guess was too high
  elif (( USER_GUESS > RANDOM_NUMBER ))
  then
    echo "It's lower than that, guess again:"
    START_GAME
  else
    echo You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!

    # get games played for user
    GET_GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")

    # update games played if new user
    if [[ -z $GET_GAMES_PLAYED ]]
    then
      # update games played for user
      UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = 1 WHERE username='$USERNAME'")
    else
      UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username='$USERNAME'")
    fi


    # get best game from user
    BEST_GAME_QUERY=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")

    # if not best game score yet, current game = best game
    if [[ -z $BEST_GAME_QUERY ]]
    then
      BEST_GAME_UPDATE=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE username='$USERNAME'")

    # update best game if current game < previous best game
    elif (( $BEST_GAME_QUERY > $NUMBER_OF_GUESSES ))
    then
      UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE username='$USERNAME'")
    fi
  fi
}
MAIN
