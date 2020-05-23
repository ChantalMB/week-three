# Week 3: Notes

- I keep forgetting about Hypothesis

### REGEX
- Started reading the notes --> I'm pretty sure I've used regular expressions before without knowing it
- Using Atom, ```(.+\<to\>)``` is not a valid inquiry for me
  - Instead I just place the original modified query, ```(.+\bto\b)``` in brackets, and achieved the same results
  - Additionally, had to use ```~$1``` rather than ```~\1```
- ```(\b to \b)``` was only resulting in 2 results when I searched the document
  - Used ```( \bto\b)``` instead
- When searching for lines with more than 2 commas, I discovered many that were missed by previous seaches because of incorrect spacing or odd characters
  - If they were interpretable, I modified these lines according to the designated format


### Open Refine
- Importing csv revealed that the regex searches from previous exercise did not work as well as I hoped
  - Some correspondences got divided into two lines
  - Some page numbers remained --> were interpreted as dates
- Clustering
  - Often difficult to decide how things should be modified/what is the same
  - No idea how to interpret the names with numbers or random characters
- Seems like the process of clustering/merging still left many typos
  - To review the results from using OpenRefine I'm manually going through the exported file
    - "'" left in front of common name
    - Page numbers attached to recipient's names
    - Some dates remain attached to recipient's names


### Networks
- Using the provided csv file because of aformentioned issues
- Databasic throws 500 error upon file upload attempt
- Downloaded Gephi with ```brew cask install gephi```
  - Very dated visually
  - Cluttered making it harder for me to navigate
  - Followed video for walkthrough because I found the overview so cluttered I thought I initially did something wrong
  - Final visualization I still found too busy and difficult to reading
- Palladio
  - While this lacks as much functionality as something like Gephi it is much more user friendly
    - Simple to use
    - Clean interface
    - More intuitively interactive data representation
  - ISSUE: just as unreadable if you try to save data as image
    - Only very useful for observing data if you import your own data into the program to manipulate
    - Actual download is a JSON file --> quick script that could auto-visualize this file upon opening?
- Network Analysis in Python
  - Activity was well explained so no problems encountered
  - I like python best for network analysis --> can create a comprehensive program that only has to be run correspondence
  - Analysis and code feels connected/comprehensive


### Bonus Activity
- Have a feeling I'm going to like this more than either of the programs previously used
- Installing igraph took seconds for me but the comment ```# install igraph; this might take a long time``` is making me suspicious
- I like this style of step-by-step teaching through comments
- R reminds me of Processing almost, but for data --> Processing to visualize data?
- Still not pleased with readability of data but this is better --> zoom in to read
  - Way to make it more spread out?
