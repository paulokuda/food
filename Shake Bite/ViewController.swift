//
//  ViewController.swift
//  Shake Bite
//
//  Created by Paul Okuda on 11/11/14.
//  Copyright (c) 2014 Paul Okuda. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    @IBOutlet weak var menuText: UILabel!
    @IBOutlet weak var menuBar: UIImageView!
    @IBOutlet var foodImage: UIImageView!
    var foodList = [UIImage]()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    
    @IBOutlet weak var shakeAgain: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.foodImage.layer.cornerRadius = self.foodImage.bounds.size.height / 2.0
        self.foodImage.layer.masksToBounds = true
        self.menuBar.image = UIImage(named: "menuBackground.png")
        self.shakeAgain.image = UIImage(named: "shakeAgain.png")
//        self.foodImage.image = UIImage(named: "shakeAgain.png")
        self.nameLabel.text = "Bagel Factory"
        self.addressLabel.text = "420 S Craig St"
        self.phoneLabel.text = "(412) 681-1101"
        self.hoursLabel.text = "7:00 am – 10:00 pm"
        self.shakeAgain.alpha = 1.0
        
        
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true;
    }
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        self.foodImage.image = selectFood();
        if (self.foodImage.image == UIImage(named: "oe.png")){
            self.shakeAgain.alpha = 1.0
            nameLabel.text = "Oriental Express"
            addressLabel.text = "4609 Forbes Ave"
            phoneLabel.text = "(412) 622-7232"
            hoursLabel.text = "11:00 am – 10:00 pm"
            UIView.animateWithDuration(3.0, animations: {() -> Void in
                self.shakeAgain.alpha = 0.0
            })
        }
        if (self.foodImage.image == UIImage(named: "chipotle.png")){
            self.shakeAgain.alpha = 1.0
            nameLabel.text = "Chipotle"
            addressLabel.text = "3619 Forbes Ave"
            phoneLabel.text = "(412) 621-1557"
            hoursLabel.text = "11:00 am – 10:00 pm"
            UIView.animateWithDuration(3.0, animations: {() -> Void in
                self.shakeAgain.alpha = 0.0
            })
        }
        if (self.foodImage.image == UIImage(named: "starbucks.png")){
            self.shakeAgain.alpha = 1.0
            nameLabel.text = "Starbucks"
            addressLabel.text = "417 South Craig Street"
            phoneLabel.text = "(412) 687-2494"
            hoursLabel.text = "5:30 am – 9:00 pm"
            UIView.animateWithDuration(3.0, animations: {() -> Void in
                self.shakeAgain.alpha = 0.0
            })
        }
        if (self.foodImage.image == UIImage(named: "everyday.png")){
            self.shakeAgain.alpha = 1.0
            nameLabel.text = "Everyday Noodles"
            addressLabel.text = "5875 Forbes Ave"
            phoneLabel.text = "(412) 421-6668"
            hoursLabel.text = "11:30 am – 10:00 pm"
            UIView.animateWithDuration(3.0, animations: {() -> Void in
                self.shakeAgain.alpha = 0.0
            })
        }
        if (self.foodImage.image == UIImage(named: "bagel.png")){
            self.shakeAgain.alpha = 1.0
            nameLabel.text = "Bagel Factory"
            addressLabel.text = "420 S Craig St"
            phoneLabel.text = "(412) 681-1101"
            hoursLabel.text = "7:00 am – 10:00 pm"
            UIView.animateWithDuration(3.0, animations: {() -> Void in
                self.shakeAgain.alpha = 0.0
            })
        }
        
    }
    
    func selectFood()-> UIImage {
        switch(arc4random()%6){
            case 1:
                return UIImage(named: "oe.png")!
            case 2:
                return UIImage(named: "chipotle.png")!
            case 3:
                return UIImage(named: "starbucks.png")!
            case 4:
                return UIImage(named: "everyday.png")!
            default:
                return UIImage(named: "bagel.png")!
        }
        
    }
    
    
    
    func makeCall()->UIColor {
        var url : String = "http://google.com?test=toto&test2=titi";
        var request : NSMutableURLRequest = NSMutableURLRequest();
        request.URL = NSURL(string: url);
        request.HTTPMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
            let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as? NSDictionary
            
            if (jsonResult != nil) {
                // process jsonResult
                println("it worked")
            } else {
                // couldn't load JSON, look at error
                println("didn't work");
            }
            
            
        })
        return UIColor.greenColor()

    }
}

