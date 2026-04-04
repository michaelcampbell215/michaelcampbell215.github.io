# Healthcare Payments Compliance & Spend Analytics

[![Tableau](https://img.shields.io/badge/Tableau-Interactive_Dashboard-E97627.svg)](https://public.tableau.com/views/SupplyChainCommandCenter/LogisticsDashboard)
[![MySQL](https://img.shields.io/badge/Backend-MySQL_Star_Schema-4479A1.svg)](../healthcare-data-engineering)
[![BigQuery](https://img.shields.io/badge/Migration-BigQuery_%2F_dbt-4285F4.svg)](../healthcare-data-engineering)

> [!IMPORTANT]
> **Executive Summary:** This project eliminates operational blind spots by reconciling **15.4M records of CMS Open Payments federal healthcare data**. Built as a regulatory-grade single source of truth, it directly enables $11.7M in compliance risk mitigation and surfaces a $170M+ anomaly event through Z-Score statistical analysis — with an active migration to BigQuery on GCP underway.

**Strategic Assets:**
*   **Live Operational Dashboard:** [View on Tableau Public](https://public.tableau.com/views/SupplyChainCommandCenter/LogisticsDashboard)
*   **Engineering Logic (Backend):** [Healthcare Data Engineering Pipeline](../healthcare-data-engineering)

---

## Project Overview

Operations leaders lacked visibility. Critical spending and logistics data were fragmented across disconnected systems, making it impossible to map physical unit movement against discretionary spend. This created a massive $11.7M "Unknown Product" compliance exposure and revenue concentration risk that went entirely unmeasured.

1. **Description:** We engineered a unified analytical layer to reconcile compliance risk, sales cyclicality, and logistics throughput simultaneously.
2. **Objective:** Establish a single source of truth to identify regulatory exposure, optimize forwarding locations, and measure precise revenue concentration.

## Data Sources

1. **Primary Datasets:** 15.4 million raw transactions of CMS (Centers for Medicare & Medicaid Services) Open Payments and physical logistics logistics tracking.
2. **Additional Data:** Geographic and regional mapping coordinates for hub-and-spoke logistics modeling.

## Process

*   Integrated fragmented ERP and compliance systems to create a unified "Golden Record" dataset.
*   Deployed geospatial analysis to track lead-time variance from national hubs to local ZIP codes.
*   Measured revenue dependency mathematically (Lorenz/Whale Curve) to identify reliance on top-tier accounts.
*   Engineered a visual intelligence dashboard using Tableau to expose hidden patterns in spending and distribution.

## Technical Pivot

*   **From Reactive Audits to Proactive Thresholds:** Instead of manually reviewing static reports after the fact, we hardcoded statistical Z-Scores into the data pipeline. This allowed the system to automatically flag anomalous spending behavior as it happens, shifting the burden from human auditors to an automated detection system.

## Key Insights

*   **Compliance Risk Isolated:** Identified $11.7M in discretionary spend with no associated product code. This specific payment signature is a primary federal audit trigger, providing leaders with immediate visibility for risk mitigation.
*   **Geographic Distribution Inefficiency:** Discovered that San Diego drives significantly higher surgical device throughput than Los Angeles. This contradicts the high-level assumption that population size strictly dictates demand, proving the need for a localized distribution center in San Diego.
*   **Severe Revenue Dependency:** Confirmed that 80% of revenue relied on just the top 2% of accounts. This extreme concentration transforms routine customer attrition into a major financial event.

## Recommendations

*   **Mitigate Regulatory Exposure:** Execute immediate internal audits on the specific geographical clusters flagged with the $11.7M in undocumented product spend.
*   **Optimize Logistics Footprint:** Prioritize San Diego for the next Forward Stocking Location (FSL) deployment to maximize throughput efficiency and reduce last-mile transit times.
*   **Diversify Account Dependency:** Shift commercial strategy to intentionally grow mid-tier accounts, reducing the financial risk associated with losing one of the top 2% of clients.

## Next Steps & Action Plan

*   **Automated Alerting:** Deploy automated subscriptions so stakeholders are notified the moment spending behavior or distribution times cross critical threshold lines.
*   **Predictive Replenishment:** Evolve the current regional demand signals into a proactive model that triggers inventory purchase orders when a product drops below safety stock levels.
