# Rick-and-Morty-Modified-
The characteristics of this UIKit-exclusive app:

* UIKit
* MVC
* Diffable Data source
*  Dark Mode
* Networking is done using URLSession only. (No Alamofire)
* Used NSCache to avoid fetching same images many times
* Localization supported (Korean)
* No 3rd-party framework used
* Get all episode information on request.
* Fetch all appeared characters for each episode.
* Parses JSON data using Decodable protocol

What makes this app worthy?

While this app does not offer many features, this app is worthy for its architecture and general reusuability that comes with it. It will be easier to remove/add features in the future because of its architecture.
EpisodeDetailViewController is made up of three different UIViewControllers, to avoid MVC (Massive View Controller).

Three different UIView objects were created. All three UIViewController were then initialized and built once URLSession completes fetching data. Once UIViewController objects are constructed, they are injected into each of three UIView objects. All three UIView objects are then added to the 'EpisodeDetailViewController' using function called injectTheVC(). Because of this approach, EpisodeDetailViewController is only consisted of 113 lines of code and it is easy to add/remove features.

All Swift files segregated and organized based on their purpose. For example, Data structures (e.g. Episodes, Character, StackSettings) are housed under Model folder. Extension files are housed together in same Extension folder.
Easy to understand Networking Manager object which handles all errors. (It shows all error messages when you get 4xx, 5xx status codes)
Use of NSCache to minimize the number of requests.
Utilized WillDisplay delegate function of UICollectionView to only request data when scrolled down to the bottom. Once maximum episode has been fetched, it is prevented from making more network requests.
