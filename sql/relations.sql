USE `sctau`;

CREATE VIEW desc_full AS
SELECT
  *
FROM sctau.descriptions_snapshot
WHERE
  active = 1
  AND typeid = 900000000000003001 -- Fully specified name
;

SELECT
  rel.id rel_id,
  rel.sourceid sourceid,
  rel.typeid typeid,
  type_term.term type_desc,
  rel.destinationid destinationid,
  rel_term.term dest_desc,
  uou.value uou,
  uou_term.term uou_desc
FROM
  sctau.relationships_snapshot rel
  LEFT JOIN desc_full rel_term
    ON rel.destinationid = rel_term.conceptid
  LEFT JOIN desc_full type_term
    ON rel.typeid = type_term.conceptid
  LEFT JOIN sctau.ccsrefset_snapshot uou
    ON rel.id = uou.referencedcomponentid
  LEFT JOIN desc_full uou_term
    ON uou.refsetid = uou_term.conceptid
WHERE
  rel.sourceid = 1437941000168107 -- Irbesartan (GH) 75 mg tablet, 14 (ctpp)
  -- rel.sourceid = 1437931000168103 -- Irbesartan (GH) (irbesartan 75 mg) tablet, 14 tablets (trade product pack)
  -- rel.sourceid = 662801000168109 -- Irbesartan (GH) (irbesartan 75 mg) tablet (trade product unit of use)
  -- rel.id = 12655311000168126
  AND rel.moduleid = 900062011000036108 -- AMT module
  AND rel.active = 1
LIMIT 50
;