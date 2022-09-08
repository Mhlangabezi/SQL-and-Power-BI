--THIS IS A BREAST CANCER DATA FROM KAGGLE WEBSITE

--MHLANGABEZI MDWAYI--


--LOOKING AT THE DATA

SELECT * FROM [SQL project]..BreastCancer

--CHECKING DUPLICATES IN THE DATABASE

SELECT * FROM [SQL project]..BreastCancer 
GROUP BY Age, Race, Marital_Status, T_Stage, N_Stage, _6th_Stage, differentiate, Grade, A_Stage, Tumor_Size, Estrogen_Status, Progesterone_Status, Regional_Node_Examined, Reginol_Node_Positive, Survival_Months, Status
HAVING COUNT(*)>1

--Checking all the women that are white and alive versus women that are black and alive
--This will later be used in Power bi for visualization

--White Women First:
SELECT Age, Race, Marital_Status FROM [SQL project]..BreastCancer
WHERE Race = 'White' AND Status = 'Alive'
Order by 1,3

-- Black Women Second:
SELECT Age, Race, Marital_Status FROM [SQL project]..BreastCancer
WHERE Race = 'BLACK' AND Status = 'Alive'
Order by 1,3


--USING CASE STATEMENT TO GROUP AGE IN RANGE AS YOUNG, MIDDLE AGE AND OLD
--THIS WILL HELP WITH DATA VISUALIZATION

SELECT Age,Race, Marital_Status,Survival_Months, Status,
CASE
	WHEN Age <30 THEN 'Young'
	WHEN Age >=30 THEN 'Middle Age'
	WHEN Age >=55 THEN 'Old'
	ELSE 'INVALID'
END AS New_Age
FROM [SQL project]..BreastCancer

--CHECKING THE AVERAGE AGE OF Divroced, Widowed, Single and Separated women 
SELECT Avg(Age) FROM [SQL project]..BreastCancer
WHERE Marital_Status='Divorced'

SELECT Avg(Age) FROM [SQL project]..BreastCancer
WHERE Marital_Status='Widowed'

SELECT Avg(Age) FROM [SQL project]..BreastCancer
WHERE Marital_Status='Single'

SELECT Avg(Age) FROM [SQL project]..BreastCancer
WHERE Marital_Status='Separated'

-- CHECKING WHITE AND BLACK WOMEN THAT ARE OLDER THAN 55 AND ARE ALIVE

SELECT Age, Race, Marital_Status, status FROM [SQL project]..BreastCancer
WHERE Status = 'Alive' AND Age>55
order by 1,2





