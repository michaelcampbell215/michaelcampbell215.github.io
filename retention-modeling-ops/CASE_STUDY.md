# Case Study: A Predictive Strategy for Customer Retention
## Project Overview

This case study details the development of a predictive model created to help a major bank reduce customer churn. The objective was to anticipate customer departures and create a strategy for early intervention. After analyzing customer patterns and optimizing a machine learning model, this project identified the key reasons for churn and delivered a tool capable of flagging 74% of potential churners, leading to a set of specific recommendations.

### Tools Used: Python, Pandas, Scikit-learn, Imbalanced-learn, Matplotlib, Seaborn


1. The Challenge: Stemming the Tide of Customer Churn
Consistent customer retention is crucial for long-term growth in the banking sector. The business faced a significant challenge with customer attrition, which impacted revenue and market stability. Historically, retention efforts were triggered only after a customer had already initiated the process of closing their account, making these efforts costly and often too late.

The central challenge was clear: How can we identify which customers are likely to leave ahead of time, and what specific actions can we take to convince them to stay?


2. The Approach: A Methodical Path from Data to Decision
The project followed several key steps to ensure the final conclusions were accurate and useful for the business.

Data Preparation & Feature Creation
The initial phase involved cleaning the customer dataset. To uncover deeper patterns, I created several new features from the existing data to capture more specific customer behaviors and financial situations. Key among these were:

BalanceSalaryRatio: To understand a customer's financial health beyond just their salary.
Germany_X_Balance: An interaction feature to test a hypothesis that the account balance of German customers had a unique relationship with their likelihood to churn.
These new features proved to be highly influential in the final model.

Modeling & Tuning
I evaluated several classification algorithms, with Random Forest and Gradient Boosting emerging as the top performers. Acknowledging that churners are a small fraction of the total customer base, I integrated techniques to ensure the model learned to recognize this minority group effectively, including using SMOTE to balance the training data for the Gradient Boosting model. The models underwent extensive hyperparameter tuning to find their most effective settings.

3. The Analysis & Key Findings
The Champion Model: Gradient Boosting
After comparing the optimized models, the Gradient Boosting Classifier was selected as the champion. While both models performed well, Gradient Boosting was better at achieving a higher Recall—our primary metric for success.

Strategic Thresholding for High Recall
A model's default 50% probability threshold is rarely optimal. I performed a threshold tuning analysis to find the "sweet spot" that best met our goal of capturing the most potential churners.

A decision threshold of 0.45 was selected. At this point, the model's final performance on unseen test data was:

Recall: 0.74 (We identify 74% of all customers who will actually churn)
Precision: 0.52 (When we flag a customer, we are correct 52% of the time)
The Drivers of Churn: Uncovering the "Why"
The final model revealed the key factors that influence a customer's decision to leave:

Age: Overwhelmingly the most important predictor.
Number of Products: A direct measure of a customer's integration with the bank.
HasCrCard: A critical indicator of being anchored in the bank's ecosystem.
IsActiveMember: A powerful behavioral signal of engagement.
The German Customer's Balance: The feature created for this analysis proved to be a top driver, confirming our hypothesis.
Profile of a Customer Likely to Churn
These findings allow us to paint a clear picture of a customer who shows patterns of leaving:

A typical customer who is likely to churn is heavily defined by their Age. They are weakly integrated into the bank, holding a low Number of Products and often not possessing a bank-issued Credit Card. They are frequently inactive. Furthermore, if the customer is from Germany, their account balance becomes a uniquely critical factor in their likelihood to churn.

4. Recommendations
Based on the findings from the analysis, we recommend the following strategies:

Launch an "Ecosystem Deepening" Campaign:

Observation: Low product count (#2) and no credit card (#3) are top churn drivers.
Action: Offer customers with only one product a pre-approved credit card with a bonus offer. This single action addresses two of the top three churn drivers.
Implement an Automated "Activity Nudge":

Observation: Inactivity (#4) is a major red flag.
Action: Trigger an automated communication to customers who have been inactive for a set period, offering an incentive to re-engage with their account.
Create a Specialized German Retention Desk:

Observation: The financial profile of German customers is a unique churn signal.
Action: Empower a specialized team to contact German customers identified by the model with tailored financial advice or competitive rates on their deposits.

5. Final Impact
The final output of this project is a model that can be used to guide retention efforts. By focusing resources on the specific group of customers who are most likely to leave—a group that includes 74% of all eventual churners—the bank can now engage the right people, with the right message, at the right time. This provides a clear, measurable path toward reducing customer attrition and protecting the bottom line.
