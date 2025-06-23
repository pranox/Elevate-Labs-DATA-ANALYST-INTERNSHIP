# 🧹 Pokémon Dataset Cleaning (Kaggle)

## Dataset
- [Comprehensive Pokémon Dataset on Kaggle](https://www.kaggle.com/datasets/tanishksharma/comprehensive-pokemon-dataset)

## 🎯 Objective
Clean the raw Pokémon dataset by fixing:
- Missing values
- Text inconsistencies
- Flattening `stats` column into individual attributes

## 📦 Columns After Cleaning
- id
- name
- base_experience
- height
- weight
- types
- abilities
- moves
- hp
- attack
- defense
- special_attack
- special_defense
- speed

## ✅ Cleaning Actions
- Filled missing moves with `"None"`
- Standardized name, types, and abilities formats
- Converted numeric columns to proper types
- Parsed the `stats` column into individual fields
- Removed no duplicates (as none were found)

## 🛠 Tools Used
- Python
- Pandas

## 📁 Files
- `pokemon_data.csv` – Raw data
- `pokemon_cleaning.py` – Cleaning script
- `cleaned_pokemon_data.csv` – Final output

---

Made with 💻 for Elevate Labs – Task 1

