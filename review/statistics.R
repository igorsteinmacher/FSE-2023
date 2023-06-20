# Spearman Correlation
# Metrics from valid projects vs all projects in the dataset
cor.test(repositories_data$n_stars_all, repositories_data$n_stars_valid, method = "spearman", use = "complete.obs")
cor.test(repositories_data$n_forks_all, repositories_data$n_forks_valid, method = "spearman", use = "complete.obs")
cor.test(repositories_data$n_prs_all, repositories_data$n_prs_valid, method = "spearman", use = "complete.obs")
cor.test(repositories_data$n_contributors_all, repositories_data$n_contributors_valid, method = "spearman", use = "complete.obs")
cor.test(repositories_data$n_issues_all, repositories_data$n_issues_valid, method = "spearman", use = "complete.obs")

# Distributions Comparison
# Metrics from valid, invalid (removed) and all projects in the dataset
help(boxplot)
par(cex.axis=1.5)
boxplot(repositories_data$n_stars_all, repositories_data$n_stars_valid, repositories_data$n_stars_invalid,
        names = c("All", "Valid", "Invalid"), main = "# Stars", outline = FALSE, horizontal = TRUE)
boxplot(repositories_data$n_forks_all, repositories_data$n_forks_valid, repositories_data$n_forks_invalid,
        names = c("All", "Valid", "Invalid"), main = "# Forks", outline = FALSE, horizontal = TRUE)
boxplot(repositories_data$n_prs_all, repositories_data$n_prs_valid, repositories_data$n_prs_invalid,
        names = c("All", "Valid", "Invalid"), main = "# Pull requests", outline = FALSE, horizontal = TRUE)
boxplot(repositories_data$n_contributors_all, repositories_data$n_contributors_valid, repositories_data$n_contributors_invalid,
        names = c("All", "Valid", "Invalid"), main = "# Contributors", outline = FALSE, horizontal = TRUE)
boxplot(repositories_data$n_issues_all, repositories_data$n_issues_valid, repositories_data$n_issues_invalid,
        names = c("All", "Valid", "Invalid"), main = "# Issues", outline = FALSE, horizontal = TRUE)

# Removing values <= 2
leq_2 <- repositories_data

leq_2$n_stars_all[leq_2$n_stars_all <= 2] <- NA
leq_2$n_stars_valid[leq_2$n_stars_valid <= 2] <- NA
cor.test(leq_2$n_stars_all, leq_2$n_stars_valid, method = "spearman", use = "complete.obs")

leq_2$n_forks_all[leq_2$n_forks_all <= 2] <- NA
leq_2$n_forks_valid[leq_2$n_forks_valid <= 2] <- NA
cor.test(leq_2$n_forks_all, leq_2$n_forks_valid, method = "spearman", use = "complete.obs")

leq_2$n_prs_all[leq_2$n_prs_all <= 2] <- NA
leq_2$n_prs_valid[leq_2$n_prs_valid <= 2] <- NA
cor.test(leq_2$n_prs_all, leq_2$n_prs_valid, method = "spearman", use = "complete.obs")

leq_2$n_contributors_all[leq_2$n_contributors_all <= 2] <- NA
leq_2$n_contributors_valid[leq_2$n_contributors_valid <= 2] <- NA
cor.test(leq_2$n_contributors_all, leq_2$n_contributors_valid, method = "spearman", use = "complete.obs")

leq_2$n_issues_all[leq_2$n_issues_all <= 2] <- NA
leq_2$n_issues_valid[leq_2$n_issues_valid <= 2] <- NA
cor.test(leq_2$n_issues_all, leq_2$n_issues_valid, method = "spearman", use = "complete.obs")

# Removing values <= 3
leq_3 <- repositories_data

leq_3$n_stars_all[leq_3$n_stars_all <= 3] <- NA
leq_3$n_stars_valid[leq_3$n_stars_valid <= 3] <- NA
cor.test(leq_3$n_stars_all, leq_3$n_stars_valid, method = "spearman", use = "complete.obs")

leq_3$n_forks_all[leq_3$n_forks_all <= 3] <- NA
leq_3$n_forks_valid[leq_3$n_forks_valid <= 3] <- NA
cor.test(leq_3$n_forks_all, leq_3$n_forks_valid, method = "spearman", use = "complete.obs")

leq_3$n_prs_all[leq_3$n_prs_all <= 3] <- NA
leq_3$n_prs_valid[leq_3$n_prs_valid <= 3] <- NA
cor.test(leq_3$n_prs_all, leq_3$n_prs_valid, method = "spearman", use = "complete.obs")

leq_3$n_contributors_all[leq_3$n_contributors_all <= 3] <- NA
leq_3$n_contributors_valid[leq_3$n_contributors_valid <= 3] <- NA
cor.test(leq_3$n_contributors_all, leq_3$n_contributors_valid, method = "spearman", use = "complete.obs")

leq_3$n_issues_all[leq_3$n_issues_all <= 3] <- NA
leq_3$n_issues_valid[leq_3$n_issues_valid <= 3] <- NA
cor.test(leq_3$n_issues_all, leq_3$n_issues_valid, method = "spearman", use = "complete.obs")

# Removing values <= 4
leq_4 <- repositories_data

leq_4$n_stars_all[leq_4$n_stars_all <= 4] <- NA
leq_4$n_stars_valid[leq_4$n_stars_valid <= 4] <- NA
cor.test(leq_4$n_stars_all, leq_4$n_stars_valid, method = "spearman", use = "complete.obs")

leq_4$n_forks_all[leq_4$n_forks_all <= 4] <- NA
leq_4$n_forks_valid[leq_4$n_forks_valid <= 4] <- NA
cor.test(leq_4$n_forks_all, leq_4$n_forks_valid, method = "spearman", use = "complete.obs")

leq_4$n_prs_all[leq_4$n_prs_all <= 4] <- NA
leq_4$n_prs_valid[leq_4$n_prs_valid <= 4] <- NA
cor.test(leq_4$n_prs_all, leq_4$n_prs_valid, method = "spearman", use = "complete.obs")

leq_4$n_contributors_all[leq_4$n_contributors_all <= 4] <- NA
leq_4$n_contributors_valid[leq_4$n_contributors_valid <= 4] <- NA
cor.test(leq_4$n_contributors_all, leq_4$n_contributors_valid, method = "spearman", use = "complete.obs")

leq_4$n_issues_all[leq_4$n_issues_all <= 4] <- NA
leq_4$n_issues_valid[leq_4$n_issues_valid <= 4] <- NA
cor.test(leq_4$n_issues_all, leq_4$n_issues_valid, method = "spearman", use = "complete.obs")

# Removing values <= 5
leq_5 <- repositories_data

leq_5$n_stars_all[leq_5$n_stars_all <= 5] <- NA
leq_5$n_stars_valid[leq_5$n_stars_valid <= 5] <- NA
cor.test(leq_5$n_stars_all, leq_5$n_stars_valid, method = "spearman", use = "complete.obs")

leq_5$n_forks_all[leq_5$n_forks_all <= 5] <- NA
leq_5$n_forks_valid[leq_5$n_forks_valid <= 5] <- NA
cor.test(leq_5$n_forks_all, leq_5$n_forks_valid, method = "spearman", use = "complete.obs")

leq_5$n_prs_all[leq_5$n_prs_all <= 5] <- NA
leq_5$n_prs_valid[leq_5$n_prs_valid <= 5] <- NA
cor.test(leq_5$n_prs_all, leq_5$n_prs_valid, method = "spearman", use = "complete.obs")

leq_5$n_contributors_all[leq_5$n_contributors_all <= 5] <- NA
leq_5$n_contributors_valid[leq_5$n_contributors_valid <= 5] <- NA
cor.test(leq_5$n_contributors_all, leq_5$n_contributors_valid, method = "spearman", use = "complete.obs")

leq_5$n_issues_all[leq_5$n_issues_all <= 5] <- NA
leq_5$n_issues_valid[leq_5$n_issues_valid <= 5] <- NA
cor.test(leq_5$n_issues_all, leq_5$n_issues_valid, method = "spearman", use = "complete.obs")

