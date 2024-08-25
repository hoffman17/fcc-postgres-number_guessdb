#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
SECRET_NUMBER=$((1 + $RANDOM % 1000))
NUMBER_OF_GUESSES=0

echo Enter your username:
read USERNAME

# query database if user exists
USERNAME_QUERY=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")

# if no username found in database
if [[ -z $USERNAME_QUERY ]]
then
  # insert username into database
  INSERT_USERNAME=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME')")

  # display welcome message to new user
  echo Welcome, $USERNAME! It looks like this is your first time here.

else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")

  # display welcome message to returning users
  echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi

echo Guess the secret number between 1 and 1000:

# loop until user guesses correctly
until (( USER_GUESS == SECRET_NUMBER ))
do
  read USER_GUESS
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"

  # user guess was too low
  elif (( USER_GUESS < SECRET_NUMBER ))
  then
    echo "It's higher than that, guess again:"

  # user guess was too high
  elif (( USER_GUESS > SECRET_NUMBER ))
  then
    echo "It's lower than that, guess again:"
  fi

  # increment guesses
  ((NUMBER_OF_GUESSES++))
done

echo You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!

# get games played for user
GET_GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")

# if no games played, set games played = 1
if [[ -z $GET_GAMES_PLAYED ]]
then
  UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = 1 WHERE username='$USERNAME'")
else
  # update games played if new user
  UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username='$USERNAME'")
fi

# get best game from user
BEST_GAME_QUERY=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")

# if no best game score yet, current game = best game
if [[ -z $BEST_GAME_QUERY ]]
then
  BEST_GAME_UPDATE=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE username='$USERNAME'")

# update best game if current game < previous best game
elif (( $BEST_GAME_QUERY > $NUMBER_OF_GUESSES ))
then
  UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE username='$USERNAME'")
fi
