# Midwest Airbnb Listings: Data Dictionary

**Dataset:** `listings` table in `midwest_airbnb.db` (SQLite), 14,887 rows and 29 columns
**Source:** Inside Airbnb (https://insideairbnb.com/get-the-data/), the detailed `listings.csv.gz` file for each of three regions: Chicago (snapshot 2026-07-20), Columbus (snapshot 2026-07-23), and Twin Cities MSA (snapshot 2026-07-21). Column meanings follow Inside Airbnb's data dictionary and assumptions (https://insideairbnb.com/data-assumptions/).
**Course:** ISA 401, Miami University

> One row is one listing that showed a nightly price on the snapshot date; listings with no price were dropped. Empty cells are stored as SQL `NULL`.

---

## Field Definitions

| Field | Type | Description |
|---|---|---|
| `city` | text | Which Inside Airbnb region the listing came from: `Chicago` (7,439 rows), `Columbus` (2,587), or `Twin Cities` (4,861). The Twin Cities file covers the Minneapolis-St. Paul metro area, not just the two cities. |
| `snapshot_date` | text | Date Inside Airbnb compiled the file, stored as an ISO text string, not a date: `2026-07-20` for Chicago, `2026-07-23` for Columbus, `2026-07-21` for Twin Cities. Every row of a city shares the same value. |
| `id` | text | Airbnb's listing id. Unique across the table (14,887 distinct values). Stored as text even though it looks numeric, so compare it to a quoted string. |
| `name` | text | Listing title as shown on Airbnb (for example "Tiny Studio Apartment 94 Walk Score"). Never empty. |
| `price` | real | Nightly price in U.S. dollars on the snapshot date, with the dollar sign and commas removed. Ranges from 2.56 to 11,412; never `NULL` (rows without a price were dropped). |
| `room_type` | text | Airbnb's four listing categories: `Entire home/apt` (11,652 rows), `Private room` (2,951), `Hotel room` (246), or `Shared room` (38). |
| `host_id` | integer | Airbnb's unique identifier for the host/user |
| `host_name` | text | Name of the host. Usually just the first name(s). |
| `host_since` | date | The date the host/user was created. For hosts that are Airbnb guests this could be the date they registered as a guest. |
| `host_is_superhost` | boolean | Whether the host has superhost status. Encoded `t`/`f` (true/false). |
| `neighbourhood` | text | Standardized neighborhood name. This is Inside Airbnb's `neighbourhood_cleansed` field — computed by matching the listing's latitude/longitude against official neighborhood boundaries, not the host's own text entry. |
| `latitude` | numeric | Listing's latitude (WGS84), roughly 41.6–42.1 for Chicago, 39.9–40.1 for Columbus, and 44.7–45.2 for the Twin Cities metro. |
| `longitude` | numeric | Listing's longitude (WGS84), roughly -87.9 to -87.5 for Chicago, -83.2 to -82.8 for Columbus, and -93.6 to -92.9 for the Twin Cities metro. |
| `property_type` | text | Host-selected property type, more specific than `room_type` (like "Entire condo," "Entire home," "Private room in home," "Entire rental unit"). |
| `accommodates` | integer | Maximum number of guests the listing sleeps, as set by the host. Ranges from 1 to 16; cannot be `NULL`. |
| `bedrooms` | integer | Number of bedrooms. Ranges from 1 to 16 where reported; `NULL` for 2,976 rows (listing didn't specify, studios might leave this blank). |
| `beds` | integer | Number of beds, which can exceed `bedrooms` when a room sleeps more than one, like bunk beds, or sofa beds. Ranges from 1 to 32 and is `NULL` for 668 rows. |
| `bathrooms_text` | text | Bathroom count and type as a free text label, like "1 bath," "2 shared baths," "1.5 baths." The most common value is "1 bath" at 6,564 rows. |
| `minimum_nights` | integer | Minimum stay length required by the host, in nights. Ranges from 1 to 365. |
| `availability_365` | integer | Number of the next 365 days the listing shows as bookable on the calendar. Ranges from 0, 0 being fully booked/blocked to 365, 365 being wide open. |
| `number_of_reviews` | integer | Total number of reviews the listing has ever received. Ranges from 0 to 2,246. |
| `number_of_reviews_ltm` | integer | Number of reviews received in the last 12 months ("ltm" = last twelve months). Ranges from 0 to 1,220. |
| `first_review` | date | Date of the listing's oldest review. Ranges from 2009-07-03 to 2026-07-20 and is `NULL` for 1,761 rows, no reviews yet. |
| `last_review` | date | Date of the listing's most recent review. Ranges from 2014-08-23 to 2026-07-22 and is `NULL` for the same 1,761 rows with no reviews. |
| `review_scores_rating` | numeric | Overall guest rating on a 1–5 scale and is `NULL` for 1,761 rows with no reviews yet. |
| `reviews_per_month` | numeric | Average number of reviews per month, averaged over the listing's whole time on Airbnb. Ranges from 0.01 to 77.72. |
| `instant_bookable` | boolean | Whether a guest can book without host approval, encoded `t`/`f`. In this dataset, every row is `NULL` — so maybe this was a recently added variable. |
| `estimated_revenue_l365d` | currency | Estimated revenue over the last 365 days, in USD. Ranges from 0 to 1,114,800 and is never `NULL`. |
| `amenities_count` | integer | Count of items in the listing's amenities list. Ranges from 0 to 100. |
