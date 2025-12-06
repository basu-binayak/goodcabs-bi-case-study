# ✅ **Transformation Steps for `dim_city` Table**

1. **Load Files from Folder**

   - Reads all files from:

     `D:\GITHUB_RESUME\goodcabs-bi-case-study\data`

2. **Select the Required CSV File**
   - Picks `dim_city.csv` from the folder.
3. **Import CSV into a Table**
   - Uses comma delimiter.
   - Specifies 2 columns.
   - Encoding: 1252, `QuoteStyle.None`.
4. **Initial Data Type Conversion**
   - Converts `Column1` and `Column2` to text (preheader format).
5. **Promote First Row to Headers**
   - Turns row 1 into column names (`city_id`, `city_name`).
6. **Final Data Type Conversion**
   - `city_id` → text
   - `city_name` → text
7. **Merge With `city_target_passenger_rating` Dimension**
   - Left join on `city_id`.
   - Adds nested table with target rating values.
8. **Expand the Merged Table**

   - Extracts the column:

     `target_avg_passenger_rating`

---

# ✅ **Final Output Columns**

```
city_id
city_name
target_avg_passenger_rating
```

---
