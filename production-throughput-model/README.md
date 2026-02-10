# Manufacturing Line Productivity Analysis

**Case Study: Manufacturing Excellence**

> **Executive Summary:**  
> A high-volume beverage bottling line was experiencing unexplained downtime, impacting daily throughput. This analysis leveraged Power Query to consolidate disparate data logs, enabling a root cause analysis that identified "Inventory Shortages" and specific "Machine Adjustments" as the primary drivers of lost time—not operator speed, as previously hypothesized. The findings led to a data-backed recommendation for targeted preventative maintenance on the CO-600 line.

---

| **Tools**           | **Impact**                  | **Focus**             | **Dataset**            |
| :------------------ | :-------------------------- | :-------------------- | :--------------------- |
| Excel & Power Query | Targeted Downtime Reduction | Operations Management | Beverage Bottling Line |

---

## Interactive Dashboard

[**View the Interactive Excel Dashboard**](https://1drv.ms/x/c/8513fca8776bf8ff/IQRhRLvDsMjGT7rxot3wKRslAfgDdu3AakwudErYXIhGjtA)

_(Note: This is a hosted Excel file. For the best experience, view in Excel Online)_

---

## The Analytical Process

### 1. ETL & Data Transformation (Power Query)

**Leveraged Power Query to merge disparate data sources into a unified fact table.**

- **Unpivoting Downtime Data:** The raw data contained 12 separate columns for downtime. I used **"Unpivot Columns"** to transform this into a "tall" schema (Downtime Factor, Minutes), allowing for proper aggregation.
- **Merging Sources:** Performed **"Merge Queries"** to join the `Line productivity` table with `Downtime factors`, linking specific downtime events to products and operators.
- **Complex Calculations:**
  - _Overnight Shifts:_ Created custom conditional logic (`if [End Time] < [Start Time] then...`) to correctly calculate durations for shifts crossing midnight.
  - _Efficiency Metrics:_ Calculated `Efficiency` (`Min Batch Time / Actual Production Time`) to benchmark performance.

### 2. Down-Time Segmentation

**Partitioned downtime into "Operator-Controllable" and "Systemic" categories to ensure fair performance assessment.**

- **Systemic Issues:** Isolated Machine Failures and Inventory Shortages, which proved to be the dominant factors.
- **Operator Performance:** Separated "Systemic" from "Operator" downtime to avoid penalizing staff for equipment failure. This highlighted specific training needs (e.g., distinct challenges for Operator 'Charlie' vs. 'Mac').

### 3. Root Cause Identification (Pareto Analysis)

**Deployed Pareto analysis to isolate the "Vital Few" factors.**

- **The 80/20 Rule:** Visualization confirmed that the top 3 downtime reasons—**Machine Adjustment, Machine Failure, and Inventory Shortage**—were responsible for the vast majority of lost time.

---

## Key Discoveries

### 1. Downtime Drivers

Identified that **Machine Adjustments** and **Inventory Shortages** were the primary bottlenecks, _not_ operator speed. The primary drivers are systemic.

### 2. Productivity Levers

The **CO-600 product line** demonstrated the highest variance in downtime. This specific format contributes disproportionately to line instability.

### 3. Temporal Patterns

Lost time is not random. It clusters around peak production hours (12 PM, 2 PM, 7 PM), suggesting that shift changes or break coverage may be contributing factors.

---

## Strategic Recommendations

> **"Shift from reactive machine fixing to a preventative maintenance schedule prioritized for the CO-600 line equipment."**

1.  **Preventative Maintenance:** Focus investigative efforts on `CO-600` line equipment.
2.  **Supply Chain Investigation:** Address the root cause of Inventory Shortages (planning vs. logistics).
3.  **Targeted Training:** Provide specific, time-of-day training for operators on the tasks they struggle with most.

---

## Technical Implementation

### Data Structure

The analysis is contained within a single Excel workbook with the following key components:

- **`Raw_Data` Worksheet:** Contains the uncleaned production logs.
- **`Power Query` Connections:**
  - `Line_Productivity`: Fact table containing production runs.
  - `Downtime_Factors`: Dimension table for downtime codes.
- **`Data Dictionary`:** A CSV file defining the 12 downtime categories.

### Setup Instructions

1.  **Requirements:** Microsoft Excel 2016 or later (for Power Query support).
2.  **Usage:**
    - Open `Manufacturing_Line_Productivity_Analysis.xlsx`.
    - Click **"Enable Content"** if prompted to allow data connections.
    - Navigate to the **"Dashboard"** tab to interact with the slicers (Operator, Machine, Date).
    - To view the ETL logic, go to `Data` -> `Queries & Connections` -> `Edit`.

---

## Contact

**Questions on this Analysis?**
[Email](mailto:mcam215@gmail.com) | [LinkedIn](https://linkedin.com/in/michaelcampbellanalyst) | [GitHub](https://github.com/michaelcampbell215)
