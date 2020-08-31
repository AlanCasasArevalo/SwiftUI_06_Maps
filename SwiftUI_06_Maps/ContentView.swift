//
//  ContentView.swift
//  SwiftUI_06_Maps
//
//  Created by Everis on 31/08/2020.
//  Copyright © 2020 Alan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            GeneralMapView().tabItem {
                Image(systemName: "map.fill")
            }
            UserMapView().tabItem {
                Image(systemName: "mappin.circle.fill")
            }
            StoryMapView().tabItem {
                Image(systemName: "location.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
