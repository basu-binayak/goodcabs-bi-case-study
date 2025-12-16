# 🧠 Dashboard Architecture (High Level)

You should think in **4 layers** :

1. **Executive Overview** – “How is the business doing?”
2. **City Performance** – “Where are we winning/losing?”
3. **Customer Behavior** – “Are users coming back?”
4. **Operations & Quality** – “Is the service good?”

Each layer → 1 page (or section).

---

## 1️⃣ Executive Overview (Landing Page)

🎯 **Audience** : Leadership / Stakeholders
🎯 **Goal** : 10-second health check

### 🔢 KPI Cards (Top Row)

Use **Card / KPI visuals**

- Total Trips
- Total Revenue (Fare)
- Avg Trip Distance
- Avg Passenger Rating
- Repeat Passenger %

📌 Add **trend indicator** (↑ ↓) vs previous month

---

### 📈 Trend Line (Core Growth)

**Line chart**

- X: Month
- Y: Total Trips
- Optional legend: City (Top 5 only)

Why?
👉 Shows growth, seasonality, stability

---

### 🧭 New vs Repeat Mix

**100% Stacked Column Chart**

- Axis: Month
- Values: New Trips, Repeat Trips

Why?
👉 Instantly shows whether retention is improving

---

## 2️⃣ City Performance Dashboard

🎯 **Audience** : Regional / Ops managers
🎯 **Goal** : Identify top & bottom cities fast

---

### 🏙️ City Ranking Bar Chart (Dynamic Metric)

(You already built this 👏)

- Axis: City
- Value: **Metric Selector (Trips / Fare / Distance / Rating)**
- Controlled by **Field Parameter**

📌 Add:

- Top N slicer (Top 3 / 5 / 10)
- Conditional color for Top / Bottom

---

### 🧾 City Performance Table (Analytical)

**Table / Matrix**

Columns:

- City
- Total Trips
- Total Fare
- Avg Fare / Trip
- Repeat %
- Avg Rating

Why?
👉 Used by analysts & ops for deep comparison

---

### 🔥 Contribution Chart

**Treemap**

- Group: City
- Value: Total Fare or Trips

Why?
👉 Shows revenue concentration risk
(“Top 3 cities = 60% revenue?”)

---

## 3️⃣ Customer Behavior & Retention

🎯 **Audience** : Product / Growth teams
🎯 **Goal** : Understand loyalty & churn signals

---

### 🔁 New : Repeat Ratio (Key Metric)

**Card with conditional formatting**

- Green: Repeat-heavy
- Amber: Balanced
- Red: New-heavy (for mature cities)

---

### 📉 Retention Trend

**Line chart**

- X: Month
- Y: Repeat %
- Legend: City or City Group

Why?
👉 Trend matters more than absolute value

---

### 📊 City vs City Retention

**Scatter Plot (Very business-grade)**

- X: Repeat %
- Y: Avg Passenger Rating
- Bubble size: Total Trips
- Color: City tier (Metro / Tier-2)

Why?
👉 Identifies _high-volume but low-retention_ cities

---

## 4️⃣ Operations & Quality

🎯 **Audience** : Ops / CX teams
🎯 **Goal** : Service quality monitoring

---

### ⭐ Rating Distribution

**Histogram or Column chart**

- Axis: Rating (1–5)
- Value: Trip Count

Why?
👉 Reveals skew (many 3-star trips = warning)

---

### 🚦 Target vs Actual Rating

**Bullet chart / Bar with target line**

- Actual Avg Rating
- Target Rating (from your dim table)

Why?
👉 Immediate SLA visibility

---

### 📆 Day-Type Analysis

**Column chart**

- Axis: Day Type (Weekday / Weekend / Holiday)
- Values: Trips, Avg Fare

Why?
👉 Capacity & pricing decisions

---

## 🎛️ Must-Have Slicers (Business Friendly)

Place in a **left-side slicer panel** :

- City
- Month / Year
- Metric Selector (Trips / Fare / Distance)
- Top N Cities
- Day Type (Weekday / Weekend)

📌 Avoid clutter — slicers ≠ filters dump

---

## 🔥 Advanced (Optional, but impressive)

### 🧠 Smart Tooltips

On hover show:

- Trips
- Repeat %
- Avg Rating
- Revenue contribution

### 🚨 Conditional Alerts

Example:

- Repeat % < 30% → Red
- Avg Rating < 4.2 → Warning icon

---

## 🏆 What makes this “business-grade”?

✔ Clear storytelling
✔ Trend > snapshot
✔ Comparison > decoration
✔ Actionable metrics
✔ No vanity visuals

This is **exactly** how real mobility dashboards (Uber/Ola/Grab) are structured.

---

If you want, next we can:

- Map **each visual → business question**
- Write **dashboard narration** (for interviews)
- Optimize **DAX for performance**
- Create a **README dashboard walkthrough**

Just tell me the next step 👌
