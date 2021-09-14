SELECT
  $__timeGroupAlias("timestamp",$__interval),
  count(*)
FROM metrics
WHERE
  $__timeFilter("timestamp")
GROUP BY 1
ORDER BY 1