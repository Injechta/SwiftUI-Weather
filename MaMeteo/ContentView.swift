//
//  ContentView.swift
//  MaMeteo
//
//  Created by Gregory El Bajoury on 19/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Perpignan, OC")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 12)
                
                HStack(spacing: 20) {
                    WeatherDayVIew(dayOfWeek: "MAR",
                                   imageName: "cloud.sun.fill",
                                   temperature: 13)
                    
                    WeatherDayVIew(dayOfWeek: "MER",
                                   imageName: "sun.max.fill",
                                   temperature: 18)
                    
                    WeatherDayVIew(dayOfWeek: "JEU",
                                   imageName: "cloud.drizzle.fill",
                                   temperature: 15)
                    
                    WeatherDayVIew(dayOfWeek: "VEN",
                                   imageName: "smoke.fill",
                                   temperature: 12)
                    
                    WeatherDayVIew(dayOfWeek: "SAM",
                                   imageName: "cloud.sun.rain.fill",
                                   temperature: 9)
                    
                    WeatherDayVIew(dayOfWeek: "DIM",
                                   imageName: "cloud.sun.fill",
                                   temperature: 15)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayVIew: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomLeading)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
