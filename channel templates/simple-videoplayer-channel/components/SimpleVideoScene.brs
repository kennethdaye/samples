' ********** Copyright 2016 Roku Corp.  All Rights Reserved. **********

' 1st function that runs for the scene component on channel startup
sub init()
  'To see print statements/debug info, telnet on port 8080
  m.Image       = m.top.findNode("Image")
  m.ButtonGroup = m.top.findNode("ButtonGroup")
  m.Details     = m.top.findNode("Details")
  m.Title       = m.top.findNode("Title")
  m.Video       = m.top.findNode("Video")
  m.Warning     = m.top.findNode("WarningDialog")
  m.Exiter      = m.top.findNode("Exiter")
  setContent()
  m.ButtonGroup.setFocus(true)
  m.ButtonGroup.observeField("buttonSelected","onButtonSelected")
end sub

sub onButtonSelected()
  'Ok'
  if m.ButtonGroup.buttonSelected = 0
    m.Video.visible = "true"
    m.Video.control = "play"
    m.Video.setFocus(true)
  'Exit button pressed'
  else
    m.Exiter.control = "RUN"
  end if
end sub

'Set your information here
sub setContent()

  'Change the image
  'm.Image.uri="pkg:/images/DanGilbert.jpg"
  'ContentNode = CreateObject("roSGNode", "ContentNode")
  'ContentNode.streamFormat = "mp4"
  'ContentNode.url = "http://home.mycloud.com/action/share/d7c449d1-1999-4aa6-8e71-0af4b7f3d42 mp4"
  'ContentNode.ShortDescriptionLine1 = "Created for him?"
  'ContentNode.Description = "music by tha gift."
  'ContentNode.StarRating = 80
  'ContentNode.Length = 1280
  'ContentNode.Title = "Created For Him?"

  m.Image.uri="pkg:/images/CraigVenter-2008.jpg"
  ContentNode = CreateObject("roSGNode", "ContentNode")
  ContentNode.streamFormat = "mp4"
  ContentNode.url = "http://home.mycloud.com/action/share/d7c449d1-1999-4aa6-8e71-0af4b7f3d42a mp4"
  ContentNode.ShortDescriptionLine1 = "Can we create new life out of our digital universe?"
  ContentNode.Description = "Music By Tha Gift"
  ContentNode.Length = 239
  ContentNode.Title = "Created for him"
  ContentNode.subtitleConfig = {Trackname: "pkg:/source/kennethdaye.srt" }

  'm.Image.uri="pkg:/images/BigBuckBunny.jpg"
  'ContentNode = CreateObject("roSGNode", "ContentNode")
  'ContentNode.streamFormat = "mp4"
  'ContentNode.url = "http://video.ted.com/talks/podcast/CraigVenter_2008_480.mp4"
  'ContentNode.ShortDescriptionLine1 = "Created For Him"
  'ContentNode.Description = "all content belong to Tha Gift."
  'ContentNode.StarRating = 80
  'ContentNode.Length = 600
  'ContentNode.Title = "Created for him"

  m.Video.content = ContentNode

  'Change the buttons
  Buttons = ["Play","Exit"]
  m.ButtonGroup.buttons = Buttons

  'Change the details
  'm.Title.text = "Created for him?"
  'm.Details.text = "music for the good of the people."

  m.Title.text = "kenneth writter producer "
  m.Details.text =  "made in river hill studio"

end sub

' Called when a key on the remote is pressed
function onKeyEvent(key as String, press as Boolean) as Boolean
  print "in SimpleVideoScene.xml onKeyEvent ";key;" "; press
  if press then
    if key = "back"
      print "------ [back pressed] ------"
      if m.Warning.visible
        m.Warning.visible = false
        m.ButtonGroup.setFocus(true)
        return true
      else if m.Video.visible
        m.Video.control = "stop"
        m.Video.visible = false
        m.ButtonGroup.setFocus(true)
        return true
      else
        return false
      end if
    else if key = "OK"
      print "------- [ok pressed] -------"
      if m.Warning.visible
        m.Warning.visible = false
        m.ButtonGroup.setFocus(true)
        return true
      end if
    else
      return false
    end if
  end if
  return false
end function
