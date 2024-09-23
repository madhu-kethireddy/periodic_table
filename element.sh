#! /bin/bash

# create PSQL variable to query database
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# if no argument
if [[ -z $1 ]]
then
  echo Please provide an element as an argument.

# if there is an argument
else
  # if not a number
  if [[ ! $1 =~ ^[0-9]+$ ]]
  then
  # search element name or symbol
  GET_ELEMENT_SELECTED=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name ILIKE '$1' OR symbol ILIKE '$1'")
  # if it is a nuber
  else
  # search element by atomic_number
  GET_ELEMENT_SELECTED=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $1")
  fi

  # if element not found
  if [[ -z $GET_ELEMENT_SELECTED ]]
  then
   echo I could not find that element in the database.

   # if element found
   else
   # print result output with information
   echo $GET_ELEMENT_SELECTED | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT
    do
    # result information
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi

fi
