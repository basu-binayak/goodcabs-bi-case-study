# ✅ **Main Transformations Applied to `fact_trips`**

### **1. Data Source Import**

- Loaded all files from folder

  `D:\GITHUB_RESUME\goodcabs-bi-case-study\data`

- Extracted and imported **fact_trips.csv**

### **2. CSV Parsing**

- Used `Csv.Document` to read the file
- Applied correct delimiter, column count, and encoding

### **3. Header & Data Type Cleaning**

- Promoted first row to column headers
- Assigned proper data types:
  - `trip_id`, `city_id`, `passenger_type` → **text**
  - `date` → **date**
  - Distance, fare, and ratings → **whole number**

### **4. Text Standardization**

- Trimmed leading/trailing spaces from:

  - `city_id`
  - `passenger_type`

- Converted `passenger_type` to **UPPERCASE** for consistency

  (useful for consistent joins and DAX)

### **5. Date Dimension Join**

- Performed a **Left Join** between `fact_trips` and `dim_date`

  using the `date` column

- Expanded the `date_SK` surrogate key

### **6. Column Cleanup**

- Reordered columns for clarity
- Renamed:

  - `date_SK` → `date_FK`
  - `city_id` → `city_id_FK`

- Removed the original `date` column

  (only surrogate key retained)

### **7. Final Output**

- Returned the cleaned and conformed **fact_trips** table
- Now standardized, conformed, and ready for star schema modeling

---
