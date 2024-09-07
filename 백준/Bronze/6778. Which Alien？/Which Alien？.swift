let antenna = Int(readLine()!)!
let eye = Int(readLine()!)!
var ans = [String]()
if antenna>=3 && eye<=4{
    ans.append("TroyMartian")
}
if antenna<=6 && eye>=2{
    ans.append("VladSaturnian")
}
if antenna<=2 && eye<=3{
    ans.append("GraemeMercurian")
}
print(ans.joined(separator:"\n"))