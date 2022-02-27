//
//  ContentView.swift
//  UsingiTunesAPI
//
//  Created by iiqrah on 27/02/2022.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}


struct ContentView: View {

    @State private var results = [Result]()
    @State private var artistName = ""

    var body: some View {
        NavigationView{

            VStack{

                HStack{
                    TextField("Type artist name ", text: $artistName)

                    Button ("Search"){

                        Task{
                            await loadData(artistName: artistName)
                        }
                    }


                }
                .font(.headline)
                .padding()
                .padding(.leading)
                .padding(.trailing)


                List (results, id: \.trackId) { item in

                    VStack (alignment: .leading){

                        Text(item.trackName)
                            .font(.headline)
                        Text(item.collectionName)
                    }
                }
                .navigationTitle("🎵 Songs Of")
//                .task {
//                    await loadData(artistName: artistName)
//                }
            }


        }
    }

    func loadData(artistName: String) async {

        let formattedArtistName = artistName.replacingOccurrences(of: " ", with: "+").lowercased()

        guard let url = URL(string: "https://itunes.apple.com/search?term=\(formattedArtistName)&entity=song") else {
            print ("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        }
        catch {
            print ("Invalid data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
