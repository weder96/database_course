WITH wt_stores AS (
SELECT
st.Region,
count(*) AS lojas
FROM Stores st
GROUP BY st.Region
)
SELECT *
FROM wt_stores wts
