-- Downtown cafe service-ready lunch portfolio policy
-- Service date: 2026-04-15
-- Decision time: 2026-04-15 10:30 local time
-- Customer offer window: 11:00-14:00 local time
-- Metrics cutoff: 2026-04-12
-- Eligible shortlist size: 16
-- Final display size: 5 items

-- CURRENT-RECORD RULES
-- Inventory: latest DOWNTOWN snapshot for the service date recorded at or before decision time.
-- Forecast: latest DOWNTOWN forecast for the service date issued at or before decision time.
-- Allergens: latest APPROVED assessment on or before the service date; newer pending records do not replace it.
-- Performance: latest DOWNTOWN metric period ending on or before the metrics cutoff.
-- Nutrition: latest APPROVED review at or before decision time; equal reviewed_at uses highest revision.
-- Promotion: latest DOWNTOWN counter-channel record for the service date at or before decision time. Equal reviewed_at uses highest revision. Latest applicable controls even when pending or withdrawn and must itself be approved.
-- Dietary certification: latest record at or before decision time. Equal reviewed_at uses highest revision. Latest applicable controls even when pending or withdrawn and must itself be approved with nut_free_certified = 1.
-- Catering holds: latest DOWNTOWN record for the service date at or before decision time. Equal reviewed_at uses highest revision. Latest applicable controls and must itself be approved.
-- Preorder reservations: latest DOWNTOWN counter-channel record for the service date at or before decision time. Equal reviewed_at uses highest revision. Latest applicable controls and must itself be approved.
-- Supplier clearance: latest record at or before decision time. Equal reviewed_at uses highest revision. Latest applicable controls and must itself be approved, confirmed, and have at least 6 service hours remaining.
-- Ingredient lot: latest DOWNTOWN record for the service date at or before decision time. Equal reviewed_at uses highest revision. Latest applicable controls and must itself be approved, released, and nut-free.
-- Service reserve: latest DOWNTOWN counter-channel record for the service date at or before decision time. Equal reviewed_at uses highest revision. Latest applicable controls and must itself be approved.
-- Station service level: latest DOWNTOWN record for the service date at or before decision time. Equal reviewed_at uses highest revision. Latest applicable controls and must itself be approved and operational.
-- Post-decision, wrong-location, wrong-channel, superseded, and lower-revision records do not control.

-- SERVICE QUANTITIES
-- pre_lot_net = portions_available - held_portions - reserved_portions - reserve_portions
-- open_now = MIN(pre_lot_net, usable_servings from the controlling ingredient lot)
-- projected_noon = MAX(0, open_now - CEIL(0.45 * forecast_lunch_orders))
-- service outlook: At-risk when projected_noon <= 12; Balanced when 13 through 19; Strong when >= 20.
-- effective_prep_minutes = CEIL(estimated_prep_minutes / station capacity_factor)
-- effective_batch_capacity_15min = FLOOR(batch_capacity_15min * station capacity_factor)

-- ITEM ELIGIBILITY
-- menu: lunch, spring_2026, active, weekday_lunch
-- inventory status available
-- all controlling catering, preorder, service-reserve, supplier, lot, dietary, promotion, and station records satisfy their approval rules
-- open_now >= 18 and projected_noon >= 8
-- effective_prep_minutes <= 10
-- effective_batch_capacity_15min >= peak_orders_15min
-- station_load <= 0.85
-- peanut_present = 0; tree_nut_present = 0; nut_derived_ingredient = 0
-- cross_contact_risk IN ('none','low')
-- orders_last_28d >= 40; customer_rating >= 4.2; return_rate <= 0.025; waste_rate <= 0.10; gross_margin_pct >= 0.28
-- calories BETWEEN 250 AND 650 inclusive; protein_g >= 12; sodium_mg <= 900
-- regular_price_usd = menu price
-- Special price >= 6.00 and below Regular price
-- discount rate between 9% and 20% inclusive

-- ELIGIBILITY RANK
-- 1. gross_margin_pct DESC
-- 2. customer_rating DESC
-- 3. waste_rate ASC
-- 4. effective_prep_minutes ASC
-- 5. discount rate DESC
-- 6. Special price ASC
-- 7. item_name ASC

-- BUILD THE FIVE-ITEM PORTFOLIO
-- Consider only the first 16 eligible items. Evaluate complete five-item combinations; do not use a greedy walk.
-- A feasible portfolio must satisfy every rule:
-- * five distinct menu_format values
-- * at least four distinct station_code values
-- * at least 4 Vegan items
-- * at least 4 Gluten-free items
-- * at least one Special price <= $7.00
-- * at least one item with protein_g >= 20
-- * combined Special price <= $42.00
-- * total open_now >= 150
-- * total projected_noon >= 100
-- * average customer_rating >= 4.60
-- * total protein_g >= 84
-- * total sodium_mg <= 3,500
-- * no more than one item with sodium_mg >= 800
-- * for each station used, the sum of selected peak_orders_15min must not exceed that station's controlling portfolio_capacity_15min
-- Sort each feasible portfolio's eligibility ranks ascending.
-- Select the feasible portfolio with the lexicographically smallest rank vector.
-- Display selected items in eligibility-rank order.

-- DISPLAY CALCULATIONS
-- savings_usd = Regular - Special
-- discount_pct = 100 * savings / Regular, rounded to one decimal
-- protein_value_per_10g = 10 * Special / protein_g, rounded to two decimals
-- Use effective_prep_minutes, open_now, projected_noon, and the service-outlook label, not their raw source values.

-- QUICK PICKS
-- Use selected items only and name every tied winner:
-- fastest effective prep; highest protein; biggest dollar savings; largest percentage discount; lowest Special;
-- lowest sodium; top rating; most open_now; most projected_noon; best protein value.

-- FIND YOUR FIT
-- List the complete selected-item sets for:
-- Special under $9.00; protein at least 18g; sodium under 700mg; Gluten-free; Vegan;
-- effective prep 9 minutes or less; projected_noon at least 20.

-- PORTFOLIO SNAPSHOT
-- combined Regular, combined Special, combined savings, blended discount
-- average and median Special
-- average effective prep
-- average and total protein
-- total calories and total sodium
-- average rating
-- total open_now and total projected_noon
-- maximum sodium
-- distinct menu formats and distinct stations

-- PAIR IDEAS
-- Budget Duo = selected pair with lowest combined Special. Tie-break by higher combined protein, then alphabetically.
-- Protein Duo = selected pair with highest combined protein. Tie-break by lower combined Special, then alphabetically.
-- Noon-Safe Duo = selected pair with highest combined projected_noon. Tie-break by lower combined Special, then alphabetically.
-- For each pair show both names, combined Special, combined savings, combined protein, combined calories, and combined projected_noon.

-- MIX COUNTS
-- Dietary counts overlap across controlling certification flags.
-- Outlook counts use At-risk, Balanced, and Strong.

-- CUSTOMER COPY
-- Heading: Nut-Free Quick Lunch Specials
-- Context: Downtown - April 15 - 11:00 AM-2:00 PM
-- Offer: Offer valid 11:00 AM-2:00 PM or while supplies last.
