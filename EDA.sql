--Convert qualitative data to quantitative

Update [EDA].[dbo].[studentInfo]
Set age_band = Case when age_band = '0-35' Then '0'
when age_band = '35-55' Then '1'
Else '2'
End

Update [EDA].[dbo].[studentInfo]
Set disability = Case when disability = 'N' Then '0'
Else '1'
End

Update [EDA].[dbo].[studentInfo]
Set highest_education = Case when highest_education = 'HE Qualification' Then '4'
when highest_education = 'A Level or Equivalent'  Then '2'
when highest_education = 'Post Graduate Qualification' Then '3'
when highest_education = 'Lower Than A Level' Then '1'
Else '0'
End

Update [EDA].[dbo].[studentInfo]
Set final_result = Case when final_result = 'Pass' Then '2'
when final_result = 'Fail' Then '1'
Else '0'
End

--Create final table

Create view Final_table as
Select si.id_student, si.code_module,si.code_presentation, si.age_band, si.disability, si.highest_education, c.module_presentation_length, si.final_result
From [EDA].[dbo].[studentInfo] si
Join [EDA].[dbo].[courses] c
On si.code_module = c.code_module
And si.code_presentation = c.code_presentation

Select *
From Final_table