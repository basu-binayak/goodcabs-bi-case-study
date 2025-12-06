let
    Source = Folder.Files("D:\GITHUB_RESUME\goodcabs-bi-case-study\data"),
    #"D:\GITHUB_RESUME\goodcabs-bi-case-study\data\_dim_city csv" = Source{[#"Folder Path"="D:\GITHUB_RESUME\goodcabs-bi-case-study\data\",Name="dim_city.csv"]}[Content],
    #"Imported CSV" = Csv.Document(#"D:\GITHUB_RESUME\goodcabs-bi-case-study\data\_dim_city csv",[Delimiter=",", Columns=2, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Changed Type" = Table.TransformColumnTypes(#"Imported CSV",{{"Column1", type text}, {"Column2", type text}}),
    #"Promoted Headers" = Table.PromoteHeaders(#"Changed Type", [PromoteAllScalars=true]),
    #"Changed Type1" = Table.TransformColumnTypes(#"Promoted Headers",{{"city_id", type text}, {"city_name", type text}}),
    #"Merged Queries" = Table.NestedJoin(#"Changed Type1", {"city_id"}, city_target_passenger_rating, {"city_id"}, "city_target_passenger_rating", JoinKind.LeftOuter),
    #"Expanded city_target_passenger_rating" = Table.ExpandTableColumn(#"Merged Queries", "city_target_passenger_rating", {"target_avg_passenger_rating"}, {"target_avg_passenger_rating"})
in
    #"Expanded city_target_passenger_rating"