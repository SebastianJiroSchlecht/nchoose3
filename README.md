# NCHOOSE3 - all combinations of three elements
   Y = NCHOOSE3(X) returns all combinations of three elements of the array X.
   It is the fast, vectorized version of NCHOOSEK(X,3).  X can be any type
   of array. When X is a scalar integer > 1, it returns X*(X-1)*(X-2)/6.

   Example:
    nchoose3([10 20 30 40 50])
    ->    10    20    30
          10    20    40
          10    20    50
          10    30    40
          10    30    50
          10    40    50
          20    30    40
          20    30    50
          20    40    50
          30    40    50

    nchoose3({'a','b','c','d','e'})
    ->  {'a'}    {'b'}    {'c'}
        {'a'}    {'b'}    {'d'}
        {'a'}    {'b'}    {'e'}
        {'a'}    {'c'}    {'d'}
        {'a'}    {'c'}    {'e'}
        {'a'}    {'d'}    {'e'}
        {'b'}    {'c'}    {'d'}
        {'b'}    {'c'}    {'e'}
        {'b'}    {'d'}    {'e'}
        {'c'}    {'d'}    {'e'}

   See also NCHOOSEK, PERMS, NEXTPERM
            NCHOOSE2, PERMN, NCHOOSE, ALLCOMB (on the File Exchange)

 version 1.0 (Wednesday, 12. December 2018)
 (c) Sebastian J. Schlecht
 https://www.sebastianjiroschlecht.com/

 Heavily inspired by NCHOOSE2 by
 (c) Jos van der Geest
 email: samelinoa@gmail.com
 http://www.mathworks.nl/matlabcentral/fileexchange/authors/10584
