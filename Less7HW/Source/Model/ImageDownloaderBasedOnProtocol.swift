//
//  ImageDownloader.swift
//  Less7HW
//

//

import Foundation

class ImageDownloaderBasedOnProtocol {
    
    func downloadImageData(for urlString: String) {
        /*
         Нижче строка коду
            DispatchQueue.global(qos: .default).async {...}
         означає, що код в скобках {...}
         буде виконано асинхронно і паралельно
         */
        DispatchQueue.global(qos: .default).async {
            
            // Резервуємо змінні для запису помилки і результату
            var downloadError: Error?
            var imageData: Data?
            
            // конструкція do catch ще не розглядалася, але
            // наразі нам важлиао лише розуміти, що якщо немає помилок,
            // то запишеться imageData,
            // а якщо буде помилка, то ми запишемо помилку
            do {
                let url = URL(string: urlString)
                // якщо все добре - матимемо значення у imageData
                imageData = try Data(contentsOf: url!)
            } catch let error {
                debugPrint(error)
                // якщо щось було не так - матимемо значення у downloadError
                downloadError = error
            }
            
            /*
             Нижче строка коду
                DispatchQueue.main.async {...}
             означає, що код в скобках {...}
             буде виконано синхронно у послідовній черзі у головному потоці
             */
            DispatchQueue.main.async {
                // тут потрібно передати результат imageData у ImagePreviewViewController
            }
        }
    }
}
