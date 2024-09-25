import psycopg2
from psycopg2 import sql

# Database connection
def connect_to_db():
    conn = psycopg2.connect(
        dbname="football_management",
        user="postgres",
        password="1234",
        host="localhost",
        port="5433"
    )
    return conn

# Function to add a new player
def create_player(player_id, first_name, last_name, age, dob_country, nationality, position, coach_id, team_id):
    conn = connect_to_db()
    cur = conn.cursor()
    query = sql.SQL("INSERT INTO playerBio (player_id, player_firstname, player_lastname, player_age, player_dob_country, player_nationality, player_position, coach_id, team_id) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)")
    cur.execute(query, (player_id, first_name, last_name, age, dob_country, nationality, position, coach_id, team_id))
    conn.commit()
    cur.close()
    conn.close()

# Function to update a player's details
def update_player(player_id, first_name, last_name, age, dob_country, nationality, position, coach_id, team_id):
    conn = connect_to_db()
    cur = conn.cursor()
    query = sql.SQL("UPDATE playerBio SET player_firstname = %s, player_lastname = %s, player_age = %s, player_dob_country = %s, player_nationality = %s, player_position = %s, coach_id = %s, team_id = %s WHERE player_id = %s")
    cur.execute(query, (first_name, last_name, age, dob_country, nationality, position, coach_id, team_id, player_id))
    conn.commit()
    cur.close()
    conn.close()

# Function to delete a player
def delete_player(player_id):
    conn = connect_to_db()
    cur = conn.cursor()
    query = sql.SQL("DELETE FROM playerBio WHERE player_id = %s")
    cur.execute(query, (player_id,))
    conn.commit()
    cur.close()
    conn.close()

# Function to view all players
def view_players():
    conn = connect_to_db()
    cur = conn.cursor()
    query = sql.SQL("SELECT * FROM playerBio")
    cur.execute(query)
    players = cur.fetchall()
    for player in players:
        print(player)
    cur.close()
    conn.close()

# Main function
def main():
    while True:
        print("\nPlayer Management System")
        print("1. Add Player")
        print("2. Update Player")
        print("3. Delete Player")
        print("4. View Players")
        print("5. Exit")

        choice = input("Enter your choice: ")

        if choice == '1':
            player_id = input("Enter player ID: ")
            first_name = input("Enter player's first name: ")
            last_name = input("Enter player's last name: ")
            age = int(input("Enter player's age: "))
            dob_country = input("Enter player's country of birth: ")
            nationality = input("Enter player's nationality: ")
            position = input("Enter player's position: ")
            coach_id = input("Enter coach ID: ")
            team_id = input("Enter team ID: ")
            create_player(player_id, first_name, last_name, age, dob_country, nationality, position, coach_id, team_id)
            print("Player added successfully.")

        elif choice == '2':
            player_id = input("Enter player ID to update: ")
            first_name = input("Enter player's new first name: ")
            last_name = input("Enter player's new last name: ")
            age = int(input("Enter player's new age: "))
            dob_country = input("Enter player's new country of birth: ")
            nationality = input("Enter player's new nationality: ")
            position = input("Enter player's new position: ")
            coach_id = input("Enter new coach ID: ")
            team_id = input("Enter new team ID: ")
            update_player(player_id, first_name, last_name, age, dob_country, nationality, position, coach_id, team_id)
            print("Player updated successfully.")

        elif choice == '3':
            player_id = input("Enter the player ID to delete: ")
            delete_player(player_id)
            print("Player deleted successfully.")

        elif choice == '4':
            print("\nPlayers List:")
            view_players()

        elif choice == '5':
            print("Exiting Player Management System.")
            break

        else:
            print("Invalid choice. Please try again.")

if __name__ == "__main__":
    main()
