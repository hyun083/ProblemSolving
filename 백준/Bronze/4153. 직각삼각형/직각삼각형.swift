import Foundation
func main() -> Int{
    while(true){
        let inputs = readLine()!.split(separator: " ").map{Int(String($0))! * Int(String($0))!}
        let max = inputs.max()!
        let min = inputs.min()!
        let mid = inputs.filter({$0 != max && $0 != min})
        if (inputs[0] == 0){
            return 0
        }else if(mid.first == max - min){
            print("right")
        }else{
            print("wrong")
        }
    }
}

main()