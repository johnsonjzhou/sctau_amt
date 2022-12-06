USE `sctau`;

SELECT
  *
FROM
  sctau.descriptions_snapshot terms
WHERE
  -- terms.conceptid = 700000111000036105 -- Strength reference set
  terms.conceptid = 700000131000036101 -- Unit of use reference set quantity
LIMIT 50
;