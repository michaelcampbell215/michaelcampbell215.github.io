# CRM Dashboard Analysis

**Case Study: Sales Intelligence**

> **Executive Summary:**  
> To optimize conversion cycles and agent performance, this project engineered a high-fidelity pipeline monitor using Tableau. The analysis identified a critical 49% drop-off in the late-stage funnel and pinpointed top-performing agent behaviors that could be replicated. By visualizing pricing elasticity and regional benchmarks, the dashboard provides actionable intelligence to protect Q4 margins and improve closing rates.

---

| **Peak Revenue**            | **Cycle Time**                   | **Win Rate**                     | **Star Asset**                 |
| :-------------------------- | :------------------------------- | :------------------------------- | :----------------------------- |
| **$3.09M**<br>Q2 Generation | **48 Days**<br>Avg Deal Duration | **51%**<br>Closing Effectiveness | **GTX Pro**<br>Category Leader |

---

## Interactive Dashboard

[**View the Interactive Dashboard on Tableau Public**](https://public.tableau.com/views/crmdashboard2/PipelineOverview?:showVizHome=no&:embed=true)

---

## Building Operational Clarity

### 1. Funnel Bottleneck Analysis

**Visualized the transition from prospecting to engaging.**
Identified a significant drop-off (49%) in the late funnel, pinpointing the exact phase where sales force training should be prioritized.

### 2. Agent Benchmarking

**Engineered dynamic agent/region filters.**
Isolated top performer **Darcel Schlecht**, who outperformed the company baseline by 60%. Used these insights to define the "Ideal Closing Script."

### 3. Pricing Elasticity Tracking

**Developed calculated fields to compare actual close prices against targets.**
Revealed value positioning gaps in product lines that were frequently discounted in Q4.

---

## Strategic Recommendations

### Sales Optimization

- **Replicate Success:** Scale the specific negotiation behaviors of high-performers (like Darcel) across laggard regions.
- **Q4 Margin Protection:** Investigate discount triggers in Q4 to prevent unnecessary revenue erosion.

### Product Strategy

- **Inventory Focus:** Prioritize stock for the **GTX Pro** line due to its superior price integrity.
- **Positioning Pivot:** Re-evaluate "MG Special" marketing in underperforming sectors.

---

## Technical Implementation

### Data Structure

The analysis utilizes a Salesforce export dataset:

- **`CRM_dataset.zip`**: Contains the raw `.csv` or `.xlsx` files with Deal, Account, Agent, and Product tables.

### Setup Instructions

1.  **Prerequisites:** [Tableau Public](https://public.tableau.com/en-us/s/) or Tableau Desktop.
2.  **Usage:**
    - Unzip `CRM_dataset.zip`.
    - Open Tableau and connect to the extracted data file.
    - To recreate the visualizations, ensure you join the tables on `Opportunity ID` and `Agent ID`.

---

## Contact

**Optimize your Performance?**
[Email](mailto:mcam215@gmail.com) | [LinkedIn](https://linkedin.com/in/michaelcampbellanalyst) | [GitHub](https://github.com/michaelcampbell215)
