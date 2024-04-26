# A Detailed Analytics Pipeline for Analyzing 2023 US Flight Delays.

## Final Submission

### Table of Contents
- [Introduction](#introduction)
- [Data Pipeline ArchitectureData Pipeline Architecture](#data-pipeline-architecture)
- [Data Sources](#data-sources)
- [Methodology](#methodology)
- [Dashboards](#dashboards)
- [Conclusions](#conclusions)

### Introduction

Explore my comprehensive analysis project of US flight delays in 2023. This endeavor seeks to dissect and understand flight delay patterns with an aim to optimize air travel efficiency.
### Data Pipeline Architecture
![](https://github.com/ukokobili/delayed_flights/blob/main/assets/pipeline.jpg)
### Data Sources

The datasets employed in this analysis are sourced from:

- **Kaggle**: Detailed flight data for the US in 2023.
- **IATA**: Airport codes and related geolocation information.
- **Meteostat**: Weather data that may influence flight delays.

**Additional Data Sources** include:
- Historical records of flight delays.
- Detailed operational statistics for airports.

### Methodology

#### Tools Used
- [Kaggle API](#): For data extraction.
- [dbt™](#): For robust data transformation and modeling.
- [MotherDuck](#): Used as a scalable data warehouse.
- [Preset.io](#): For insightful dashboard visualizations.
- [GitHub](#): For version control and collaboration.
- [GitHub Actions](#): For continuous integration and deployment, automating the workflow from data model updates to deployment in Snowflake.

#### Applied Techniques
- **Data Cleaning**: Employed dbt for refining data and ensuring precision.
- **Data Modeling**: Utilized dbt to architect a star schema for efficient data queries.
- **Data Warehousing**: Leveraged Snowflake's capabilities for managing extensive datasets.
- **Continuous Integration/Deployment**: Utilized GitHub Actions to create a seamless pipeline for automatic updates and consistency checks.

### Dashboards

Our dashboards offer a deep-dive into:
- **Temporal Delays**: Insight into how delays fluctuate over months.
- **Airline Performance**: Analyses on specific airline delay and cancellation rates.
- **Weather Impact**: Exploration of the correlation between weather conditions and flight punctuality.

![](https://github.com/ukokobili/delayed_flights/blob/main/assets/dashboard.jpg)

### Conclusions

This project concludes that timely and comprehensive data analysis is key to mitigating flight delays and enhancing the air travel experience. It highlights how leveraging modern data tools and techniques can transform raw data into strategic insights.

---

