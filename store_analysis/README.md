# Super Store Analysis Project

## 📌 Project Overview
This project performs an end-to-end **data analysis of a retail superstore dataset** to understand sales, profit, customer behavior, delivery performance, discount impact, and product performance.  
The analysis is done using **Python (Jupyter Notebook)** and visualized using an **interactive Power BI dashboard**.

The project focuses on converting raw business data into **business insights and decisions** using structured data analytics workflow.

---

## 🎯 Business Objectives
The main business questions answered in this project:

1. How are **sales and profit trending over time**?
2. Which **regions** generate the most sales and profit?
3. Which **categories and segments** are most profitable?
4. What is the **impact of discount on profit**?
5. Which products are the **top profit contributors**?
6. Which products are the **top loss-making products**?
7. How efficient is the **delivery performance**?
8. Which **customer segments** drive revenue?

---

## 📂 Project Structure

superstore_project/
│
├── data/
│ ├── Sample - Superstore.csv # Raw dataset
│ └── clean_store_data.csv # Cleaned dataset
│
├── notebooks/
│ └── analysis.ipynb # Complete data analysis notebook
│
├── dashboard/
│ └── Super_Store_analysis.pbix # Power BI interactive dashboard
│
├── outputs/
│ ├── Yearly_sales_trend.png
│ ├── Total_profit_by_region.png
│ ├── Total_profit_by_category.png
│ ├── Total_profit_by_Segment.png
│ ├── Impact_of_discount_on_profit.png
│ ├── Top5_profit_products.png
│ ├── Top5_Loss_products.png
│ ├── Day_for_Delivery.png
│
├── config.py
├── README.md
└── Requirments.txt


---

## 🧠 Analysis Workflow (DA Industry Flow)

### 1️⃣ Business Understanding
Defined business problems before data exploration:
- Revenue growth
- Profit optimization
- Loss control
- Discount strategy
- Regional performance
- Product performance
- Delivery efficiency

---

### 2️⃣ Data Understanding
- Loaded raw dataset
- Checked:
  - Columns
  - Data types
  - Missing values
  - Duplicates
  - Invalid values
  - Date formats

---

### 3️⃣ Data Cleaning
- Date conversions
- Column standardization
- Delivery days calculation
- Profit validation
- Null handling
- Clean dataset creation

➡ Output: `clean_store_data.csv`

---

### 4️⃣ Feature Engineering
Created new analytical features:
- Year
- Delivery Days
- Aggregated Sales
- Aggregated Profit
- Product-level performance
- Segment-level performance

---

### 5️⃣ Exploratory Data Analysis (EDA)
Analysis done in `analysis.ipynb`:

- 📈 Yearly sales trend  
- 🌍 Sales by region  
- 💰 Profit by region  
- 🏷 Profit by category  
- 👥 Profit by segment  
- 📉 Discount vs profit relationship  
- 🏆 Top 5 profitable products  
- ❌ Top 5 loss-making products  
- 🚚 Delivery days distribution  

All visuals exported into `outputs/` folder.

---

### 6️⃣ Visualization
- Python (Matplotlib, Seaborn) → Static analysis graphs
- Power BI → Interactive business dashboard

---

## 📊 Power BI Dashboard Structure

### 📄 Page 1: Business Overview
- KPIs:
  - Avg Delivery Days  
  - Total Sales  
  - Total Profit  
  - Products Sold  
  - Total Orders  
- Visuals:
  - Sales Trend (Yearly)
  - Sales by Region
  - Profit by Region

### 📄 Page 2: Performance Analysis
- Profit by Category
- Profit by Segment
- Discount Impact on Profit
- Top 5 Profitable Products
- Top 5 Loss Products
- Drill-down Analysis:
  - Category → Sub-category → Product
  - Sales and Profit drilldowns

---

## 📌 Key Business Insights

### ✔ Sales & Growth
- Sales show **strong growth trend over years**  
- Indicates healthy business expansion

### ✔ Regional Performance
- West and East regions are **high-performing**
- Central and South regions need optimization strategy

### ✔ Category Performance
- Technology and Office Supplies are **high profit categories**
- Furniture shows **low profitability**

### ✔ Segment Performance
- Consumer segment is the **highest profit generator**
- Home Office segment is **lowest performing**

### ✔ Discount Strategy
- Higher discounts lead to **negative profit**
- Clear **inverse relationship** between discount and profit

### ✔ Product Performance
- Few products contribute to **major profit share**
- Some products consistently generate **loss**

### ✔ Delivery Performance
- Delivery time is stable but optimization can improve customer satisfaction

---

## 🎯 Business Decisions (Actionable Outcomes)

1. Reduce discounts on low-margin products  
2. Optimize pricing strategy for loss-making products  
3. Focus expansion in high-performing regions  
4. Improve Furniture category pricing strategy  
5. Promote high-profit products more aggressively  
6. Re-evaluate product portfolio for loss products  
7. Improve delivery efficiency for customer retention  

---

## 🛠 Tools & Technologies Used

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Jupyter Notebook
- Power BI

---

## 📌 Project Type
**Data Analytics Portfolio Project**  
(Industry-aligned DA workflow project)

---

## 👤 Author
Aditya Hagawane  
Data Analytics Portfolio Project