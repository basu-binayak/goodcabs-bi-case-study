# ✅ **Transformation Steps for `fact_monthly_target_trips` Table**

1. **Load folder files**

   - Reads all files from the path:

     `D:\GITHUB_RESUME\goodcabs-bi-case-study\data`

2. **Select the target CSV file**

   - Extracts the binary **Content** of `monthly_target_trips.csv`.

3. **Import CSV**

   - Converts the binary data into a table using:
     - Delimiter: **comma (,)**
     - Columns: **3**
     - Encoding: **1252**
     - QuoteStyle: **None**

4. **Promote Headers**

   - First row → column headers.

5. **Change Data Types**

   - `month` → **date**
   - `city_id` → **text**
   - `total_target_trips` → **whole number (Int64)**

6. **Sort Rows by Month**

   - Orders by `month` ascending.

7. **Trim Text Columns**

   - Removes extra spaces from `city_id`.

8. **Merge with `dim_month`**

   - Join on `month` using **Left Outer join** .
   - Adds a nested `dim_month` table.

9. **Expand month surrogate key**

   - Extracts `month_SK`.
   - Adds as a new column.

10. **Reorder Columns**

    Order set as:

    `month`, `month_SK`, `city_id`, `total_target_trips`.

11. **Rename Columns**

    - `month_SK` → **month_FK**
    - `city_id` → **city_id_FK**

12. **Remove Original month Column**

    - Keeps only the surrogate key `month_FK`.

---

# ✅ **Final Output Columns**

```
month_FK
city_id_FK
total_target_trips
```

---
