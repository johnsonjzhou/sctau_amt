USE `sctau`;

SELECT
  rel.sourceid sourceid,
  rel.destinationid destinationid,
  term.conceptid conceptid,
  term.typeid typeid,
  term.active active,
  artgid.schemeValue artgid,
  term.term description
FROM
  sctau.relationships_snapshot rel
  INNER JOIN sctau.descriptions_snapshot term
    ON rel.sourceid = term.conceptid
  INNER JOIN sctau.irefset_snapshot artgid
    ON artgid.referencedComponentId = term.conceptid
WHERE
  -- lower(term.term) LIKE "Keflex%"
  -- lower(term.term) LIKE "Lipitor%"
  lower(term.term) LIKE "irbesartan%"
  AND term.active = 1
  AND artgid.active = 1
  AND artgid.refsetid = 11000168105 -- ARTG Id reference set
  AND term.typeid = 900000000000003001 -- Fully specified name
  -- AND term.typeid = 900000000000013009 -- Synonym
  -- AND rel.typeid = 700000101000036108 --  has TP
  -- AND rel.typeid = 30409011000036107 -- has TPUU
  AND rel.destinationid = 30537011000036101 -- CTPP concept
  -- AND rel.destinationid = 30404011000036106 -- TPP concept
LIMIT 50
;