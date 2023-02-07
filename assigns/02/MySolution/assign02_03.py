####################################################
import sys
sys.path.append('..')
from assign02 import *
####################################################
print("[import ./../assign02.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_mergesort (see list_mergesort in assign02.sml)
#
####################################################


def mylist_mergesort(xs):
    def split(xs):
        if mylist_nilq(xs):
            return mylist_cons(mylist_nil(), mylist_nil())
        else:
            xs = xs.get_cons2()
            if mylist_nilq(xs):
                return mylist_cons(xs.get_cons1(), mylist_nil()), mylist_nil()
            else:
                xs = xs.get_cons2()
                (ys, zs) = split(xs)
            return mylist_cons(mylist_cons(x1, ys), mylist_cons(xs.get_cons1(), zs))
    
    def merge(ys, zs):
        if mylist_nilq(ys):
            return zs
        else:
            ys = ys.get_cons2()
            if mylist_nilq(zs):
                return mylist_cons(ys.get_cons1(), ys)
            else:
                zs = zs.get_cons2()
                if ys.get_cons1() < zs.get_cons1():
                    return mylist_cons(ys.get_cons1(), merge(ys, mylist_cons(zs.get_cons1(), zs)))
                else:
                    return mylist_cons(zs.get_cons1(), merge(mylist_cons(ys.get_cons1(), ys), zs))
    
    if mylist_nilq(xs):
        return mylist_cons(xs.get_cons1(), mylist_nil())
    xs = xs.get_cons2()
    
    if mylist_nilq(xs):
        return merge(mylist_mergesort(mylist_cons(xs.get_cons1(), ys), mylist_mergesort(xs.get_cons2(), zs)))
    xs = xs.get_cons2()
    ys, zs = split(xs)


        