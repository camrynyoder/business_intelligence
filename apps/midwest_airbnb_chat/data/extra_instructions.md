# Extra Instructions

Rules the LLM follows when it writes SQL for `listings`.

- `price` is the nightly price in U.S. dollars. When the user asks what something costs, use `price` and round money to whole dollars in the answer.
- `host_is_superhost` is stored as the text values 't' and 'f'. When filtering for superhosts, compare against 't' or 'f' for non-superhosts, avoiding `TRUE`/`FALSE`.
-  When averaging `review_scores_rating`, exclude rows where it is `NULL` instead of treating them as 0 because `NULL` means the listing has no reviews yet, not a rating of 0, so including it would drag averages down.


<!-- Add more rules below (Assignment 05 asks for at least three). Good candidates:
     `host_is_superhost` and `instant_bookable` are the text values 't' and 'f',
     not booleans; how to match a city name the user types; how to search `name`
     case-insensitively; and whether to ignore rows whose `review_scores_rating`
     is NULL when averaging ratings. -->
