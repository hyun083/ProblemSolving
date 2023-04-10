import Foundation

var count = 0
func main() -> Int{
    while(true){
        count += 1
        let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
        let L = inputs[0]
        let P = inputs[1]
        let V = inputs[2]
        
        if(L + P + V == 0){
            break
        }
        var result = V/P*L
        if V%P < L{
            result += V%P
        }else{
            result += L
        }
        print("Case \(count): \(result)")
    }
    return 0
}
main()