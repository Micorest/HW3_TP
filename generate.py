import csv
import random
import os
import sys

NUM_ROWS = 50


COLUMNS = ["Name", "HP", "Attack", "Defense"]

def generate_row():

    return {
        "Name": random.choice(["Pikachu", "Charizard", "Squirtle",
                               "Eevee", "Bulbasaur", "Meowth",
                               "Charmander", "Mew", "Slowpoke"]),
        "HP": random.randint(30, 80),
        "Attack": random.randint(30, 100),
        "Defense": random.randint(30, 100),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)

