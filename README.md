# Olist_Ecommerce Power BI Report

Olist is a Brazilian retail-as-a-service platform, founded in 2015, that helps connect small & medium sized retailers to large online marketplaces, ecommerce platforms and more. Olist has grown a lot as a business with over 98,000 customers and has become a central hub for buying/selling products across the country of Brazil.

## Project Overview

This project analyzes the Olist e‑commerce dataset to uncover trends & insights about:

- Customer distribution and purchasing behavior
- Regional performance across Brazilian states
- Product category revenue and satisfaction trends
- Seller performance and delivery reliability
- Refund and cancellation patterns
- Monthly revenue and order trends over time


An interactive dashboard and analysis report can be downloaded [here](https://github.com/erickcalderon1399/Olist_Ecommerce/blob/main/Olist_Ecommerce.pbix).

A SQL file (PostgreSQL) used to create the database, and to insert and alter data prior to loading to Power BI, as well as the original Excel files containing the datasets, can be found [here](https://github.com/erickcalderon1399/Olist_Ecommerce)


## Dataset Description

Below is the dataset structure which includes multiple relational tables including information on 
- Orders (when they were made, status of the orders, estimated delivery dates, date of delivery etc)
- Items (price, freight value, etc)
- Products (categories, dimensions)
- Sellers (id, location)
- Customers (id, location)
- Payments (type, value)
- Reviews (scores, dates)

<img width="832" height="792" alt="image" src="https://github.com/user-attachments/assets/0fa0d2b7-461c-4353-afec-44a2aba79b6a" />



## Report Pages & Key Insights

1. Overview Page
<img width="1201" height="672" alt="image" src="https://github.com/user-attachments/assets/49e2f961-2fe4-4d2d-b235-11c737b75091" />

- Order volume grew steadily from September 2016, until peaking in November 2017
- From there, Orders remain stable until drastically declining in September 2018
- Despite this dip in September, Revenue increased by $1.5 million from 2017 ($7.09M) to 2018 ($8.59M)
- The winter months (May - August) seem to generate the most revenue historically
- Users can click on a specific year in the legend to filter data by that year, or on a single bar in the chart to filter data by the selected month-year
  
<img width="1200" height="671" alt="image" src="https://github.com/user-attachments/assets/ce953a39-0e91-40a0-95a8-46aeca2203c9" />

- Refund rate has dropped from 10.03% in 2016 to just 0.89% in 2018, indicating strong fulfillment reliability.
- Review scores skew heavily toward 5 stars (Over 80% of review scores are 4 stars or higher).
- Total Revenue and Order Volume increasing by year, the Refund Rate decreasing by year, and a large proportion of high Review Scores shows that business is trending positively overall
- Late Delivery Rate has increased from 6.63% in 2017 to 9.37% in 2018, so there is still some room for improvement


2. Customer & Region Overview
<img width="1532" height="867" alt="image" src="https://github.com/user-attachments/assets/4e717794-0027-4f36-b51e-4af45faed620" />

- Customer distribution is heavily concentrated in southeastern states.
- Northeastern states show the highest late delivery rates.
- Revenue and Total Customers is dominated by São Paulo, followed by Rio de Janeiro, and Minas Gerais.
- Repeat Purchase Rate appears to be low at only 3.12% overall, indicating that most customers have only made a single purchase


  <img width="1415" height="802" alt="image" src="https://github.com/user-attachments/assets/ce2ef1e6-93cb-4a98-ad34-ee38d3478177" />

- Users can right‑click a state to drill through to the Region Drill-through page for more detail.

- <img width="1410" height="792" alt="image" src="https://github.com/user-attachments/assets/d244f9c2-0e64-4e8d-915b-766ebc64343a" />


3. Product Category Performance
<img width="1535" height="861" alt="image" src="https://github.com/user-attachments/assets/6c2b08b7-be8a-4ebc-bb8e-472aebeb7523" />

- Health & Beauty, Watches & Gifts, and Bed Bath & Table lead in total revenue. Bed Bath & Table and Health & Beauty were also the highest ordered products
- Though Children's Clothes and the CDs DVDs & Musicals are 2 of the 3 categories that have generated the least revenue, they also have the highest average review score among all products. They are simply just lacking in orders.
- Computers by far have the highest Average Order Value (AOV) among product categories, with almost double the second highest category.
- Books (general interest & technical) seem to be the highest rated products among those with over 200 orders.
- Practically all categories have an average review score above 3 except the Security & Services category.
- Office Furniture is the only category with a large order volume that has an average review score below a 3.8. 




4. Seller Performance
<img width="1415" height="797" alt="image" src="https://github.com/user-attachments/assets/0879613d-5378-4a15-bf76-ed89e90f2629" />


- The top sellers by order volume are located in São Paulo
- The scatter plot shows that lower late delivery rates unsurprisingly correlate with higher review scores
- Fortunately, all the sellers with higher late delivery rates also tend to have very lower order volume, so they make up only a small proportion of all orders being made with olist.

- <img width="1412" height="797" alt="image" src="https://github.com/user-attachments/assets/ba29fb4c-3507-49aa-8412-6b3b1f46d8ed" />

- Users can use zoom sliders on the scatter plot to zoom in/out and can also click any points to filter by the seller represented
- There are a handful of sellers, such as the one shown above from São Paulo, who have more than a few orders but very low review scores and high late delivery rates. They appear to consistently provide low quality and service.

- <img width="1532" height="861" alt="image" src="https://github.com/user-attachments/assets/81eed548-d5f2-4ff1-8d07-fdd516294068" />

- On a more positive note, there are other sellers, such as the one shown above from Rio de Janeiro, who have consistently sold items with very low delivery rates and high review scores. 


# Key Recommendations

#### Improve delivery reliability in northeastern states  
- Late delivery rates are consistently highest in this region, suggesting a need for operational review, logistics optimization, or improved carrier partnerships.
- Conduct a root-cause analysis of carriers, warehouse proximity, and shipping routes to reduce delays.

#### Address low repeat purchase rates  
- With over 95% of customers purchasing only once, targeted retention strategies (loyalty programs, personalized offers, post‑purchase engagement) could significantly increase lifetime value.

#### Promote high‑satisfaction, low‑volume product categories  
- Categories such as Children’s Clothes and CDs/DVDs show excellent review scores but low order volume. These are strong candidates for targeted marketing campaigns and improved search placement

#### Investigate underperforming sellers  
- A small number of sellers show extremely low review scores and high late delivery rates. These sellers should be reviewed, coached, or removed to protect platform reputation.

#### Reward and elevate high-performing sellers  
- Sellers with consistently low late delivery rates and high review scores should be featured more prominently and could also be promoted through “Top Seller” badges or priority placement.

#### Expand product category insights into strategic planning  
- Categories with high AOV (e.g., Computers) may warrant premium placement. This can be done with 'Featured Products' or 'Top-of-category' placement or featuring them in email or push notification highlights.


