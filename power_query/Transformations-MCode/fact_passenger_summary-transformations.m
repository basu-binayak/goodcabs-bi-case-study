let
    Source = Folder.Files("D:\GITHUB_RESUME\goodcabs-bi-case-study\data"),
    #"D:\GITHUB_RESUME\goodcabs-bi-case-study\data\_fact_passenger_summary csv" = Source{[#"Folder Path"="D:\GITHUB_RESUME\goodcabs-bi-case-study\data\",Name="fact_passenger_summary.csv"]}[Content],
    #"Imported CSV" = Csv.Document(#"D:\GITHUB_RESUME\goodcabs-bi-case-study\data\_fact_passenger_summary csv",[Delimiter=",", Columns=5, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"month", type date}, {"city_id", type text}, {"new_passengers", Int64.Type}, {"repeat_passengers", Int64.Type}, {"total_passengers", Int64.Type}}),
    #"Trimmed Text" = Table.TransformColumns(#"Changed Type",{{"city_id", Text.Trim, type text}}),
    #"Merged Queries" = Table.NestedJoin(#"Trimmed Text", {"month"}, dim_month, {"month"}, "dim_month", JoinKind.LeftOuter),
    #"Expanded dim_month" = Table.ExpandTableColumn(#"Merged Queries", "dim_month", {"month_SK"}, {"month_SK"}),
    #"Reordered Columns" = Table.ReorderColumns(#"Expanded dim_month",{"month", "month_SK", "city_id", "new_passengers", "repeat_passengers", "total_passengers"}),
    #"Renamed Columns" = Table.RenameColumns(#"Reordered Columns",{{"month_SK", "month_FK"}, {"city_id", "city_id_FK"}}),
    #"Removed Columns" = Table.RemoveColumns(#"Renamed Columns",{"month"})
in
    #"Removed Columns"