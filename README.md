# 📊 **Goodcabs BI Case Study – Power BI Analytics Project**

## 🚕 **1. Problem Statement**

Goodcabs is an emerging cab service operating across ten tier-2 Indian cities, helping local drivers earn sustainably while providing high-quality service to passengers. Entering its third year of operations, the company has set ambitious 2024 performance goals focused on trip growth, customer satisfaction, and strengthening repeat passenger behavior.

The Chief of Operations **needs an immediate performance evaluation across key business metrics**—trip volume, revenue, passenger ratings, new vs repeat mix, and target achievement.

This project delivers a complete analytical solution using **Power BI** , combining data modelling, DAX calculations, and interactive dashboards to generate actionable insights for strategic and operational decision-making.

---

# 🗂️ **2. Data Model Metadata**

This project uses two databases: **trips_db** (operational data) and **targets_db** (performance targets).

## 📌 **2.1 trips_db Overview**

Contains both detailed and aggregated data covering cities, dates, trips, passengers, and repeat trip behavior.

### **1. dim_city**

**Purpose:** Enables city-level segmentation and location-based analysis.

**Fields:**

- **city_id:** Unique city identifier (e.g., RJ01)
- **city_name:** Name of the city (e.g., Jaipur, Lucknow)

### **2. dim_date**

**Purpose:** Provides time intelligence support for daily, monthly, and weekday/weekend analysis.

**Fields:**

- **date:** Actual date (YYYY-MM-DD)
- **start_of_month:** First day of the month for grouping
- **month_name:** Month name (e.g., January)
- **day_type:** Weekday or Weekend

### **3. fact_passenger_summary** _(Monthly Aggregated)_

**Purpose:** Summarizes passenger movement per city per month.

**Fields:**

- **month**
- **city_id**
- **total_passengers**
- **new_passengers**
- **repeat_passengers**

### **4. dim_repeat_trip_distribution** _(Monthly Aggregated)_

**Purpose:** Shows how often repeat passengers ride per month (1 to 10 trips).

**Fields:**

- **month**
- **city_id**
- **trip_count:** Trip frequency bucket (1-Trip, 2-Trips … 10-Trips)
- **repeat_passenger_count**

### **5. fact_trips** _(Trip-Level Detailed Fact)_

**Purpose:** Central fact table for analyzing fare, distance, ratings, and trip types.

**Fields:**

- **trip_id**
- **date**
- **city_id**
- **passenger_type:** New / Repeat
- **distance_travelled (km)**
- **fare_amount**
- **passenger_rating** (1–10)
- **driver_rating** (1–10)

## 📌 **2.2 targets_db Overview**

Contains monthly business targets for growth and service quality.

### **1. city_target_passenger_rating**

- **city_id**
- **target_avg_passenger_rating**

### **2. monthly_target_new_passengers**

- **month**
- **city_id**
- **target_new_passengers**

### **3. monthly_target_trips**

- **month**
- **city_id**
- **total_target_trips**

---

# 🎯 **3. Key Metrics for the Power BI Report**

This dashboard focuses on the following business KPIs:

### **A. Trip & Revenue Metrics**

1. Total Trips
2. Total Fare (Revenue)
3. Total Distance Travelled

### **B. Rating Metrics**

4. Average Passenger Rating
5. Average Driver Rating

### **C. Cost & Distance Metrics**

6. Average Fare per Trip
7. Average Fare per Km
8. Average Trip Distance
9. Trip Distance (Min/Max)

### **D. Trip Type Metrics**

10. New Trips
11. Repeated Trips

### **E. Passenger Metrics**

12. Total Passengers
13. New Passengers
14. Repeat Passengers
15. New vs Repeat Passenger Trips Ratio
16. Repeat Passenger Rate (%)

### **F. Growth & Target Metrics**

17. Monthly Revenue Growth Rate
18. Target Achievement Rate:
19. Trips Target
20. New Passenger Target
21. Avg Passenger Rating Target

---

# 🏗️ **4. Solution Architecture**

### **4.1 Data Preparation — Power Query (M Language)**

### **4.2 Data Modelling — Star Schema**

### **4.3 Business Logic — DAX**

### **4.4 Reporting**

### **4.5 Publishing**

- Publish the `.pbix` to **Power BI Service**
- Create dashboards by pinning visuals
- Set up refresh schedules and alerts

---

# 📥 **5. How to Download / Clone This Repository**

### **Clone the repository**

```bash
git clone https://github.com/<your-username>/goodcabs-bi-case-study.git
```

### **Download as ZIP**

1. Click the **Code** button
2. Select **Download ZIP**
3. Extract and open the `.pbix` file in Power BI Desktop

---

# 📦 **6. Repository Structure**

```
goodcabs-bi-case-study/
│
├── data/                        # Raw CSV/Excel data
├── power_query/                 # M language transformation scripts
├── dax_measures/                # All DAX calculations
├── models/                      # Data model diagrams & notes
├── reports/                     # Final Power BI (.pbix) file
├── dashboards/                  # Screenshots of report & dashboard
└── README.md                    # Project documentation
```

---

# 📝 **7. Project Outcome**

This project empowers Goodcabs leadership to:

✔ Track operational and financial performance

✔ Monitor customer satisfaction across cities

✔ Measure growth and target achievement

✔ Understand passenger acquisition and loyalty behavior

✔ Optimize city-wise strategy using actionable insights

---
