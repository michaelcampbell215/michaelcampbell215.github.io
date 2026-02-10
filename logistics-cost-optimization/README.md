# Global Supply Chain Performance

**Case Study: Cost Optimization**

> **Executive Summary:**  
> A global logistics team needed deeper visibility into shipment reliability and cost efficiency. This project engineered an interactive analytics tool using Python for data engineering and Tableau for visualization. The analysis revealed an 88.5% On-Time Delivery (OTD) rate and identified that 99% of logistics costs were concentrated in just two product groups, providing a clear target for cost-reduction negotiations.

---

| **OTD Rate**                     | **Cost Focus**                 | **Mode Reliability**            | **Lead Time**                      |
| :------------------------------- | :----------------------------- | :------------------------------ | :--------------------------------- |
| **88.5%**<br>Overall Performance | **ARV / HRDT**<br>99% of Spend | **Air Charter**<br>100% On-Time | **88 vs 144 Days**<br>Air vs Ocean |

---

## Interactive Dashboard

[**View the Interactive Dashboard on Tableau Public**](https://public.tableau.com/views/supplychain_17339884476900/GLOBALDELIVERYPERFORMANCEOVERVIEW?:showVizHome=no&:embed=true)

---

## The Analytical Process

### 1. Data Engineering (Python)

**Leveraged Pandas for extensive data wrangling.**

- Handled missing capture dates and non-numeric costs.
- Imputed NULLs for "Line Item Insurance" and "Shipment Modes".
- Standardized Weight & Freight Cost conversions for accurate aggregation.

### 2. KPI Development

**Identified core metrics critical to logistics spend.**

- **OTD Rate:** Calculated by Country & Vendor to pinpoint delay sources.
- **Freight %:** Measured against Line Item Value to track efficiency.

### 3. Interactive Visualization

**Deployed Tableau dashboards with dynamic filters.**
Enabled ad-hoc exploration by Country, Shipment Mode, and Product Group to support real-time decision-making.

---

## Key Insights & Strategy

### 1. Cost Concentration

**Insight:** ARV and HRDT product groups account for **99% of total logistics spend** ($1.46B+).
**Strategy:** Focus all initial cost-saving negotiations on these high-volume routes.

### 2. Mode Reliability

**Insight:** Ocean shipments (84% OTD) and standard Air (88% OTD) drive most delays, while Air Charter performed perfectly.
**Strategy:** Conduct a cost-benefit analysis on shifting critical, low-volume shipments to Air Charter to improve reliability.

### 3. Lead Time Variance

**Insight:** Significant variability between Air (88 days) and Ocean (144 days) necessitates distinct planning horizons.
**Strategy:** Update inventory reorder points to reflect real-world lead times by mode.

---

## Technical Implementation

### Data Structure

The analysis utilizes the SCMS Delivery History dataset:

- **`SCMS_Delivery_History_Dataset.csv`**: Historical shipment data including vendors, costs, and dates.
- **`supply_chain.ipynb`**: Jupyter Notebook containing the data cleaning and feature engineering logic.

### Setup Instructions

1.  **Prerequisites:** Python 3.x (Pandas, NumPy) and Jupyter Notebook.
2.  **Usage:**
    - Run `supply_chain.ipynb` to process the raw CSV.
    - The notebook outputs `shipping_data_clean.csv`.
    - Import the clean CSV into Tableau to refresh the visualizations.

---

## Contact

**Questions on this Analysis?**
[Email](mailto:mcam215@gmail.com) | [LinkedIn](https://linkedin.com/in/michaelcampbellanalyst) | [GitHub](https://github.com/michaelcampbell215)
