
# Baby Name Trend Analysis

### Project Overview

This project, **Baby Name Trend Analysis**, examines trends in baby name popularity in the United States based on Social Security data from 1980 to 2010. By analyzing naming patterns over time, across regions, and by gender, the project reveals insights into cultural preferences and demographic patterns in baby names.

### Dataset

The analysis uses two tables:

1. **Names Table**  
   - **State**: U.S. state abbreviation (CHAR(2))
   - **Gender**: Gender of the baby ('M' for Male, 'F' for Female) (CHAR(1))
   - **Year**: Year of birth (INT)
   - **Name**: Baby name (VARCHAR(45))
   - **Births**: Number of babies born with this name in a given state and year (INT)

2. **Regions Table**  
   - **State**: U.S. state abbreviation (CHAR(2))
   - **Region**: Region of the U.S. to which the state belongs (VARCHAR(45))

### Project Objectives and Tasks

The analysis is organized around four primary objectives, each aiming to uncover unique aspects of baby name trends.

---

### Objective 1: Track Changes in Name Popularity

**Goal**: Identify how the popularity of baby names has evolved over time.

**Tasks**:
- Identify the overall most popular girl and boy names and observe how their rankings have changed over the years.
- Determine the names with the largest increase in popularity from the start (1980) to the end of the dataset (2010).

**Insights**:
This analysis provides insights into naming trends over the decades, showcasing names that have seen the highest rise in popularity and identifying names that were consistently popular over time.

---

### Objective 2: Compare Popularity Across Decades

**Goal**: Compare baby name popularity within individual years and across decades.

**Tasks**:
- For each year, identify the top 3 most popular names for girls and boys.
- For each decade (e.g., 1980-1989, 1990-1999), determine the top 3 most popular names for girls and boys.

**Insights**:
This objective highlights yearly and decade-long trends, illustrating names that dominated specific eras and capturing shifts in naming preferences as new names gained traction and others fell out of favor.

---

### Objective 3: Compare Popularity Across Regions

**Goal**: Analyze the regional distribution of baby names and identify regional favorites.

**Tasks**:
- Count the number of babies born in each of the six U.S. regions, with Michigan (MI) categorized under the Midwest.
- Identify the top 3 most popular girl and boy names within each region.

**Insights**:
This analysis reveals regional differences in naming trends, showing how preferences for certain names vary across the U.S. and identifying regionally popular names.

---

### Objective 4: Explore Unique Names in the Dataset

**Goal**: Investigate unique characteristics of names in the dataset, including androgynous names, name lengths, and specific name popularity.

**Tasks**:
- Identify the top 10 most popular androgynous names (names given to both girls and boys).
- Determine the shortest and longest names in terms of character length and identify the most popular short and long names.
- Find the U.S. state with the highest percentage of babies named "Chris".

**Insights**:
This analysis delves into unusual trends, highlighting names that are commonly used across genders, names with unique lengths, and popularity patterns for the name "Chris" across different states.

---

### Summary of Findings

This project offers a comprehensive analysis of baby name trends in the U.S. over a 30-year span, revealing patterns and preferences by year, region, and gender. Through these findings, it is possible to trace cultural shifts, regional name preferences, and unique naming characteristics that reflect broader social trends.

---

### How to Use This Analysis

The insights gained from this analysis can be valuable to sociologists, marketers, and cultural researchers interested in understanding naming conventions and how they relate to regional and temporal factors. Additionally, this dataset could support further exploration into correlations between popular culture, media influence, and name popularity.

### Future Work

Further analysis could include:
- Expanding the dataset beyond 2010 to capture more recent trends.
- Integrating demographic data to study how baby name trends vary across different socio-economic backgrounds.
- Analyzing the influence of pop culture events (e.g., popular movies or celebrity names) on naming trends.

---
