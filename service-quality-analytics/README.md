# Airline Passenger Satisfaction Analysis

**Case Study: Customer Experience**

> **Executive Summary:**  
> To mitigate churning among high-value customers, this analysis utilized Power BI to dissect passenger survey data. The findings revealed that while 70% of the passenger volume comes from Business Travelers, this same wide demographic reported "Wi-Fi Reliability" as their primary pain point. By isolating these key dissatisfaction drivers, we developed a roadmap to implement tiered service models and digital onboarding improvements.

---

| **Volume Share**           | **Dissatisfaction**          | **Top Driver**                           | **Pain Point**                 |
| :------------------------- | :--------------------------- | :--------------------------------------- | :----------------------------- |
| **70%**<br>Business Travel | **70%**<br>First-Time Flyers | **In-Flight Service**<br>Comfort & Staff | **Wi-Fi**<br>Connectivity Gaps |

---

## Interactive Dashboard

[**View the Interactive Dashboard on Power BI**](https://app.powerbi.com/view?r=eyJrIjoiMjQ0YTFjMDQtNjQxOC00YWJiLThlYzMtMTQwMzk1NTZjYjNiIiwidCI6ImRmODY3OWNkLWE4MGUtNDVkOC05OWFjLWM4M2VkN2ZmOTVhMCJ9)

---

## The Analytical Process

### 1. Power Query Transformation

**Redesigned raw survey data into a usable star schema.**

- Normalized Likert scale responses (1-5) for consistent aggregation.
- Handled null values in "Arrival Delay" and "Baggage Handling" columns to ensure statistical integrity.

### 2. Comparative Segmentation

**Executed a deep dive into traveler demographics.**

- Isolated **Business Class** vs. **Personal Eco** passengers.
- Revealed that price sensitivity inversely correlates with service expectations, validating the need for distinct service protocols.

### 3. Root Cause Identification

**Utilized correlation analysis to pinpoint dissatisfaction drivers.**

- "Ease of Online Booking" and "In-flight Wi-Fi" were strongly correlated with negative sentiment, even when reported "Seat Comfort" was high.

---

## Strategic Recommendations

### Service Strategy

- **Tiered Wi-Fi Pricing:** Implement premium bandwidth options for business travelers who require connectivity, turning a pain point into a revenue stream.
- **First-Time Flyer Onboarding:** Launch targeted pre-flight emails to guide new passengers through the check-in process, addressing the 70% dissatisfaction rate in this segment.

### Digital Optimization

- **UX Redesign:** overhaul the online booking flow to reduce friction.
- **App Integration:** Add real-time airport navigation to the mobile app to improve the ground experience.

---

## Technical Implementation

### Data Structure

The analysis utilizes the Airline Passenger Satisfaction dataset:

- **`airline_passenger_satisfaction.csv`**: Contains 100k+ rows of survey feedback alongside demographic data.
- **`data_dictionary.csv`**: Definitions for survey columns.

### Setup Instructions

1.  **Prerequisites:** Power BI Desktop.
2.  **Usage:**
    - Open Power BI Desktop.
    - Select **Get Data** -> **Text/CSV**.
    - Import `airline_passenger_satisfaction.csv`.
    - Apply the transformation steps (or open logic in Power Query Editor) to handle the null values in the 'Arrival Delay in Minutes' column.

---

## Contact

**Questions on this Analysis?**
[Email](mailto:mcam215@gmail.com) | [LinkedIn](https://linkedin.com/in/michaelcampbellanalyst) | [GitHub](https://github.com/michaelcampbell215)
