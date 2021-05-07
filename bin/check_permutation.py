import os
import sys

def check_permutation(str1, str2):
    ascii_arr = [0] * 128
    ascii_codes = []
    for ch in str1:
        ascii_code = ord(ch)
        ascii_arr[ascii_code] += 1
        ascii_code.append(ascii_code)

    for ch in str2:
        ascii_code = ord(ch)
        if ascii_arr[ascii_code] == 0:
            return False
        else:
            ascii_arr[ascii_code] -= 1

    for code in ascii_codes:
        if ascii_codes[code] != 0:
            return False

    return True

def sorted_permutations(str1, str2):
    if len(str1) != len(str2):
        return False
    else:
        sorted_str1 = sorted(str1)
        sorted_str2 = sorted(str2)
        for i in range(len(sorted_str1)):
            code1 = ord(sorted_str1[i])
            code2 = ord(sorted_str2[i])


    



if __name

