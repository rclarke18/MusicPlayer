//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Clarke, Ross on 10/13/17.
//  Copyright © 2017 Clarke, Ross. All rights reserved.
//

import UIKit
import AVFoundation
var soundPlayer : AVAudioPlayer?
var art: UIImage?
var myArray = ["Good Ass Intro", "Pusha Man", "Cocoa Butter Kisses", "Juice", "Lost", "Everybodys Something", "Interlude (Thats Love)", "Favorite Song", "Nana", "Smoke Again", "Acid Rain", "Chain Smoker", "Everythings Good"]
var currentSong = 0

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return myArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = myArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentSong = indexPath.row
        let URL = Bundle.main.url(forResource: myArray[indexPath.row], withExtension: "mp3")
        
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: URL!)
            guard let soundPlayer = soundPlayer else {
                return
            }
            soundPlayer.prepareToPlay()
            soundPlayer.play()
        }
        catch let error as NSError {
            print(error.description)
        }
        
        art = #imageLiteral(resourceName: "AcidRap.jpg")
        AlbumArt.image = art

    }
    
    @IBAction func Volume(_ sender: UISlider) {
        soundPlayer?.setVolume(sender.value, fadeDuration: 0.02)
    }
    
    @IBAction func Play(_ sender: Any) {
        soundPlayer?.play()
    }
    
    @IBAction func Pause(_ sender: Any) {
        soundPlayer?.pause()
    }
    
    @IBAction func SkipForward(_ sender: Any) {
        //currentSong = indexPath.row
        if currentSong == myArray.count - 1 {
            currentSong = 0
        }
        else {
        currentSong = currentSong + 1
        }
        
        let URL = Bundle.main.url(forResource: myArray[currentSong], withExtension: "mp3")
        
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: URL!)
            guard let soundPlayer = soundPlayer else {
                return
            }
            soundPlayer.prepareToPlay()
            soundPlayer.play()
        }
        catch let error as NSError {
            print(error.description)
        }
        
        art = #imageLiteral(resourceName: "AcidRap.jpg")
        AlbumArt.image = art
    }
    
    @IBAction func GoBack(_ sender: Any) {
        if currentSong == 0 {
            currentSong = myArray.count - 1
        }
        else {
        currentSong = currentSong - 1
        }
        let URL = Bundle.main.url(forResource: myArray[currentSong], withExtension: "mp3")
        
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: URL!)
            guard let soundPlayer = soundPlayer else {
                return
            }
            soundPlayer.prepareToPlay()
            soundPlayer.play()
        }
        catch let error as NSError {
            print(error.description)
        }
        
        art = #imageLiteral(resourceName: "AcidRap.jpg")
        AlbumArt.image = art
    }
    
    @IBOutlet weak var AlbumArt: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

