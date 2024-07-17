# 1. Write a predicate that given a list, it returns the last element.
last([], []):-!. 
last([E], E):-!. 
last([_|T], E):- last(T, E).

# 2. Write a predicate that given two lists L1 and L2, returns true if and only if L1 is a sub-list of L2.
sublist([],[]):-!.
sublist(L1, L2):- first(L1, L1, L2).
first([], _, _):-!.
first([H1|T1], L1, [H1|T2]):- !, second(T1, L1, T2).
first(L1, L1, [_|T2]):- first(L1, L1, T2).

second([], _, _):-!.
second([H1|T1], L1, [H1|T2]):- !, second(T1, L1, T2).
second(_, L1, L2):- first(L1, L1, L2).

# 3. Write a predicate that returns true if and only if a list is a palindrome.
pal([]):-!.
#pal([E], [E]):-!.
pal(L):-reverse(L, LR), check(L, LR).
check([], []):-!.
check([H|T], [H|T1]):- check(T, T1).

# 4. Write a predicate that given a list L and a term T counts the number of occourences of T in L
occ([], _, 0):-!.
occ([H|T], H, N):- !, occ(T, H, N1), N is N1 + 1.
occ([_|T], H, N):- occ(T, H, N).

# 5. Write a predicated that returns the given list L flattened
flat([], []):-!.
flat([H|T], Z):- H = [_|_], !, flat(H, K), flat(T, L), append(K, L, Z).
flat([H|T], [H|L]):-flat(T, L).

# 6. Write a predicate that given a list L return a new one but ordered (Ascending)
ordering([], []):-!.
ordering([E], [E]):-!.
ordering(L, [M|L1]):- min(L, [M|T1]), ordering(T1, L1).

min([H], [H]):- !. # min returns a (non-ordered) list which has on the top the minimum number of the list
min([H|T], [M, H|L]):- min(T, [M|L]), H > M, !.
min([H|T], [H|L]):- min(T, L).