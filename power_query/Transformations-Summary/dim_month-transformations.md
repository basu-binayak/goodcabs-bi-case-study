# ✅ **Transformation Steps for `dim_month` Table**

### **1. Load Source Files**

- Load all files from folder:

  `D:\GITHUB_RESUME\goodcabs-bi-case-study\data`.

### **2. Import the `dim_date.csv` File**

- Import using:
  - Delimiter: `,`
  - Columns: 4
  - Encoding: 1252
  - QuoteStyle: None.

### **3. Promote Headers**

- Convert first row to column names.

### **4. Convert Column Data Types**

- `date` → date
- `start_of_month` → date
- `month_name` → text
- `day_type` → text

### **5. Extract Only the Month-Level Column**

- Keep only the `start_of_month` column (`Removed Other Columns`).

### **6. Remove Duplicate Month Values**

- Ensure one row per month:
  - Using `Table.Distinct`.

### **7. Rename `start_of_month` → `month`**

- Establish the base month attribute.

### **8. Derive Month Attributes**

#### **Month Number**

- Add `month_no` = Date.Month(month).

#### **Full Month Name**

- Add `month_name` = Date.MonthName(month).

#### **Short Month Name**

- Add `month_name_short` = Date.ToText(month, "MMM").

### **9. Create Surrogate Key (`month_SK`)**

- Format: `YYYYMM`
- Example: `202301`.

### **10. Reorder Columns**

- Order for usability:

```
month_SK, month, month_no, month_name, month_name_short
```

### **11. Convert Types**

- `month_SK` → text
- `month_name_short` → text

### **12. Add Quarter-Level Attributes**

#### **Quarter Number**

- Add `quarter` = Date.QuarterOfYear(month).

#### **Start of Quarter**

- Add `start_of_quarter` = Date.StartOfQuarter(month).

---

# ✅ **Final Output Columns**

```
month_SK
month
month_no
month_name
month_name_short
quarter
start_of_quarter
```

---
