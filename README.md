# Custom SQL function; DelimitedSplit

SQL function will help to transform repeated/delimited columns into the rows based on a number of values/commas in each cell

# Steps:
- Create the function DelimitedSplit
- Apply the function only on delimited columns (those columns separated between values with commas)

# Screenshot:
![2024-02-22 10_17_36-Window](https://github.com/milosp-89/delimiter_split_script/assets/155644532/a6dbe46b-0b52-4440-bb5a-6b96c4380999)

# Summary:
- Row number 3 with submission_id "6662383" has three values delimited by comma from "type" to "type_received" columns
- After applying DelimitedSplit function row number 3 has been tranformed within 3 additional rows, because 3 values were present 
  separated by comma
- Function will leave untouched non delimited columns (normal columns without commas) and those columns will be duplicated until
  delimited columns, where each 
  value will be transformed to each row
- It is possible to have empty values like: val1,,val2,val3 and the function will transform one rows into the 4 additional rows
  but within 2 row (",,") there will be located empty value which can be replaced afterwards with NULL value if needed

  --
