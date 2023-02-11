import Foundation
import CoreLocation

var apiKey = "c3188a738fc6eaabe4af51c60c113c89"

class WeatherManager{
    func getCurrentWeather(latitude: CLLocationDegrees, longtitude: CLLocationDegrees) async throws {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longtitude)&appid=\(apiKey)") else { fatalError("Missing URL") }
       
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data") }
    }
}
