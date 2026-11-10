Black Friday. Nov 24, 2017 had 1,176 orders vs ~220/day on the other November days (≈5x). The following days were also elevated (380–499). Consistent with Black Friday; no promotion data available to confirm.

Repeat purchases (delivered only). 2,801 of 93,358 customers (3.00%). Consistent with the all-orders figure (3.12%), so cancellations don’t explain it. Causes untested. Candidate hypotheses: delivery delays, review scores, product category.

Orders without items. 775 orders have no items: 603 unavailable, 164 canceled, and 8 in other statuses (5 created, 2 invoiced, 1 shipped). All 96,478 delivered orders have items, so revenue is unaffected. The shipped order without items is anomalous and flagged.

Delivery performance. 6.8% of delivered orders arrived after the estimated date; median delivery was 12 days before the estimate (IQR: 17 to 7 days early). 8 delivered orders have no delivery date. Extremes (−147, +188 days) need review. Possible estimate padding, untested.

The column called 'customer_zip_code_prefix' was modified from int to str because this value is a label if we keep the int data type it would eliminate the leading zeros for example 01001 = 1001.

The average review score is ~4.29, for orders that were delivered on time, while it is ~2.27 for orders that were delivered late.

When a delivery is delayed, customer satisfaction drops significantly, showing that logistical delays are a critical driver of negative reviews. 

Undefined Payment type: There are 3 orders with undefined payment type and their payment_value = 0.0 raising doubts about those orders. Investigating on the 'orders' dataset we were able to identified those orders were cancelled, so revenue is unaffected.

Sales with higher financing amounts have a higher value for example 1 installament sale average value is ~$112 and 10 installment sales average value is ~$415. 

There are 2 credit card transaction where their payment_installments = 0 ($58.69 and $129.94). Both orders were succesfully delivered, indirecting a data logging where 1 installment was recorded as 0. 

Basket size. 90.06% of orders consist of a single item (mean: 1.14 items/order, median: 1.0). The marketplace is predominantly driven by single-unit purchases, with little basket consolidation or cross-selling.

Freight impact. The aggregate freight-to-merchandise ratio is 16.57% (freight accounts for nearly 1/6th of product value). Median product price is $74.99 with a median freight cost of $16.26 (mean price: $120.65, mean freight: $19.99).

Top categories & high-ticket effect. While "bed_bath_table" leads total sales volume (11,115 items, average ticket ~$93), "health_beauty" ($1.25M) and "watches_gifts" ($1.20M) generate the highest total revenue. "watches_gifts" enters the top 2 in revenue despite lower volume (5,991 items) due to its high average ticket (~$201), showing the difference between volume-driven and margin/ticket-driven categories.

Catalog data quality & translation gap. 1,603 items (1.42% of total sold items) lack a product category in the raw data. Furthermore, 24 items across 2 categories ("portateis_cozinha_e_preparadores_de_alimentos" [15] and "pc_gamer" [9]) exist in Portuguese but are missing from the English translation dictionary, posing a risk of silent data omission in English-based reporting.

Supply & demand concentration. SP concentrates 59.74% of sellers versus 41.98% of customers, creating an inherent geographic imbalance between supply and demand.

Interstate shipments. 63.82% of all sales cross state borders, confirming heavy reliance on long-haul interstate logistics.

Delivery time disparity. SP achieves a median delivery time of 7 days, while Northern states (AP, AM, RR) take 24–25 days (over 3.5x slower).

Regional delay hotspots. AL (23.93%), MA (19.67%), and PI (15.97%) experience the highest delay rates in the country, more than double to triple the national delay rate (~7%), pinpointing the Northeast as the primary driver of logistics-related customer dissatisfaction.

Monthly growth & volume-driven expansion. Between January 2017 and July 2018 (reliable 19-month window), monthly delivered orders grew ~8.2x (from 750 to 6,159 orders/month) and revenue grew ~7.8x (from $111.8k to $868.0k/month).

AOV stability across growth. Average Order Value (AOV) remained remarkably stable throughout the expansion, fluctuating narrowly between $124 and $149 (ending at $140.92 in July 2018, a -5.45% change vs. January 2017). This confirms that top-line revenue growth was entirely driven by customer and order volume acquisition rather than basket expansion or price inflation.

Black Friday 2017 spike. November 2017 represented the single highest sales peak in the marketplace's history, reaching 7,289 delivered orders (+62.8% vs. October) and $987.8k in merchandise revenue (+52.4% vs. October). AOV experienced a slight discount-driven compression from $144.76 to $135.51, consistent with promotional price reductions compensated by heavy order volume.

Customer repeat purchase rate & retention gap. Out of 93,358 unique delivered customers, 90,557 (97.00%) are one-time buyers. Only 2,801 customers (3.00%) returned for a second or subsequent purchase, highlighting a severe retention bottleneck.

Repeat buyer lifetime value (LTV). Customers who return generate disproportionate value: repeat buyers have a median total spend of $182.10 (mean: $260.05), representing a +109% increase in median spend compared to one-time buyers ($86.96 median, $137.96 mean).

Repurchase timing & CRM window. Among repeat buyers, the median time elapsed between consecutive orders is 29.0 days (mean: 78.8 days). Half of all returning customers make their next purchase within the first month, defining a tight 

Seller concentration & Pareto Principle (80/20). Out of 2,970 active sellers with delivered orders, just 533 sellers (17.95%) generate 80% of total marketplace revenue (~$10.58M of $13.22M total delivered merchandise). While the platform is not dependent on a tiny handful of merchants, the top ~18% represents an existential concentration risk requiring dedicated account management.

Top 10 seller geographic profile. 9 of the top 10 highest-earning sellers operate from São Paulo (SP), reinforcing the extreme seller-side centralization identified in earlier logistics analyses. The single exception is the #2 seller based in Bahia (BA), who achieved $217.9k in revenue across only 400 items sold (high average ticket of ~$544/item).

Top seller quality & reputational risk. While 7 of the top 10 sellers maintain solid customer ratings (>= 4.0), critical quality outliers exist among top earners. Most notably, the 5th highest-earning seller (seller_id: 7c67e1..., $186.6k revenue across 1,355 items) holds an alarming average review score of 3.35 stars, well below the platform benchmark (~4.1). This indicates that significant revenue is currently being generated by merchants delivering subpar customer experiences, threatening long-term customer retention.

