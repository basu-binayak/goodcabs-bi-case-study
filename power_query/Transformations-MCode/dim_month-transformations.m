let
    Source = Folder.Files("D:\GITHUB_RESUME\goodcabs-bi-case-study\data"),
    #"D:\GITHUB_RESUME\goodcabs-bi-case-study\data\_dim_date csv" = Source{[#"Folder Path"="D:\GITHUB_RESUME\goodcabs-bi-case-study\data\",Name="dim_date.csv"]}[Content],
    #"Imported CSV" = Csv.Document(#"D:\GITHUB_RESUME\goodcabs-bi-case-study\data\_dim_date csv",[Delimiter=",", Columns=4, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"date", type date}, {"start_of_month", type date}, {"month_name", type text}, {"day_type", type text}}),
    #"Removed Other Columns" = Table.SelectColumns(#"Changed Type",{"start_of_month"}),
    #"Removed Duplicates" = Table.Distinct(#"Removed Other Columns"),
    #"Renamed Columns" = Table.RenameColumns(#"Removed Duplicates",{{"start_of_month", "month"}}),
    #"Inserted Month" = Table.AddColumn(#"Renamed Columns", "Month.1", each Date.Month([month]), Int64.Type),
    #"Renamed Columns1" = Table.RenameColumns(#"Inserted Month",{{"Month.1", "month_no"}}),
    #"Inserted Month Name" = Table.AddColumn(#"Renamed Columns1", "Month Name", each Date.MonthName([month]), type text),
    #"Renamed Columns2" = Table.RenameColumns(#"Inserted Month Name",{{"Month Name", "month_name"}}),
    #"Added Custom" = Table.AddColumn(#"Renamed Columns2", "month_name_short", each Date.ToText([month], "MMM")),
    #"Added Custom1" = Table.AddColumn(#"Added Custom", "month_SK", each Date.ToText([month],"yyyy") & Date.ToText([month], "MM")),
    #"Reordered Columns" = Table.ReorderColumns(#"Added Custom1",{"month_SK", "month", "month_no", "month_name", "month_name_short"}),
    #"Changed Type1" = Table.TransformColumnTypes(#"Reordered Columns",{{"month_SK", type text}, {"month_name_short", type text}}),
    #"Inserted Quarter" = Table.AddColumn(#"Changed Type1", "Quarter", each Date.QuarterOfYear([month]), Int64.Type),
    #"Renamed Columns3" = Table.RenameColumns(#"Inserted Quarter",{{"Quarter", "quarter"}}),
    #"Inserted Start of Quarter" = Table.AddColumn(#"Renamed Columns3", "Start of Quarter", each Date.StartOfQuarter([month]), type date),
    #"Renamed Columns4" = Table.RenameColumns(#"Inserted Start of Quarter",{{"Start of Quarter", "start_of_quarter"}})
in
    #"Renamed Columns4"