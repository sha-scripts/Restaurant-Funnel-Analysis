# Restaurant-Funnel-Analysis
This project analyzes funnel performance for a food delivery platform's restaurants using data from March 2025. The focus is on conversion rates (menu opens → cart built → orders) to identify bottlenecks and suggest improvements. Built with MySQL for data processing and Power BI for visualizations.

<img width="620" height="326" alt="image" src="https://github.com/user-attachments/assets/02ba0093-110d-4346-868f-f0355a31bd4d" />
  
*A Power BI funnel chart showing drop-offs from menu opens to orders by restaurant.*

Key Skills Demonstrated:
- SQL: Data cleaning, joins, aggregations (e.g., SUM, GROUP BY, NULLIF for error-handling).
- Power BI: Interactive dashboards (funnel charts, bar charts, conditional formatting).
- Analytics: Derived insights from small datasets, turning them into business recommendations.

## Tools and Technologies
- **MySQL**: For ETL and funnel metric calculations.
- **Power BI**: For visuals like funnel charts and conditional tables.
- Dataset: 3 CSVs (~100 orders, ~200 funnel rows, 17 restaurants) from a Mumbai-based platform.

## Project Steps
1. **Data Preparation (MySQL)**: Imported CSVs, cleaned blanks, aggregated daily orders (CREATE TEMP TABLE).
2. **Analysis (MySQL)**: Joined tables (LEFT JOIN on res_id and dt), calculated totals and rates (e.g., cart_conversion_rate = cart_built / menu_opens * 100).
3. **Visualization (Power BI)**: Imported results CSV, created funnel chart, bar chart for rates, and table with conditional formatting (red for low rates <20%).
4. **Insights & Recommendations**: Derived from output, focusing on restaurant performance.


## Insights
- Dominance of High-Engagement Restaurants: Delhi Zaika (Bandra, North Indian) leads with 12,344 menu opens and 2,119 orders, but average cart conversion (31.83%) indicates menu optimization potential.
- Cuisine-Based Trends: North Indian and Maharashtrian dominate with 17-31% overall conversion; South Indian and Cafes lag at 6-15%, suggesting preference mismatches.
- Conversion Drop-Off Patterns: Cart conversion averages 35-40%, but order conversion drops to 45-50%, with low performers like The Brooks Bistro (15.93% cart) showing early leaks.
- Area Disparities: Bandra outperforms (~18-21% overall) vs. Malad/Andheri (~7-15%), likely due to location advantages.
- Platform-Wide Bottleneck: Only ~17% of menu views convert to orders, highlighting cart-to-order friction.

## Recommendations
- Target Menu Optimization for Low Cart Conversion: A/B test simplified menus for The Brooks Bistro and Banana Leaf to boost cart conversion by 10-15%.
- Enhance Checkout for High-Engagement: Add discounts at cart stage for Delhi Zaika to increase order conversion to 60%, adding 200+ orders.
- Promote Top Cuisines/Areas: Onboard more North Indian in Malad; estimate 15% platform order uplift.
- Address Order Drop-Offs: Implement one-click payments globally, targeting <5% rates in Cafes/South Indian.
- Monitor Iteratively: Weekly Power BI refreshes for tracking, projecting 10-20% revenue from reduced drop-offs.

## Learnings & Challenges
- Debugged SQL queries (e.g., calculating conversion rates correctly).
- Handled dataset with robust functions (NULLIF, COALESCE).
- Improved dashboard usability with conditional formatting.
  
Questions or feedback? Connect on LinkedIn: [https://www.linkedin.com/in/shashankwork/]
