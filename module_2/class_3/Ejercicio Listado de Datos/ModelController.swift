//
//  ModelController.swift
//  Ejercicio Listado de Datos
//
//  Created by Macbook Pro on 3/2/17.
//  Copyright © 2017 Area 51. All rights reserved.
//

import UIKit

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */


class ModelController: NSObject, UIPageViewControllerDataSource {

    //var pageData: [String] = []
    var items = Array<Item>()

    override init() {
        super.init()
        // Create the data model.
        for i in 0...7 {
            let item = Item()
            
            item.nombre = "Item \(i)"
            item.precio = 10.00 * Float(i)
            item.imagen = UIImage(named: "image_\(i)")
            
            items.append(item)
        }
    }

    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> DataViewController? {
        // Return the data view controller for the given index.
        if (self.items.count == 0) || (index >= self.items.count) {
            return nil
        }

        // Create a new view controller and pass suitable data.
        let dataViewController = storyboard.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
        dataViewController.dataObject = self.items[index]
        return dataViewController
    }

    func indexOfViewController(_ viewController: DataViewController) -> Int {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        return items.index(of: viewController.dataObject) ?? NSNotFound
    }

    // MARK: - Page View Controller Data Source

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.items.count {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

}

