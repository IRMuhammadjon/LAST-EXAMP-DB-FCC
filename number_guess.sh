#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Function to get user info
get_user_info() {
  USERNAME=$1
  USER_INFO=$($PSQL "SELECT user_id, username, games_played, best_game FROM users WHERE username='$USERNAME'")
  echo "$USER_INFO"
}

# Function to insert a new user
insert_new_user() {
  USERNAME=$1
  INSERT_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  echo "$INSERT_RESULT"
}

# Function to update user game stats
update_user_stats() {
  USERNAME=$1
  GUESSES=$2
  UPDATE_RESULT=$($PSQL "UPDATE users SET games_played = games_played + 1, best_game = LEAST(best_game, $GUESSES) WHERE username='$USERNAME'")
  echo "$UPDATE_RESULT"
}

# Prompt for username
echo "Enter your username:"
read USERNAME

# Get user info
USER_INFO=$(get_user_info "$USERNAME")

if [[ -z $USER_INFO ]]
then
  # New user
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  insert_new_user "$USERNAME"
else
  # Returning user
  IFS='|' read -r USER_ID USERNAME GAMES_PLAYED BEST_GAME <<< "$USER_INFO"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
# Generate secret number
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))


# Start guessing
GUESSES=0
while true
do
  echo "Guess the secret number between 1 and 1000:"
  read GUESS

  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi
    ((GUESSES++))

  if [[ $GUESS -eq $SECRET_NUMBER ]]
  then
    echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    if [[ -z $USER_INFO ]]
    then
      # First game for new user
      $PSQL "UPDATE users SET games_played = 1, best_game = $GUESSES WHERE username='$USERNAME'"
    else
      # Update returning user stats
      update_user_stats "$USERNAME" "$GUESSES"
    fi
    break
  elif [[ $GUESS -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  else
    echo "It's lower than that, guess again:"
  fi
done
