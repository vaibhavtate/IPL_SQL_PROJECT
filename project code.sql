use ipl;


-- Most matches won by each team
SELECT match_winner, COUNT(*) AS total_wins
FROM matches
WHERE match_winner IS NOT NULL
GROUP BY match_winner
ORDER BY total_wins DESC;


-- Player with most "Player of the Match" awards
SELECT player_of_the_match, COUNT(*) AS awards
FROM matches
GROUP BY player_of_the_match
ORDER BY awards DESC
LIMIT 1;


-- Season with most matches played
SELECT SUBSTR(date, -4) AS season, COUNT(*) AS total_matches
FROM matches
GROUP BY season
ORDER BY total_matches DESC
LIMIT 1;


-- Top run-scorer from Orange Cap table
SELECT Batsman, SUM(runs) AS total_runs
FROM orange_cap
GROUP BY Batsman
ORDER BY total_runs DESC
LIMIT 1;


-- Top wicket-taker from Purple Cap table
SELECT Bowler, SUM(wickets) AS total_wickets
FROM purple_cap
GROUP BY Bowler
ORDER BY total_wickets DESC
LIMIT 1;


-- Average first innings score
SELECT AVG(first_ings_score) AS avg_first_innings_score
FROM matches;


-- Average second innings score
SELECT AVG(second_ings_score) AS avg_second_innings_score
FROM matches;


-- Team with most toss wins
SELECT toss_winner, COUNT(*) AS toss_wins
FROM matches
GROUP BY toss_winner
ORDER BY toss_wins DESC;


-- Most popular venue
SELECT venue, COUNT(*) AS total_matches
FROM matches
GROUP BY venue
ORDER BY total_matches DESC
LIMIT 1;

-- Teams that played the most matches
SELECT team, COUNT(*) AS matches_played
FROM (
    SELECT team1 AS team FROM matches
    UNION ALL
    SELECT team2 AS team FROM matches
) AS all_teams
GROUP BY team
ORDER BY matches_played DESC;


-- Win percentage of each team
SELECT match_winner AS team, 
       COUNT(*) * 100.0 / (SELECT COUNT(*) FROM matches) AS win_percentage
FROM matches
WHERE match_winner IS NOT NULL
GROUP BY match_winner
ORDER BY win_percentage DESC;


-- Does winning toss help win the match?
SELECT 
    CASE WHEN toss_winner = match_winner THEN 'Toss Win = Match Win'
         ELSE 'Toss Win ≠ Match Win' END AS result,
    COUNT(*) AS matches
FROM matches
GROUP BY result;


-- Toss decision trends
SELECT toss_decision, COUNT(*) AS count
FROM matches
GROUP BY toss_decision
ORDER BY count DESC;


-- Top 5 Orange Cap winners over the years
SELECT Batsman, SUM(runs) AS total_runs
FROM orange_cap
GROUP BY Batsman
ORDER BY total_runs DESC
LIMIT 5;


-- Top 5 Purple Cap winners over the years
SELECT Bowler, SUM(wickets) AS total_wickets
FROM purple_cap
GROUP BY Bowler
ORDER BY total_wickets DESC
LIMIT 5;


-- Venues with highest average first innings score
SELECT venue, AVG(first_ings_score) AS avg_score
FROM matches
GROUP BY venue
ORDER BY avg_score DESC
LIMIT 5;


-- Most competitive matches (smallest margin wins)
SELECT match_id, match_winner, won_by, balls_left
FROM matches
WHERE won_by LIKE '%run%' OR won_by LIKE '%wicket%'
ORDER BY balls_left ASC
LIMIT 5;


-- Top 5 most common "Player of the Match" winners
SELECT player_of_the_match, COUNT(*) AS awards
FROM matches
GROUP BY player_of_the_match
ORDER BY awards DESC
LIMIT 5;


-- Players who were top scorers in most matches
SELECT top_scorer, COUNT(*) AS top_scorer_count
FROM matches
GROUP BY top_scorer
ORDER BY top_scorer_count DESC
LIMIT 5;


-- Year-wise average scores
SELECT SUBSTR(date, -4) AS season,
       AVG(first_ings_score) AS avg_1st,
       AVG(second_ings_score) AS avg_2nd
FROM matches
GROUP BY season
ORDER BY season;


--  Most frequent "best bowler"
SELECT best_bowling, COUNT(*) AS matches
FROM matches
GROUP BY best_bowling
ORDER BY matches DESC
LIMIT 5;


-- Best bowling figures (sorted by wickets then economy)
SELECT best_bowling, best_bowling_figure
FROM matches
GROUP BY best_bowling, best_bowling_figure
ORDER BY SUBSTR(best_bowling_figure, 1, 1) DESC
LIMIT 5;




