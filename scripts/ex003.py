#image renamer
#
#   This script renames images
#   by date and time in the 
#   form: yyyy mm dd hh mm ss
#

from PIL import Image
import os

#path to images
inpath  = input("[path to images]:")
outpath = "/photos/sorted"

#navigate all files in dir
for filename in os.listdir(inpath):

    #open if jpeg
    if ".jpeg" in filename or ".jpg" in filename:
        picture = Image.open(os.path.join(inpath, filename))

        #retrieve metadatadata
        data = picture._getexif()[36867]

        #get the date the images was taken and format
        year  = str(data)[:4]
        month = str(data)[5:7]
        day   = str(data)[8:10]
        date = year + month + day

        #get the time the image was taken and format
        hours = str(data)[11:13]
        mins  = str(data)[14:16]
        secs  = str(data)[17:19]
        time = hours + mins + secs

        #set the name of the image in the form: yyyy mm dd hh mm ss
        name = date + time + ".jpg"

        #print the name
        print(name)
]
        #save the picture
        picture.save(os.path.join(outpath, name))

print("[renamed images are located in \"/photos/sorted\"]")
