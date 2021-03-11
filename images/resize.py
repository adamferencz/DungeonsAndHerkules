#made by ostSRUPpen
import re
import cv2
import os

input_dirs = list(('enemy\\basic\\', 'enemy\\boss\\', 'enemy\\medium\\', 'pet\\', 'player\\', 'ui\\', 'weapon\\basic\\', 'weapon\\medium\\', 'weapon\\Ultimate\\'))
output_dirs = list(('data\\enemy\\basic\\', 'data\\enemy\\boss\\', 'data\\enemy\\medium\\', 'data\\pet\\', 'data\\player\\', 'data\\ui\\', 'data\\weapon\\basic\\', 'data\\weapon\\medium\\', 'data\\weapon\\Ultimate\\'))
test = list(('basic enemy', 'boss enemy', 'medium enemy', 'pet', 'player', 'ui', 'basic weapon', 'medium weapon', 'ultimate weapon'))



for i in range (len(input_dirs)):
    wanted_width = input ('\nJak velký má být ' + test[i] + ' na šířku? \n')
    print('Obrázky budou na šířku: ' + str(wanted_width))
    only_files = next(os.walk(input_dirs[i]))[2]
    for y in range (len(only_files)):
        img_name = str(only_files[y])
        input_path = str(input_dirs[i]) + str(only_files[y])
        output_path = str(output_dirs[i]) + str(only_files[y])
        wanted_width = int(wanted_width)
        if re.search(".*(ammo|shrapnel).*", img_name) != None:
            print(img_name)
            resized = cv2.imread(str(input_path),  cv2.IMREAD_UNCHANGED)
        else:
            img = cv2.imread(str(input_path),  cv2.IMREAD_UNCHANGED)

            img_ratio = img.shape[1] / img.shape[0]

            height = wanted_width/img_ratio
            width = wanted_width
            dim = (int(width), int(height))

            resized = cv2.resize(img, dim, interpolation = cv2.INTER_AREA)

        cv2.imwrite(output_path, resized)