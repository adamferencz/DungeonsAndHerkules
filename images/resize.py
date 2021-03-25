# made by ostSTRUPpen
import re
import cv2
import os
import json

with open("sizes.json", "r",  encoding="utf8") as file:
    json_data = json.load(file)

input_dirs = list(("raw\\enemy\\basic\\", "raw\\enemy\\boss\\", "raw\\enemy\\medium\\", "raw\\pet\\", "raw\\player\\", "raw\\ui\\",
                  "raw\\weapon\\basic\\", "raw\\weapon\\medium\\", "raw\\weapon\\Ultimate\\", "raw\\weapon\\ammo\\", "raw\\weapon\\shrapnel\\"))
output_dirs = list(("data\\enemy\\basic\\", "data\\enemy\\boss\\", "data\\enemy\\medium\\", "data\\pet\\", "data\\player\\", "data\\ui\\",
                   "data\\weapon\\basic\\", "data\\weapon\\medium\\", "data\\weapon\\Ultimate\\", "data\\weapon\\ammo\\", "data\\weapon\\shrapnel\\"))
sizes = list(("basic enemy", "boss enemy", "medium enemy", "pet", "player",
             "ui", "basic weapon", "medium weapon", "ultimate weapon", "ammo", "shrapnel"))
folders = list(("basic enemy", "boss enemy", "medium enemy", "pet", "player",
               "ui", "basic weapon", "medium weapon", "ultimate weapon", "ammo", "shrapnel"))

for i in range(len(input_dirs)):
    wanted_width = json_data[sizes[i]]
    print("Měním velikost: " +
          str(folders[i]) + " na: " + str(json_data[sizes[i]]) + " pixelů na šířku.")
    only_files = next(os.walk(input_dirs[i]))[2]
    for y in range(len(only_files)):
        img_name = str(only_files[y])
        input_path = str(input_dirs[i]) + str(only_files[y])
        output_path = str(output_dirs[i]) + str(only_files[y])
        wanted_width = int(wanted_width)
        img = cv2.imread(str(input_path),  cv2.IMREAD_UNCHANGED)
        img_ratio = img.shape[1] / img.shape[0]
        height = wanted_width/img_ratio
        width = wanted_width
        dim = (int(width), int(height))
        resized = cv2.resize(img, dim, interpolation=cv2.INTER_AREA)
        cv2.imwrite(output_path, resized)
