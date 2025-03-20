-- LEFT JOIN
SELECT * 
FROM  medical_consultation T1
LEFT OUTER JOIN patient T2 ON T1.patient_id = T2.id


-- RIGHT JOIN
SELECT * 
FROM patient  T1
RIGHT JOIN medical_consultation T2 ON T1.id = T2.patient_id


SELECT * FROM medical_consultation T1
RIGHT JOIN patient T2 ON T1.patient_id = T2.id


-- INNER JOIN
SELECT * 
FROM medical_consultation T1
INNER JOIN patient T2 ON T1.patient_id = T2.id


-- FULL OUTER JOIN
SELECT * 
FROM medical_consultation T1
FULL OUTER JOIN patient T2 ON T1.patient_id = T2.id


-- LEFT JOIN WITH EXCLUSIONS
SELECT * 
FROM medical_consultation T1
LEFT JOIN patient T2 ON T1.patient_id = T2.id
WHERE T2.id IS NULL


-- RIGHT JOIN WITH EXCLUSIONS
SELECT * 
FROM medical_consultation T1
RIGHT JOIN patient T2 ON T1.patient_id = T2.id
WHERE T1.patient_id IS NULL


-- FULL JOIN WITH EXCLUSIONS
SELECT * 
FROM medical_consultation T1
FULL JOIN patient T2 ON T1.patient_id = T2.id
WHERE T1.patient_id IS NULL OR  T2.id IS NULL


--  MULTIPLOS JOINS
SELECT mdc.*,pat.name as 'patientName',doc.name as 'doctorName',cli.costume_name as 'clinicName', spe.name as 'specialtyName'
FROM medical_consultation mdc
INNER JOIN patient pat ON mdc.patient_id = pat.id
INNER JOIN doctor doc ON mdc.doctor_id = doc.id
INNER JOIN clinic cli ON doc.clinic_id =  cli.id
INNER JOIN specialty spe ON doc.speciality_id = spe.id

-- CROSS JOIN
SELECT * 
FROM medical_consultation T1 
CROSS JOIN check_uncheck T2


-- NOT IN
SELECT * 
FROM  medical_consultation T1
WHERE T1.patient_id in(SELECT t2.id FROM patient t2 )


SELECT * 
FROM  patient T1 
WHERE T1.id in(SELECT t2.patient_id FROM medical_consultation t2)


SELECT * 
FROM  medical_consultation T1
WHERE 1=1 AND T1.patient_id NOT in(
    SELECT t2.id 
    FROM patient t2
    )

SELECT * 
FROM  patient 
WHERE id  NOT in(
    SELECT t2.patient_id 
    FROM medical_consultation t2
    WHERE patient_id is not null
    )


SELECT * 
FROM  patient 
WHERE id NOT in(2,3,4,7);