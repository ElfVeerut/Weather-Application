//
//  GenericResult.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import Foundation

enum Result<T> {
	case success(T)
	case failure(Error)
}

enum APIClientError: Error {
	case noData
}

