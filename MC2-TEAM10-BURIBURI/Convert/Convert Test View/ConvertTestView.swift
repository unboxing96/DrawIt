//
//  ContentView.swift
//  SwiftUI Demo 2
//
//  Created by Wonil Lee on 2023/05/05.
//

import SwiftUI
import UIKit

struct ConvertTestView: View {
	
	@State var buttonPressed: Bool = false
	
	@State var brPNGData = Data()
	
	@State var pointArray = [CGPoint]()
	
	//시뮬레이터를 실행할 맥에서의 이미지 파일 위치에 맞게 URL을 수정하세요
	
	let originalURL = URL(fileURLWithPath: "/Users/wonil/Desktop/SwiftProjects/ADA2 Projects/MC2/MC2 Removing Background/SwiftUI Demo 2/Assets.xcassets/IMG_1423.imageset/IMG_1423.HEIC")
	
	var body: some View {
		ScrollView {
			VStack {
				HStack {
					Text("originalHEICURL: ")
					HEICImageURLView(heicURL: originalURL)
				}
				
				Button {
					if !buttonPressed {

						let returnedTuple = convertToBackgroundRemovedPNGDataAndPointArray(at: originalURL)
						
						brPNGData = returnedTuple.0
						pointArray = returnedTuple.1
					}
					
					buttonPressed.toggle()
					
				} label: {
					if !buttonPressed {
						Text("Do!")
							.foregroundColor(.blue)
					} else {
						Text("reset")
					}
				}
				
				if buttonPressed {
					
					VStack {
						HStack {
							Text("brPNGData: ")
							PNGImageDataView(pngData: brPNGData)
						}
						
						HStack {
							Text("pointArray: ")
							
							VStack {
								ForEach(0..<pointArray.count) { i in
									Text("x: \(pointArray[i].x), y: \(pointArray[i].y)")
								}
							}
						}
					}
				}
			}
		}
		
		
		
	}
}

struct ConvertTestView_Previews: PreviewProvider {
	static var previews: some View {
		ConvertTestView()
	}
}