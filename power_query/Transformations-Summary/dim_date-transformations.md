# ✅ **Transformation Steps for `dim_date` Table**

### **1. Load Source Files**

- Load all files from folder:

  `D:\GITHUB_RESUME\goodcabs-bi-case-study\data`.

### **2. Select and Import the `dim_date.csv` File**

- Load the file content.
- Import using:
  - Delimiter: `,`
  - Columns: 4
  - Encoding: 1252
  - QuoteStyle: None.

### **3. Promote First Row to Headers**

- Converts first data row into column names.

### **4. Convert Data Types**

- `date` → date
- `start_of_month` → date
- `month_name` → text
- `day_type` → text

### **5. Remove Unnecessary Column**

- Drop the `month_name` column.

### **6. Create a Date Surrogate Key (`date_SK`)**

- Create `date_SK` using:

  `YYYYMMDD` format.

- Convert `date_SK` to text.

### **7. Reorder Columns**

- Bring `date_SK` to the first position.

### **8. Join With `dim_month` Table**

- Left join on:
  - dim_date.start_of_month ↔ dim_month.month
- Expand the `month_SK` column.

### **9. Add Date Attributes**

Create multiple derived calendar fields:

#### **Week Fields**

- `week_of_year` = Date.WeekOfYear(date)
- `week_of_month` = Date.WeekOfMonth(date)

#### **Day Fields**

- `day` = Day of month
- `day_of_week` = Day index (0–6)
- `day_name` = Day name (Mon, Tue, etc.)

### **10. Reorder Columns**

- Arrange columns in a standard date-dimension order.

### **11. Rename Month Key**

- Rename `month_SK` → `month_FK`.

### **12. Remove Intermediate Columns**

- Drop `start_of_month` after extracting month key.

---

# ✅ **Final Output Columns**

```
date_SK
date
month_FK
week_of_year
week_of_month
day
day_of_week
day_name
day_type
```

---
