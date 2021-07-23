//
//  Home.swift
//  Meeting App UI
//
//  Created by Michele Manniello on 22/07/21.
//

import SwiftUI

@available(iOS 15.0, *)
struct Home: View {
    @Namespace var animationID
    @State var currentTab = "Upcoming"
    @StateObject var homeModel = HomeViewModel()
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15){
                Text("Hi Michele!")
                    .font(.title3)
                //                Letter Spacing...
                    .kerning(1.1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack(alignment: .bottom){
                    Text("Check your\n**Meeting Details**")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Button {
                        withAnimation {
                            homeModel.addNewMeeting.toggle()
                        }
                    } label: {
                        Text("ADD")
                            .font(.caption)
                            .foregroundColor(.black)
                            .padding(.vertical,10)
                            .padding(.horizontal,20)
                            .background(
                                Capsule()
                                    .stroke(.black,lineWidth: 1)
                            )
                    }
                    
                }
                .padding(.top,8)
                //                Custom Segment tab View...
                HStack(spacing: 0){
                    //                    simply creatng array of tabs and iterating over it....
                    ForEach(["Upcoming","On Hold","Post","Cancelled"],id: \.self) { tab in
                        TabButton(currentTab: $currentTab, title: tab, animationID: animationID)
                    }
                    
                }
                .padding(.top,25)
                if homeModel.metings.isEmpty{
                    Image("notes")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .padding(.top,30)
                    Text("Add**Meetings**")
                        .font(.title2)
                        .padding(.top)
                }
                VStack(spacing: 15){
                    //                    In Ios 15 we can directly pass bindings...
                    ForEach($homeModel.metings){ $meeting in
                        //                        Meeting Card View...
                        MeetingCardView(meeting: $meeting)
                    }
                }
                .padding(.top,20)
                
            }
            .padding()
        }
        .background(Color("Bg"))
        .overlay(
            ZStack{
                if homeModel.addNewMeeting{
                    AddMeeting().environmentObject(homeModel)
                }
            }
        )
        
        
    }
}

@available(iOS 15.0, *)
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
struct TabButton: View {
    @Binding var currentTab : String
    var title: String
//    For bottom indicator slide Animation..
    var animationID : Namespace.ID
    var body: some View{
        Button {
            withAnimation(.spring()){
                currentTab = title
            }
        } label: {
            VStack{
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(currentTab == title ? .black : .gray)
                if currentTab == title{
                    Rectangle()
                        .fill(.black)
                        .matchedGeometryEffect(id: "TAB", in: animationID)
                        .frame(width: 50, height: 1)
                }else{
                    Rectangle()
                        .fill(.clear)
                        .frame(width: 50, height: 1)
                }
            }
//            Taking Available Width...
            .frame(maxWidth: .infinity)
        }

    }
}
