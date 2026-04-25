# InternetRegressionModel-Project
Simple and Multi Regression Models for Econometrics Project
Determinants of Global Internet Usage Rates: An Econometric Analysis

---

## Project Overview:

This project investigates the relationship between a nation's economic capacity and its digital adoption levels. Using cross-national data from 183 countries, the study employs simple and multiple linear regression models to determine how much of the variation in internet usage rates can be explained by per capita income, urbanization, and educational attainment.

## Research Questions:

- **Simple Model:** How much does a nation's per capita income account for cross-national differences in Internet usage rates? 
- **Multiple Model:** How much of the variation in internet user rates is explained when incorporating the education index and urban rate?

## Data Sources:

The dataset is compiled from the following sources:

- **Gapminder (via Kaggle):** Income per person (GDP per capita, PPP, inflation-adjusted) and Internet user rates (originally from ITU).
- **DataPandas / UNDP:** Education Index (comprised of expected and mean years of schooling).
- **World Bank / UN:** Urban population rates.

## Methodology:

The analysis was conducted in R Studio and divided into two primary phases:

1. Simple Linear Regression:
2. Equation: Y = 21.3511 + 0.001683X

  - **Key Finding:** A positive and statistically significant relationship exists, where a $1,000 increase in per capita income is associated with a 1.68 percentage point increase in internet usage.
  - Explanatory Power ($R^2$): 0.5639 (56%).

3. Multiple Linear Regression:

 - **Equation:** $\hat{Y} = -83.91 + 10.35 \ln(X_1) + 0.019(X_2) + 52.24(X_3)$
 - **Variables:** Log of Income ($X_1$), Urban Rate ($X_2$), and Education Index ($X_3$).
 - **Key Finding:** Adding education and urbanization increased the model's explanatory power by approximately 20 percentage points. While income and education were highly significant ($p < 0.01$), the urban rate was found to be statistically insignificant ($p = 0.757$) in this specific model.

## Statistical Diagnostics:

- **Outliers:** Identified influential points using Cook's Distance, notably Equatorial Guinea (under-performing relative to income) and Antigua and Barbuda (over-performing).
- **Multicollinearity:** Analyzed via a correlation matrix; predictors showed moderate correlation ($r < 0.60$), suggesting no severe multicollinearity.
- **Heteroscedasticity:** Verified using Robust Standard Errors, which showed minimal deviation from OLS results, indicating the model's stability.

## Repository Structure:

/data: Contains the 2 Excel files used for the analysis.

/scripts: Includes the 2 Rscript files for data cleaning and regression modeling.

ECON301_Term_Project_Report.pdf: The full academic report detailing the findings.

Conclusion:

The study confirms that while economic strength facilitates internet access, digital inclusion is a complex phenomenon heavily influenced by educational infrastructure.

