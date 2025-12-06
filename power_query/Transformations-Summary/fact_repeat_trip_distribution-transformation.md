# ✅ **Transformation Steps for `dim_repeat_trip_distribution` Table**

1. **Load Folder Files**

   - Reads all files from the folder:

     `D:\GITHUB_RESUME\goodcabs-bi-case-study\data`

2. **Filter to the target CSV file**

   - Selects: `dim_repeat_trip_distribution.csv`
   - Extracts binary **Content** .

3. **Import CSV**

   - Converts the binary into a table using:
     - Delimiter: **Comma (, )**
     - Columns: **4**
     - Encoding: **1252**
     - QuoteStyle: **None**

4. **Promote Headers**

   - Converts the first row into column headers.

5. **Change Column Types**

   - `month` → **date**
   - `city_id` → **text**
   - `trip_count` → **text**
   - `repeat_passenger_count` → **whole number (Int64)**

6. **Trim Text Columns**

   - Trims spaces from `city_id`
   - Trims spaces from `trip_count`

7. **Convert trip_count to Uppercase**

   - Applies `Text.Upper` to standardize values such as `"One"`, `"TWO"` etc.

8. **Merge with `dim_month`**

   - Key: `month`
   - Join type: **Left Outer**
   - Adds a nested table `dim_month`.

9. **Expand dim_month**

   - Extracts `month_SK`
   - Adds it as a new column.

10. **Reorder Columns**

    New order:

    `month`, `month_SK`, `city_id`, `trip_count`, `repeat_passenger_count`

11. **Rename Columns**

    - `month_SK` → **month_FK**
    - `city_id` → **city_id_FK**

12. **Remove Original Month Column**

    - Deletes the raw `month` column
    - Ensures only the surrogate key `month_FK` remains.

---

# ✅ **Final Output Columns**

```
month_FK
city_id_FK
trip_count
repeat_passenger_count
```

---
