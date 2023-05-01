'''
autor: Gustavo Rivas Gervilla
'''

import random
import re
import sys

argv = sys.argv

if (len(argv) < 3):
    print('El formato es generator.py nombre_fichero_salida n_palabras')
    sys.exit()

out_file = argv[1]
n_words = int(argv[2])

valid_words = list(filter(lambda w: re.match('^[a-z]+$', w), list(open('dictionary.txt'))))

words = random.sample(list(valid_words), min(len(valid_words), n_words))

parsed_words = [word.split('/', 1)[0].rstrip() for word in words]

new_dictionary = open(out_file, 'w')
new_dictionary.write('\n'.join(parsed_words))
