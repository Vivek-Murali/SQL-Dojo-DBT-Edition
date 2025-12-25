# 🚖 NY Taxi Data Analysis - dbt Portfolio Project

> **"Mastering 100M+ Rows: Analytics Engineering with dbt & NY Taxi Data"**

## 📖 Project Overview

This project is a transformative data engineering case study using the famous New York City Taxi dataset. The goal was to take raw, messy trip data (millions of records) and build a robust, production-grade data pipeline using **dbt (data build tool)**.

We implemented a **Medallion Architecture** (Bronze → Silver → Gold) to standardize, clean, and aggregate the data. The final output is a set of "Mart" tables optimized for answering critical business questions and powering dashboards in tools like **Google Looker Studio**.

### 🏗️ Architecture & Tech Stack

- **Data Warehouse**: Google BigQuery
- **Transformation**: dbt Core (SQL + Jinja)
- **Orchestration**: CLI / Airflow (Conceptual)
- **Visualization**: Looker Studio

![Architecture Diagram](https://i.imgur.com/example-placeholder-medallion.png)
_(Self-hosted or GitHub diagram placeholder)_

| Layer                     | Model Type                    | Description                                                                                                                    |
| :------------------------ | :---------------------------- | :----------------------------------------------------------------------------------------------------------------------------- |
| **Bronze** (Staging)      | `View`                        | Raw ingestion. Renaming columns to `snake_case`, casting types (`stg_yellow_tripdata`).                                        |
| **Silver** (Intermediate) | `View`                        | Data cleaning. Filtering outliers (0 passengers), mapping Payment Codes to Labels, calculating Duration (`int_trips_cleaned`). |
| **Gold** (Marts)          | `Materialized View` / `Table` | Business-ready models. `fact_trips` (Wide table joined with Zones) and `dm_monthly_revenue` (Aggregates).                      |

---

## ❓ The 12 Business Questions Solved

We implemented dedicated analytics models for each of these questions to verify our data's value:

1.  **📊 Volume Trends**: _What is the distribution of trip volume by hour of day and day of week?_
2.  **💰 Revenue Analysis**: _How does total revenue evolve over months, and which vendor drives the most sales?_
3.  **👥 Passenger Behaviour**: _What is the average passenger count per trip, and does it vary by time?_
4.  **📉 Trip Efficiency**: _What is the relationship between trip distance and total fare amount?_
5.  **💳 Payment Preferences**: _What is the breakdown of payment types (Credit Card vs. Cash) across different boroughs?_
6.  **💵 Tipping Culture**: _What is the average tip percentage, and does it correlate with trip duration or distance?_
7.  **📍 Location Popularity**: _What are the top 10 most popular pickup and dropoff zones?_
8.  **🏷️ Rate Code Impact**: _How do different rate codes (Standard, JFK, Newark) affect the average trip cost?_
9.  **🚦 Congestion Fees**: _What is the total impact of congestion surcharges on overall revenue?_
10. **✈️ Airport Traffic**: _What is the volume of trips starting or ending at major airports (JFK, LaGuardia)?_
11. **⏱️ Speed Metric**: _What is the estimated average speed of trips by hour (derived from distance/time)?_
12. **🛣️ Long vs Short Haul**: _What is the proportion of short-distance city hops (< 2 miles) vs. long-distance commutes?_

---

## 🚀 How to Run

### Prerequisites

- Python 3.9+
- dbt-bigquery adapter
- Access to a Google Cloud Project

### Setup & Execution

1.  **Install Dependencies**:

    ```bash
    uv pip install dbt-bigquery # or pip install dbt-bigquery
    dbt deps
    ```

2.  **Authenticate**:
    Ensure your `profiles.yml` is configured for your BigQuery project.

3.  **Build the Pipeline**:
    This runs all seeds, models (staging → intermediate → marts), and tests.

    ```bash
    dbt build
    ```

4.  **View Analysis Results**:
    You can preview the answer to any question directly in the terminal:
    ```bash
    dbt show --select analytics_volume_trends
    ```

---

## 📂 Key Files

- **[case_study.md](nytaxi/case_study.md)**: A narrative article explaining the "Why" and "How" of the project in detail.
- **[looker_studio_guide.md](nytaxi/looker_studio_guide.md)**: Step-by-step instructions for connecting this data to a visual dashboard.
- **`models/marts/analytics/`**: The SQL logic for the 12 business questions.

---

Project by Vivek Murali
