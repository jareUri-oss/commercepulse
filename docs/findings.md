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