import pandas as pd

df = pd.read_csv("pokemon_data.csv")
print("✅ Loaded dataset:", df.shape)

print("\nMissing values:\n", df.isnull().sum())
print("Duplicate rows:", df.duplicated().sum())

df['moves'] = df['moves'].fillna('None')

df['name'] = df['name'].str.strip().str.title()
df['types'] = df['types'].str.strip().str.lower()
df['abilities'] = df['abilities'].str.strip().str.lower()

df.columns = [col.lower().replace(" ", "_") for col in df.columns]

numeric_cols = ['base_experience', 'height', 'weight']
for col in numeric_cols:
    df[col] = pd.to_numeric(df[col], errors='coerce')

stats_expanded = df['stats'].str.split(',\s*', expand=True)
stats_dicts = stats_expanded.apply(lambda row: {kv.split('=')[0].strip(): int(kv.split('=')[1]) for kv in row if '=' in kv}, axis=1)
stats_df = pd.DataFrame(stats_dicts.tolist()).fillna(0).astype(int)

df = pd.concat([df.drop(columns=['stats']), stats_df], axis=1)

df = df.sort_values(by='id').reset_index(drop=True)

df.to_csv("cleaned_pokemon_data.csv", index=False)
print("\n✅ Cleaning complete! Cleaned data saved as 'cleaned_pokemon_data.csv'")
print("Final shape:", df.shape)

