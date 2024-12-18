# OMDB_API_UPDATED

Shape Software Developer Apprenticeship Task - UPDATED

This is my updated version of an OMDB API App in Flutter.

## Introduction

I really enjoyed the task, but those 6 hours flew by, so I have decided to try and update the version I uploaded. 

So far, I absolutely love the inline parameter descriptions it gives; it makes finding your way around so much easier.

Also, the automatic refactoring has saved me a lot of time already. When moving screens between folders it automatically changed paths inside of files - very handy.

## UPDATED Features

- NEED TO UPDATE IMAGES 


### Additional "Movie Details" screen- 

- Users can now get a better look at poster and movie details.
- Plot can now be seen, by making a GET request to the OMDB API using the movie’s IMDb ID.

![Movie Details](./assets/moviedetails.png)


### Error Handling - 

- Added movie quotes rather than the basic error handling instructions - "try again" etc

![Error Search](./assets/errorsearchscreen.png)

### Improved UI & Logo

- New colour palette, bolder App Bar titles, and more visually appealing buttons.
- New app name "SHAPE Movies".
- New logo matching the colour theme and fitting the brand name.
- Decided against the image carousel on the homepage
- I used an App Icon creator website to resize all of my images, but have since found that there is a better way to do it. (https://pub.dev/packages/flutter_launcher_icons)

![Home Screen](./assets/home.png)

### Themes & Screens Folders

- Themes now consistent and all handled from one theme.dart file, within a themes folder
- screens folder now contains all screens (can I just say again how great the automatic refactoring is)

## Testing

- I had been testing exclusively on the IPhone 16 Pro Max
- Upon testing a larger screen (IPad), realised the home page image was too small - added a media query to set it to 80% of screen size
- tested on a smaller screen (Iphone SE), Movie Details page overflowed after adding "Plot" section so I changed it from column to ListView.
- Tested it on my own phone then had issues running it afterwards on simulator - hadn't changed settings back from Profile to Debug, but it was worth the struggle to see it working on my IPhone without it even being plugged in!

## TO DO

- Search Filtering 

## Final Notes

While still rough, I am happy with the progress I've made. Depending on sources I have been reading, there seems to be different ideas of what constitutes "best practice" so I may have missed the mark in a few areas. Most notably with theme data - it did seem strange to be applying graphical changes inside the widget trees, but I have changed that to a new folder system and separate theme.dart file.

Also my comments are still a bit all over the place, but have been invaluable to me in terms of keeping track of where I am and what I still need to research - when I first left most of them I was very aware of having limited time so I just rushed to type them.

After having more time to work within Flutter, I've realised I may have referred interchangeably between Flutter and Dart in my 6 hour task - the more I've read up on it and worked on it I now know Flutter is the framework, within which Dart is the programming language.




