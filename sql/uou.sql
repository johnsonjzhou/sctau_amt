USE `sctau`

SELECT
  *
FROM
  sctau.ccsrefset_snapshot uou
WHERE
  -- uou.refsetid = 700000131000036101 -- Unit of use reference set (quantity)
  -- uou.refsetid = 700000141000036106 -- Unit of use reference set (size)
  -- Note, referencedcomponentid joins with relationship.id on TPUU
  uou.referencedcomponentid = 13843901000168126 -- Irbesartan (GH) (irbesartan 75 mg) tablet (trade product unit of use)
LIMIT 50
;