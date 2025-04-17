import Foundation

var nodes = Set<String>()
var edges = Set<String>()
while let input = readLine(){
    if input == "GRAPH BEGIN"{
        nodes = Set<String>()
        edges = Set<String>()
    }else if input == "GRAPH END"{
        print("NODES \(nodes.count) EDGES \(edges.count)")
    }else{
        let arr = input.split(separator: " ").map{String($0)}
        for node in arr{
            nodes.insert(node)
        }
        
        for i in 1..<arr.count{
            if edges.contains(arr[0]+" "+arr[i]) || edges.contains(arr[i]+" "+arr[0]){
                continue
            }else{
                edges.insert(arr[0]+" "+arr[i])
            }
        }
    }
}