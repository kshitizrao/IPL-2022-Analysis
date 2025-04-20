# 🏏 IPL-2022 Player Performance Analysis

## 📌 Project Overview

This project provides a detailed analysis of player performances during the **Indian Premier League (IPL) 2022** season. It is built to assist **team management, coaching staff, and data analysts** in evaluating player-wise strengths and weaknesses using key performance metrics. The insights derived can guide informed decisions during **team selection, player auctions**, and overall **team strategy building**.

## 🎯 Purpose

- Identify consistent performers (batsmen and bowlers).
- Understand venue-based winning trends.
- Analyze player impact on match outcomes.
- Support strategic decision-making for team selection and auctions.

---

## 🧰 Tech Stack

- **SQL / MySQL** – For advanced data querying using nested joins, CTEs, subqueries.
- **Microsoft Excel** – For preliminary data transformation and cleanup.
- **Power BI** – For data visualization, modeling, and insight generation.

---

## 📂 Dataset

📦 Source: [IPL 2022 Dataset on Kaggle](https://www.kaggle.com/datasets/vora1011/ipl-2022-match-dataset)

- `IPL_Matches_2022.csv` – Contains match-level data (teams, venue, result, toss, etc.)
- `IPL_Ball_by_Ball_2022.csv` – Contains ball-by-ball data for each delivery in IPL 2022.

---

## 📊 Key Analysis & Metrics

### ✅ SQL-Based Analysis

- **% Win Rate** – Percentage of wins for each team.
- **Venue Advantage** – Which venues favor batting first vs second.
- **Consistent Performers**:
  - Best batsman and bowler per team and across the league.
- **Player of the Match** – Most frequent award winners.
- **Match-Wise MVPs** – Most valuable player after each game.
- **Performance Metrics**:
  - Strike rate > 150 in each team
  - Games played by each player
  - Best individual score by each batsman
  - Most boundaries per team

### 📈 Power BI Insights

- Connection to MySQL for live data import.
- **Data Modeling**: Linked `matches` and `ball-by-ball` data.
- **Power Query**: Data cleansing and transformation.
- **DAX Measures**:
  - Total runs
  - Wickets
  - Boundaries
  - Strike Rate
  - Economy Rate
  - Extras
  - Number of player of match
  - Total matches
  - Run concede etc.
- **Visualizations**:
  - KPI indicators
  - Pie charts, bar graphs, and data tables
  - Team-wise and player-wise performance dashboards

---

## 📸 Dashboard Snapshot

![IPL 2022 Dashboard Screenshot](/PowerBI/dashboard-screenshot.png)

---

## 📌 Key Questions Answered

- What is the **win percentage** of each team?
- Which **venue** favors batting first vs second?
- Who is the **most consistent batsman and bowler** in each team and overall?
- Who won the **most "Player of the Match"** awards?
- Who is the **most valuable player** after each match?
- Who has a **strike rate > 150** in each team?
- What is the **best individual score**?
- Who hit the **most boundaries**?

---

## 🧾 Conclusion

- Analyzed `IPL_Ball_by_Ball_2022.csv` and `IPL_Matches_2022.csv` datasets to extract performance metrics.
- Evaluated batsmen based on total runs, balls faced, and strike rate to identify consistent performers.
- Assessed bowlers using wickets taken, overs bowled, extra runs (wides/no-balls), and economy rate.
- Identified the best batsman and bowler from each team using aggregated performance stats.
- Analyzed match data to understand how **Player of the Match** and **Player of the Tournament** awards correlate with player performance.

---

## 🙌 Acknowledgement

Thanks to [Kaggle Datasets](https://www.kaggle.com/datasets/vora1011/ipl-2022-match-dataset) for the publicly available IPL 2022 data.

---

## 📬 Contact

If you have any questions, feel free to reach out via [GitHub Issues](https://github.com/kshitizrao/IPL-2022-Analysis/issues).

---
