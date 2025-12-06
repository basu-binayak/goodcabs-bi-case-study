# ✅ **Transformation Steps — fact_passenger_summary**

1. **Source Folder Import**

   - Load all files from the folder:

     `D:\GITHUB_RESUME\goodcabs-bi-case-study\data`

2. **Select the Required File**

   - Filter and extract the file:

     **fact_passenger_summary.csv**

3. **Import CSV Content**

   - Read the CSV file using comma delimiter
   - Define 5 columns
   - Apply default encoding and no quote style

4. **Promote First Row to Headers**

   - Convert the first row into column headers

5. **Set Correct Data Types**

   - Convert:
     - `month` → _date_
     - `city_id` → _text_
     - `new_passengers` → _whole number_
     - `repeat_passengers` → _whole number_
     - `total_passengers` → _whole number_

6. **Trim Text Columns**

   - Remove leading/trailing spaces from `city_id`

7. **Merge with dim_month**

   - Join fact table with **dim_month** on the `month` column
   - Join type: _Left Outer_

8. **Expand dim_month**

   - Extract only the surrogate key `month_SK`

9. **Reorder Columns**

   - Place FK and date columns at the beginning, followed by measures

10. **Rename Columns**

- `month_SK` → `month_FK`
- `city_id` → `city_id_FK`

11. **Remove Original Date Column**

- Remove the `month` column (no longer needed after FK creation)

12. **Output Final Table**

- The cleaned and conformed fact table is returned for modeling

---
