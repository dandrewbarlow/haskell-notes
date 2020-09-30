import Graphics.Gloss ( Picture )

ourPicture :: Picture
ourPicture = solidCircle

main :: IO()
main = drawingOf ourPicture