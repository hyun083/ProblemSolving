import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var dic:Dictionary<String,Int> = ["R":0, "T":0, "C":0, "F":0, "J":0, "M":0, "A":0, "N":0]
    let score = [3,2,1,0,1,2,3]
    
    for i in 0..<survey.count{
        let s = survey[i].map{String($0)}
        let choice = choices[i]-1

        if choice > 3{
            dic[s[1]]! += score[choice]
        }else{
            dic[s[0]]! += score[choice]
        }
    }
    var ans = ""
    
    ans += dic["T"]! > dic["R"]! ? "T":"R"
    ans += dic["F"]! > dic["C"]! ? "F":"C"
    ans += dic["M"]! > dic["J"]! ? "M":"J"
    ans += dic["N"]! > dic["A"]! ? "N":"A"
    print(dic)
    return ans
}