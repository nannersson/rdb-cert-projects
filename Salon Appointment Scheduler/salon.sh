#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

INSERT_CUSTOMER() {
  CUSTOMER_INSERT_RESULT=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
}

MAKE_APPOINTMENT() {
  APPOINTMENT_INSERT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  echo -e "\nI have put you down for a $SERVICE_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
}

GET_SERVICE_TIME() {
  #first get the customer ID
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  #echo $CUSTOMER_ID, $SERVICE_ID_SELECTED
  #ask for the service time
  echo -e "\nWhat time would you like your $SERVICE_SELECTED, $CUSTOMER_NAME?"
  read SERVICE_TIME

  MAKE_APPOINTMENT
}

GET_INFO() {
    #get customer number
    echo -e "\n What's your phone number?"
    read CUSTOMER_PHONE

    #find customer by phone
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

    #if name wasn't found ask for name and insert new customer
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nNo record for that number found. What's your name?"
      read CUSTOMER_NAME
      INSERT_CUSTOMER
    fi

    GET_SERVICE_TIME
}

SERVICES_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "How may I help you?\n"

  #get services
  AVAILABLE_SERVICES=$($PSQL "SELECT * FROM services")

  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo $SERVICE_ID\) $SERVICE_NAME
  done

  #get input
  read SERVICE_ID_SELECTED

  SERVICE_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  
  if [[ -z $SERVICE_SELECTED ]]
  then
    #service not found in database
    SERVICES_MENU "I could not find that service."
  else
    GET_INFO
  fi
}

echo -e "\n~~~ THE SALON ~~~\n"
SERVICES_MENU