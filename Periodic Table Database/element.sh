#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t -c"

GET_ELEMENT_INFO() {
  #try by id
  ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")

  #if not found try by symbol
  if [[ -z $ELEMENT_ID ]]
  then
    ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'")

    #if not found try by name
    if [[ -z $ELEMENT_ID ]]
    then
      ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'")

      #if not found error out
      if [[ -z $ELEMENT_ID ]]
      then
        echo I could not find that element in the database.
        exit
      fi
    fi
  fi

  #echo FOUND ELEMENT: $ELEMENT_ID
  ELEMENT_INFO=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE atomic_number=$ELEMENT_ID")

  echo $ELEMENT_INFO | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR TYPE BAR MASS BAR MELT_POINT BAR BOIL_POINT
  do
    echo The element with atomic number $ATOMIC_NUMBER is $NAME \($SYMBOL\). It\'s a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT_POINT celsius and a boiling point of $BOIL_POINT celsius.
  done
}

if [[ $1 ]]
then
  GET_ELEMENT_INFO $1
else
  echo Please provide an element as an argument.
fi