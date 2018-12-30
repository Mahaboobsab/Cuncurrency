//
//  ViewController.swift
//  CuncurrencyDemo
//
//  Created by Mehboob on 11/15/18.
//  Copyright © 2018 360Nautica. All rights reserved.
//

import UIKit

let imageURLs = ["http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg", "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg", "https://s1.ax1x.com/2017/12/06/oaiz8.png", "https://s1.ax1x.com/2017/12/06/oakQS.jpg"]

class Downloader {
    
    class func downloadImageWithURL(url:String) -> UIImage! {
        
        let data = NSData(contentsOf: NSURL(string: url)! as URL)
        return UIImage(data: data! as Data)
    }
}



class ViewController: UIViewController {

    @IBOutlet weak var sliderValue: UILabel!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView1: UIImageView!
    
    var queue = OperationQueue()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    
    @IBAction func didClickStart(_ sender: Any) {
        
        
        //Normal
        
        
//        let imag1 = Downloader.downloadImageWithURL(url: imageURLs[0])
//
//        self.imageView1.image  = imag1
//
//        let imag2 = Downloader.downloadImageWithURL(url: imageURLs[1])
//
//        self.imageView2.image  = imag2
//
//        let imag3 = Downloader.downloadImageWithURL(url: imageURLs[2])
//
//        self.imageView3.image  = imag3
//
//        let imag4 = Downloader.downloadImageWithURL(url: imageURLs[3])
//
//        self.imageView1.image  = imag4
        
        
        
      //  let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        
        
        
        
        
      //  GCD
        
//        let queue = DispatchQueue.global(qos: .default)
//
//        queue.async() { () -> Void in
//
//            let img1 = Downloader.downloadImageWithURL(url: imageURLs[0])
//            DispatchQueue.main.async {
//                self.imageView1.image = img1
//            }
//
//        }
//
//
//
//        queue.async() { () -> Void in
//
//            let img2 = Downloader.downloadImageWithURL(url: imageURLs[1])
//            DispatchQueue.main.async {
//                self.imageView2.image = img2
//            }
//
//        }
//
//        queue.async() { () -> Void in
//
//            let img3 = Downloader.downloadImageWithURL(url: imageURLs[2])
//            DispatchQueue.main.async {
//                self.imageView3.image = img3
//            }
//
//        }
//
//        queue.async() { () -> Void in
//
//            let img4 = Downloader.downloadImageWithURL(url: imageURLs[3])
//            DispatchQueue.main.async {
//                self.imageView4.image = img4
//            }
//
//        }
        
        

//        let serialQueue = DispatchQueue(label: "queuename", attributes: .concurrent)
//
//
//
//        serialQueue.async() { () -> Void in
//
//            let img1 = Downloader .downloadImageWithURL(url: imageURLs[0])
//            DispatchQueue.main.async{
//
//                self.imageView1.image = img1
//            }
//
//        }
//
//        serialQueue.async() { () -> Void in
//
//            let img1 = Downloader .downloadImageWithURL(url: imageURLs[1])
//            DispatchQueue.main.async{
//
//                self.imageView2.image = img1
//            }
//
//        }
//
//        serialQueue.async() { () -> Void in
//
//            let img1 = Downloader .downloadImageWithURL(url: imageURLs[2])
//            DispatchQueue.main.async{
//
//                self.imageView3.image = img1
//            }
//
//        }
//
//        serialQueue.async() { () -> Void in
//
//            let img1 = Downloader .downloadImageWithURL(url: imageURLs[3])
//            DispatchQueue.main.async{
//
//                self.imageView4.image = img1
//            }
//
//        }

        
        
        
       
        
        
        
        //NSOPERTAION
        
        
//        queue = OperationQueue()
//
//
//        queue.addOperation { () -> Void in
//
//            let img1 = Downloader.downloadImageWithURL(url: imageURLs[0])
//
//            OperationQueue.main.addOperation({
//                self.imageView1.image = img1
//            })
//        }
//
//        queue.addOperation { () -> Void in
//
//            let img1 = Downloader.downloadImageWithURL(url: imageURLs[1])
//
//            OperationQueue.main.addOperation({
//                self.imageView2.image = img1
//            })
//        }
//
//        queue.addOperation { () -> Void in
//
//            let img1 = Downloader.downloadImageWithURL(url: imageURLs[2])
//
//            OperationQueue.main.addOperation({
//                self.imageView3.image = img1
//            })
//        }
//
//        queue.addOperation { () -> Void in
//
//            let img1 = Downloader.downloadImageWithURL(url: imageURLs[3])
//
//            OperationQueue.main.addOperation({
//                self.imageView4.image = img1
//            })
//        }



        
        
        
        
       // NSOPERATION QUEUE WITH OTHER FUNC
        
        
        
        
        
        queue = OperationQueue()

        let operation1 = BlockOperation(block: {
            let img1 = Downloader.downloadImageWithURL(url: imageURLs[0])
            OperationQueue.main.addOperation {
                self.imageView1.image = img1
            }
        })


        operation1.completionBlock = {
             print("Operation 1 completed")

           //  print("Operation 1 completed, cancelled:\(operation1.isCancelled)")

        }

        queue.addOperation(operation1)


        let operation2 = BlockOperation(block: {
            let img2 = Downloader.downloadImageWithURL(url: imageURLs[1])
            OperationQueue.main.addOperation {
                self.imageView2.image = img2
            }
        })



       // operation2.addDependency(operation1)

        operation2.completionBlock = {
             print("Operation 2 completed")

           // print("Operation 2 completed, cancelled:\(operation2.isCancelled)")
        }
        queue.addOperation(operation2)




        let operation3 = BlockOperation(block: {
            let img3 = Downloader.downloadImageWithURL(url: imageURLs[2])
            OperationQueue.main.addOperation({
                self.imageView3.image = img3
            })
        })
        operation3.addDependency(operation2)
        operation3.addDependency(operation1)

        operation3.completionBlock = {
             print("Operation 3 completed")
            //print("Operation 3 completed, cancelled:\(operation3.isCancelled)")
        }
        queue.addOperation(operation3)
        
        
        let operation4 = BlockOperation(block: {
            let img4 = Downloader.downloadImageWithURL(url: imageURLs[3])
            OperationQueue.main.addOperation{
                self.imageView4.image = img4
            }
        })

        operation4.completionBlock = {

             print("Operation 4 completed")
          //  print("Operation 4 completed, cancelled:\(operation4.isCancelled)")
        }
        queue.addOperation(operation4)
        
        
        
        
        
    }
    
    @IBAction func sliderDidChange(_ sender: UISlider) {
        
        self.sliderValue.text = "\(sender.value * 100.0)"
        
        
    }
    @IBAction func cancelOpertaion(_ sender: Any) {
        
        self.queue.cancelAllOperations()
        
        
    }
}

