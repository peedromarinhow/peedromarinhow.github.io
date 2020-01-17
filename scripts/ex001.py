### 
### DEPRECATED
### 

### import os
### from PIL import Image
### 
### #path to images
### inpath = '../../images'
### outpath = '../images'
### 
### #open file
### html = open("../photos.html", "w")
### 
### html.write('<!DOCTYPE html>\n<html>\n\t<head>\n\t\t<link href = "https://fonts.googleapis.com/css?family=Roboto+Mono&display=swap" rel = "stylesheet">\n\t\t<link href = "main.css" rel = "stylesheet">\n\t\t<title>fotos</title>\n\t</head>\n\t<body>\n\t\t<div class = "row">')
### 
### #navigate all files in dir
### for filename in os.listdir(inpath):
### 
###     #open each image if it's a jpeg
###     if ".jpeg" in filename:
###         picture = Image.open(inpath + "/" + filename)
### 
###         #set the scale factor
###         size = int(picture.size[0] / 2), int(picture.size[1] / 2)
### 
###         #resize image
###         picture.thumbnail(size)
### 
###         #get metadata of image
###         data = picture._getexif()[36867]
### 
###         #get date of image and format it
###         day = str(data)[8:10]
###         month = str(data)[5:7]
###         year = str(data)[:4]
### 
###         date = day + "/" + month + "/" + year
### 
###         #save image
###         picture.save(os.path.join(outpath, filename))
### 
###         #create tag and write
###         html.write(f"\n\t\t\t<div><div class = \"image\"><img src = \"images\\{filename}\" class = \"center\"></div><p> {date} </p></div>")
### 
###         #print its filename
###         print(filename)
### 
### #join final code
### html.write("\n\t\t</div>\n\t</body>\n</html>")
### 
### #close file
### html.close()
### 
### #close picture
### picture.close()