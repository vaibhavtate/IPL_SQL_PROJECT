![image](https://github.com/user-attachments/assets/605c0ea3-0c4a-475d-9206-7c27f63bddb0)






# 🏏 IPL SQL Data Analysis Project

This project involves creating and analyzing a structured SQL database from IPL (Indian Premier League) data. The data includes match statistics, player performance, and seasonal awards like Orange Cap and Purple Cap.

## 📁 Project Structure


## 📦 Data Sources

The project uses four main datasets:

- `matches.csv` — Match-level data (teams, toss, result, venue, etc.)
- `deliveries.csv` — Ball-by-ball data
- `orange_cap.csv` — Top run-scorers per season
- `purple_cap.csv` — Top wicket-takers per season

## 🛠️ How to Use

1. Clone or download this repository.
2. Open the `ipl_data.db` using any SQLite-compatible client (e.g., DB Browser for SQLite).
3. Alternatively, run the `ipl_data.sql` script to create the database manually.

### ✅ Run the Analysis

Use the queries in `queries.sql` to perform detailed analysis such as:

- Most match wins by team
- Top run scorers and wicket takers
- Seasonal comparisons
- Player vs player/team matchups
- Strike rates, economy rates, dot balls, and more

## 🧠 Sample Questions Answered

- Who has won the most matches in IPL history?
- Who scored the most runs and hit the most sixes?
- Which bowler has the best economy?
- What’s the average score batting first vs second?
- Who are the Orange and Purple Cap winners each season?

## 💡 Technologies Used

- SQLite 3
- Python (for data import and conversion)
- Pandas (data preprocessing)
- Jupyter Notebook / SQL clients

## 🔓 License

This project is for educational purposes and uses publicly available IPL data.

---

**Contributions and feedback are welcome!**

