#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER LOSSER W_GOALS L_GOALS
do
  if [[ $YEAR != year ]]
  then
    #FOR THE WINNER:
    #get team_id 

    TEAM_ID_WINNER=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    #if not found 

    if [[ -z $TEAM_ID_WINNER ]];
    then
      #insert team
      
      INSERT_WINNER_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")

      if [[ $INSERT_WINNER_NAME == "INSERT 0 1" ]]
      then 
        echo "Inserted into teams, $WINNER"
      fi

      #get new team_id

      TEAM_ID_WINNER=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    fi

    #FOR THE LOSSER:
    #get team_id 

    TEAM_ID_LOSSER=$($PSQL "SELECT team_id FROM teams WHERE name='$LOSSER'")

    #if not found 

    if [[ -z $TEAM_ID_LOSSER ]];
    then
      #insert team
      
      INSERT_LOSSER_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$LOSSER')")

      if [[ $INSERT_LOSSER_NAME == "INSERT 0 1" ]]
      then 
        echo "Inserted into teams, $LOSSER"
      fi

      #get new team_id

      TEAM_ID_LOSSER=$($PSQL "SELECT team_id FROM teams WHERE name='$LOSSER'")

    fi

    #insert all the matches

    INSERT_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND',$TEAM_ID_WINNER,$TEAM_ID_LOSSER,$W_GOALS,$L_GOALS)")


  fi

done
