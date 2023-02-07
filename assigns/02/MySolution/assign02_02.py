####################################################
import sys
sys.path.append('..')
from assign02 import *
from assign02_01 import *
####################################################
print("[import ./../assign02.py] is done!")
####################################################
#
# Please implement (10 points)
# mylist_quicksort (see list_quicksort in assign02.sml)
#
####################################################

def mylist_quicksort(xs):
    def qsort(xs):
        if mylist_nilq(xs):
            return mylist_nil()
        else:
            ys, zs = qpart(xs.get_cons2(), xs.get_cons1())
            ys = qsort(ys)
            zs = qsort(zs)
            return mylist_append(mylist_append(ys, mylist_cons(xs.get_cons1(), mylist_nil())), zs)
    
    def qpart(xs, p0):
        if mylist_nilq(xs):
            return mylist_nil(), mylist_nil()
        else:
            ys, zs = qpart(xs.get_cons2(), p0)
        if xs.get_cons1() <= p0:
            return mylist_cons(xs.get_cons1(), ys), zs
        else:
            return ys, mylist_cons(xs.get_cons1(), zs)
    return qsort(xs)
            