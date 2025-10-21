
# a simple program to generate ratios for "tone diamond" derived scales 
# per Max Mathews famously used by Harry Partch
# https://www.chrysalis-foundation.org/musical-mathematics-pages/meyer-diamond/

import math

def uniq(input_list):
    return list(dict.fromkeys(input_list))

def get_ratios(i):
    return [2] + [x for bit, x in zip([1,2,4,8], [3,5,7,11]) if i & bit]

def r2c(n, d):
    return round((1200 * math.log(n/d, 2)) % 1200)

def get_diamond(i):
    ratios = get_ratios(i)
    return [[r2c(u, o) for o in ratios] for u in ratios]

def get_scale_cents(i):
    ratios = get_ratios(i)
    return uniq(sorted([r2c(u, o) for o in ratios for u in ratios]))

for i in range(16):
    s = get_scale_cents(i)
    #print("//diamond: %s" % (get_diamond(i)))
    print("constexpr static std::array<uint16_t, %d> ratio_%d = {{%s}}; " % (len(s), i, ", ".join(map(str, s))))