---
sdk: docker
app_port: 7860
title: Midwest Airbnb Explorer
emoji: 🏙️
colorFrom: orange
colorTo: gray
pinned: false
license: mit
short_description: Ask questions about Midwest Airbnb listings
---

# Midwest Airbnb Explorer

**Live app:** https://midwest-airbnb-chat-4nab.onrender.com

## Example Questions

**Q: How many Chicago listings are there?**
![7,439 listings in Chicago](screenshots/q1.png)

**Q: Which Columbus neighbourhood has the priciest entire homes?**
![Westland has the priciest entire homes in Columbus](screenshots/q2.png)

**Q: How many listings could host a party of ten?**
![1,745 listings can host 10 or more guests](screenshots/q3.png)

**Ask a question in plain English, get the SQL and a table back**

A [querychat](https://github.com/posit-dev/querychat) app built in ISA 401 (Miami University) on 14,887 Airbnb listings across Chicago, Columbus, and the Twin Cities, sourced from Inside Airbnb. Adapted from the Class 06 Job Scout Chat demo for Assignment 05, then deployed to Render and improved with a complete data dictionary, custom query rules, a custom theme, and an About section.

---

## About this app

The listings come from [Inside Airbnb](https://insideairbnb.com/get-the-data/), covering three cities:
- Chicago — snapshot 2026-07-20
- Columbus — snapshot 2026-07-23
- Twin Cities — snapshot 2026-07-21

Built by Camryn Yoder for ISA 401 at Miami University.

---

## What is this app?

The app connects to a SQLite database (`data/midwest_airbnb.db`), hands the `listings` table to querychat, and lets an LLM translate your question into SQL. Every answer shows the query it ran, so you can check the logic and reuse the SQL yourself.

---

## Dataset Information

**Dataset:** `listings` table in `data/midwest_airbnb.db` (14,887 rows, 29 columns)
**Source:** Inside Airbnb, detailed listings files for Chicago (2026-07-20), Columbus (2026-07-23), and the Twin Cities (2026-07-21)
**Data dictionary:** `data/data_desc.md` (all 29 columns documented)
**Query rules for the LLM:** `data/extra_instructions.md`

### Key Fields

| Field | Description |
|-------|-------------|
| `city` | Which of the three cities the listing is in |
| `price` | Nightly price in U.S. dollars |
| `room_type` | Entire home/apt, Private room, Hotel room, or Shared room |
| `neighbourhood` | Standardized neighborhood name |
| `accommodates` | Maximum number of guests |
| `review_scores_rating` | Overall guest rating (1–5) |

---

## Required Secret

The app calls OpenAI (`gpt-5.6-luna`, reasoning off) through [ellmer](https://ellmer.tidyverse.org/), so it needs one environment variable:

```bash
export OPENAI_API_KEY="your-api-key-here"
```

On Render, this is set under the service's **Environment** tab as `OPENAI_API_KEY`. Never commit the key; `.Renviron` is listed in `.gitignore` for that reason.

---

## Running Locally

**With R:**
```r
# from inside apps/midwest_airbnb_chat/
shiny::runApp(".", port = 7860)
```

**With Docker:**
```bash
docker build -t midwest_airbnb_chat .
docker run --rm -p 7860:7860 -e OPENAI_API_KEY=$OPENAI_API_KEY midwest_airbnb_chat
```

Then open http://localhost:7860.

---

## Technology Stack

- **[Shiny](https://shiny.posit.co/)** and **[bslib](https://rstudio.github.io/bslib/)** — web app framework and theming for R
- **[querychat](https://github.com/posit-dev/querychat)** — natural language data querying
- **[ellmer](https://ellmer.tidyverse.org/)** — LLM client for R
- **[RSQLite](https://rsqlite.r-dbi.org/)** — SQLite driver for R

---

## Course Information

This application was developed for **ISA 401** at **Miami University**, adapted from the Class 06 Job Scout Chat demo.
