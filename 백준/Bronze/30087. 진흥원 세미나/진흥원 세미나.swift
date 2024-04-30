var ans = Dictionary<String,String>()
ans["Algorithm"] = "204"
ans["DataAnalysis"] = "207"
ans["ArtificialIntelligence"] = "302"
ans["CyberSecurity"] = "B101"
ans["Network"] = "303"
ans["Startup"] = "501"
ans["TestStrategy"] = "105"

let N = Int(readLine()!)!
for _ in 0..<N{
    print(ans[readLine()!]!)
}
