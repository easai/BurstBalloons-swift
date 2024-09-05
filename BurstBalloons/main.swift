//
//  main.swift
//  BurstBalloons
//
//  Created by E A on 9/4/24.
//

import Foundation
import Algorithms

class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
            guard !points.isEmpty else { return 0 }
            
            let sortedPoints = points.sorted { $0[1] < $1[1] }
            
            var arrows = 1
            var end = sortedPoints[0][1]
            
            for point in sortedPoints {
                if point[0] > end {
                    arrows += 1
                    end = point[1]
                }
            }
            
            return arrows
        }
    func isIn(_ needle:Int, _ haystack:[Int])->Bool{
        return haystack[0] <= needle && needle <= haystack[1]
    }
    
    func _findMinArrowShots(_ points: [[Int]]) -> Int {
        var dict=[[Int]]()
        for i in 0..<points.count{
            var x=points[i]
            var lst=[Int]()
            for j in 0..<points.count{
                if i == j {
                    lst.append(j)
                    continue
                }
                var y=points[j]
                if isIn(x[0],y){
                    lst.append(j)
                }
            }
            dict.append(lst)
        }
                
        let allCombinations = dict.combinations(ofCount: 1...points.count)

        for combo in allCombinations {
            let mergedSet = Set(combo.flatMap { $0 })
            print(mergedSet)
            if mergedSet.count==points.count{
                return combo.count
            }
        }
        
        return -1
    }
    
    func test(){
        var points = [[10,16],[2,8],[1,6],[7,12]]
        print(findMinArrowShots(points))
        points = [[1,2],[3,4],[5,6],[7,8]]
        print(findMinArrowShots(points))
        points = [[1,2],[2,3],[3,4],[4,5]]
        print(findMinArrowShots(points))
    }
}

Solution().test()
