#!/bin/sh

echo "Initializing Users database..."
sqlite3 ./var/wordle-users.db < ./share/wordle-users.sql
echo "Successfully initialized Users database."

echo "Initializing Games database..."
sqlite3 ./var/wordle-games.db < ./share/wordle-games.sql
echo "Successfully initialized Games database."

echo "Populating database with words..."
python3 ./share/populate.py