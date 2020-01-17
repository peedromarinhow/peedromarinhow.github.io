#image scrapper from imgur user gallery
#
#   This script gets all the images from
#   a user's imgur gallery and embeds them
#   into a row of html elements sorted by
#   date and time.
#
#   To use this script you should create a
#   auth.ini file in the following form:
#   
#   [credentials]
#   client_id      = xxxxxxxxxxxxxxx
#   client_secret  = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#   imgur_username = xxx
#   imgur_password = ***
#
#   and then run the script, when prompted,
#   you should follow the link printed to the
#   console and authorize the access by logging
#   in to your imgur account, then copy the pin
#   and paste it in your console, press enter
#

import configparser
import imgurpython
import time
from datetime import datetime

#set up our Oauth infotmation
config = configparser.ConfigParser()
config.read("auth.ini")

#get the Oauth information
client_id     = config.get("credentials", "client_id")
client_secret = config.get("credentials", "client_secret")

#get user information
imgur_username = config.get("credentials", "imgur_username")
imgur_password = config.get("credentials", "imgur_password")

#define the client
client = imgurpython.ImgurClient(client_id, client_secret)

#get the autorization url
authorization_url = client.get_auth_url("pin")

print(authorization_url)

#get pin
imgur_pin = input("pin :")

#authorize
credentials = client.authorize(imgur_pin, "pin")
client.set_user_auth(credentials["access_token"], credentials["refresh_token"])

#get images
images = client.get_account_images(imgur_username)

#reserve dict
images_dict = []

#store imagesn in dict by name and creation
for image in images:

    #get the day  and time the image was shot from name (canon sx60hs only)
    name = image.name
    date = name[:4] + '/' + name[4:6] + '/' + name[6:8]
    time = name[8:10] + ':' + name[10:12] + ':' + name[12:14]

    #store the images by name(url id) and datetime
    images_dict.append({"name": image.id, "created": date + ' ' + time})
    print({"name": image.id, "created": date + ' ' + time})

#sort images by date and time
sorted_images = sorted(
    images_dict,
    key=lambda x: datetime.strptime(x["created"], "%Y/%m/%d %H:%M:%S")
)

#print two newlines
print(); print()

#print the html elements for copying
for image in sorted_images:
    prin(f"""<div>\n\t<img src = https://i.imgur.com/{image["name"]}h.jpg class = "center">\n\t<p> {image["created"]} </p>\n</div>""")
