# ✅ **Transformation Steps for `monthly_target_new_passengers` Table**

1. **Load Files from Folder**

   - Reads all files from:

     `D:\GITHUB_RESUME\goodcabs-bi-case-study\data`

2. **Select the Required CSV File**

   - Picks `monthly_target_new_passengers.csv` from the folder.

3. **Import CSV into a Table**

   - Uses comma (`,`) as delimiter.
   - Specifies 3 columns.
   - Uses Encoding 1252 and `QuoteStyle.None`.

4. **Promote First Row to Headers**

   - Converts the first row into column names.

5. **Change Data Types**

   - `month` → **date**
   - `city_id` → **text**
   - `target_new_passengers` → **whole number (Int64)**

6. **Trim Text Columns**

   - Removes unwanted spaces in `city_id`.

7. **Merge with `dim_month`**

   - Left join on:
     - Fact table: `month`
     - Dim table: `month`
   - Adds nested `dim_month` table.

8. **Expand the `month_SK` Column**

   - Extracts only the surrogate key `month_SK`.

9. **Reorder Columns**

   Order set to:

   `month`, `month_SK`, `city_id`, `target_new_passengers`

10. **Rename Columns**

- `month_SK` → **month_FK**
- `city_id` → **city_id_FK**

11. **Remove Unwanted Columns**

- Drops the original `month` field (natural key).

---

# ✅ **Final Columns After Transformations**

```
month_FK
city_id_FK
target_new_passengers
```

---
