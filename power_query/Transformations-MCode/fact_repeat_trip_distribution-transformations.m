let
    Source = Folder.Files("D:\GITHUB_RESUME\goodcabs-bi-case-study\data"),
    #"D:\GITHUB_RESUME\goodcabs-bi-case-study\data\_dim_repeat_trip_distribution csv" = Source{[#"Folder Path"="D:\GITHUB_RESUME\goodcabs-bi-case-study\data\",Name="dim_repeat_trip_distribution.csv"]}[Content],
    #"Imported CSV" = Csv.Document(#"D:\GITHUB_RESUME\goodcabs-bi-case-study\data\_dim_repeat_trip_distribution csv",[Delimiter=",", Columns=4, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"month", type date}, {"city_id", type text}, {"trip_count", type text}, {"repeat_passenger_count", Int64.Type}}),
    #"Trimmed Text" = Table.TransformColumns(#"Changed Type",{{"city_id", Text.Trim, type text}, {"trip_count", Text.Trim, type text}}),
    #"Uppercased Text" = Table.TransformColumns(#"Trimmed Text",{{"trip_count", Text.Upper, type text}}),
    #"Merged Queries" = Table.NestedJoin(#"Uppercased Text", {"month"}, dim_month, {"month"}, "dim_month", JoinKind.LeftOuter),
    #"Expanded dim_month" = Table.ExpandTableColumn(#"Merged Queries", "dim_month", {"month_SK"}, {"month_SK"}),
    #"Reordered Columns" = Table.ReorderColumns(#"Expanded dim_month",{"month", "month_SK", "city_id", "trip_count", "repeat_passenger_count"}),
    #"Renamed Columns" = Table.RenameColumns(#"Reordered Columns",{{"month_SK", "month_FK"}, {"city_id", "city_id_FK"}}),
    #"Removed Columns" = Table.RemoveColumns(#"Renamed Columns",{"month"})
in
    #"Removed Columns"