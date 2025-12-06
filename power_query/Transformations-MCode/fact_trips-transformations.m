let
    Source = Folder.Files("D:\GITHUB_RESUME\goodcabs-bi-case-study\data"),
    #"D:\GITHUB_RESUME\goodcabs-bi-case-study\data\_fact_trips csv" = Source{[#"Folder Path"="D:\GITHUB_RESUME\goodcabs-bi-case-study\data\",Name="fact_trips.csv"]}[Content],
    #"Imported CSV" = Csv.Document(#"D:\GITHUB_RESUME\goodcabs-bi-case-study\data\_fact_trips csv",[Delimiter=",", Columns=8, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"trip_id", type text}, {"date", type date}, {"city_id", type text}, {"passenger_type", type text}, {"distance_travelled(km)", Int64.Type}, {"fare_amount", Int64.Type}, {"passenger_rating", Int64.Type}, {"driver_rating", Int64.Type}}),
    #"Trimmed Text" = Table.TransformColumns(#"Changed Type",{{"city_id", Text.Trim, type text}, {"passenger_type", Text.Trim, type text}}),
    #"Uppercased Text" = Table.TransformColumns(#"Trimmed Text",{{"passenger_type", Text.Upper, type text}}),
    #"Merged Queries" = Table.NestedJoin(#"Uppercased Text", {"date"}, dim_date, {"date"}, "dim_date", JoinKind.LeftOuter),
    #"Expanded dim_date" = Table.ExpandTableColumn(#"Merged Queries", "dim_date", {"date_SK"}, {"date_SK"}),
    #"Reordered Columns" = Table.ReorderColumns(#"Expanded dim_date",{"trip_id", "date_SK", "date", "city_id", "passenger_type", "distance_travelled(km)", "fare_amount", "passenger_rating", "driver_rating"}),
    #"Renamed Columns" = Table.RenameColumns(#"Reordered Columns",{{"date_SK", "date_FK"}, {"city_id", "city_id_FK"}}),
    #"Removed Columns" = Table.RemoveColumns(#"Renamed Columns",{"date"})
in
    #"Removed Columns"


