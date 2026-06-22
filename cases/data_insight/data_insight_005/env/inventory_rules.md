# September inventory KPI rules

Scope: active SKUs only, September 2026 only, posted actual movements only.

Valid movement types:

- `sale`
- `receipt`
- `adjustment`

Inventory formulas:

- Ending on hand = starting_on_hand + receipts - sales + adjustments
- Average inventory = (starting_on_hand + ending_on_hand) / 2
- Inventory turnover = sales / average inventory
- Sell-through = sales / (starting_on_hand + receipts)
- Days of cover = ending_on_hand / (sales / 30)

Stockout-risk items are active SKUs with ending_on_hand below reorder_point.
Rank stockout risk by the lowest days of cover. Round turnover to two decimals,
sell-through to one decimal, and days of cover to one decimal.
