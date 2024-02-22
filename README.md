# SQL Table - valued custom function: DelimitedSplit

This SQL table - valued function assists in transforming repeated or delimited columns into rows based on the number of values or commas in each cell

# Steps:
- Create the function DelimitedSplit (delimited_split.sql)
- Apply the function only to delimited columns, i.e., those columns separated by values with commas

# Screenshot:
![2024-02-22 10_17_36-Window](https://github.com/milosp-89/delimiter_split_script/assets/155644532/a6dbe46b-0b52-4440-bb5a-6b96c4380999)

# Summary:
- Row number 3 with submission_id "6662383" has three values delimited by commas from the "type" to "type_received" columns
- After applying the DelimitedSplit function, row number 3 has been transformed into three additional rows because three values were present, separated by commas
- The function will leave untouched non-delimited columns (normal columns without commas), and those columns will be duplicated until delimited columns, where each value will be transformed into each row
- It is possible to have empty values like: val1,,val2,val3, and the function will transform one row into four additional rows, however, within a second row (",,"), there will be located an empty value which can be replaced afterward with a NULL value if needed
