# Bank Customer Churn Prediction

**Case Study: Predictive Modeling**

> **Executive Summary:**  
> To address a 20% historical revenue leak, we engineered a machine learning pipeline to identify at-risk customers before they leave. By leveraging a Gradient Boosting classifier and addressing extreme class imbalance with SMOTE, the final model achieved a **74% Recall rate**, enabling the bank to proactively intervene with high-value retention offers.

---

| **Detection Rate**                     | **Model Champion**                       | **Primary Signal**               | **Geographic Leakage**              |
| :------------------------------------- | :--------------------------------------- | :------------------------------- | :---------------------------------- |
| **74% Recall**<br>Churn Identification | **Gradient Boost**<br>Optimized w/ SMOTE | **Age & Depth**<br>Product Count | **Germany**<br>Balance-Driven Churn |

---

## The Analytical Workflow

### 1. Data Preparation & Cleaning

**Data Dictionary:** [View Dictionary](./data/Bank_Churn_Data_Dictionary.csv)

- **Class Imbalance:** Applied SMOTE (Synthetic Minority Over-sampling Technique) to train the model on a balanced dataset, preventing bias towards the majority "Stay" class.
- **Feature Engineering:** Created interaction terms like `Germany_X_Balance` to capture specific regional risk profiles that baseline models missed.

### 2. Hyperparameter Optimization

**Methodology:**

- Utilized `GridSearchCV` and `RandomizedSearchCV` to fine-tune the Gradient Boosting classifier.
- Prioritized **Recall** over Accuracy to ensure we cast a wide enough net to catch potential churners, accepting a manageable false-positive rate.

### 3. Strategic Threshold Tuning

**Outcome:**

- Calibrated the decision threshold to **0.45**.
- This specific tuning maximized the identification of actual churners (74% Recall) while maintaining precision actionable for business retention teams.

---

## Strategic Recommendations

### Ecosystem Deepening

**Target:** Low-product accounts (1 product).
**Action:** Offer pre-approved credit cards or savings bundles to increase "stickiness" and integration depth.

### Automated Activity Nudges

**Target:** Inactive members with high balances.
**Action:** Trigger proactive engagement emails or app notifications to re-activate dormant relationships.

### Specialized German Retention Desk

**Target:** German customers with high account balances.
**Action:** Deploy a specialized support team trained to address competitive deposit rates, as this specific segment showed high sensitivity to balance levels.

---

## Technical Implementation

### Repository Structure

- **`data/`**: Contains raw and processed datasets (`Bank_Churn_Messy.xlsx`, `Bank_Churn_Enhanced_Features.csv`).
- **`notebook/`**: Jupyter Notebooks with full analysis code (`bank_churn_predictive_model.ipynb`).
- **`images/`**: Visualizations and model performance charts.

### Setup Instructions

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/michaelcampbell215/bank-churn-predictive-repo.git
    ```
2.  **Install dependencies:**
    ```bash
    pip install -r requirements.txt
    ```
3.  **Run the analysis:**
    - Navigate to `notebook/` and open `bank_churn_predictive_model.ipynb` in Jupyter Lab or VS Code.
    - Execute cells to reproduce the data cleaning, SMOTE application, and model training.

---

## Contact

**Questions on this Analysis?**
[Email](mailto:mcam215@gmail.com) | [LinkedIn](https://linkedin.com/in/michaelcampbellanalyst) | [GitHub](https://github.com/michaelcampbell215/retention-modeling-ops)

<!-- Last Sync: 02/10/2026 01:16:51 -->
