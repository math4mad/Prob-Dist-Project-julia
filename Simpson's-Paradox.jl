#= 
[What is Simpson’s Paradox?](https://discovery.cs.illinois.edu/learn/Basics-of-Data-Science-with-Python/Simpsons-Paradox/)
=#

using CSV,DataFrames,HTTP,FreqTables,PrettyTables

url="https://waf.cs.illinois.edu/discovery/berkeley.csv"
http_response = HTTP.get(url)
df = CSV.read(http_response.body,DataFrame)

@pt df

#= 
┌───────┬────────┬────────┬───────────┐
│  Year │  Major │ Gender │ Admission │
│ Int64 │ String │ String │    String │
├───────┼────────┼────────┼───────────┤
│  1973 │      C │      F │  Rejected │
│  1973 │      B │      M │  Accepted │
│  1973 │  Other │      F │  Accepted │
│  1973 │  Other │      M │  Accepted │
│  1973 │  Other │      M │  Rejected │
│  1973 │  Other │      M │  Rejected │
│  1973 │      F │      F │  Accepted │
│  1973 │  Other │      M │  Accepted │
│  1973 │  Other │      M │  Rejected │
│  1973 │      A │      M │  Accepted │
│   ⋮   │   ⋮    │   ⋮    │     ⋮     │
└───────┴────────┴────────┴───────────┘
=#


#ft=freqtable(df,:Major,:Gender)

gdf=groupby(df,[:Major,:Gender,:Admission])

keys(gdf)

