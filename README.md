# Custom SQL function; DelimitedSplit

SQL function will help to transform repeated/delimited columns into the rows based on a number of values/commas in each cell

Steps:
- Create the function
- Apply the function only on delimited columns

# Screenshot:
![2024-02-22 10_17_36-Window](https://github.com/milosp-89/delimiter_split_script/assets/155644532/a6dbe46b-0b52-4440-bb5a-6b96c4380999)

# Summary:
- Row number 3 with submission_id "6662383" has three values delimited by comma from "type" to "type_received" columns
- After applying DelimitedSplit function row number 4 has been tranformed within 3 add rows, because 3 values were present 
  separated by comma
- Function will leave untouched non delimited columns, those columns will be duplicated until delimited columns where each 
  value will be transformed to each row
