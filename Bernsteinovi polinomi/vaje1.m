%naloga1

%komentirane so resitve
power2bernstein(1) % 1
power2bernstein([0 1]) % [1 1]
power2bernstein([0 0 1]) % [1 1 1]
power2bernstein([1 0]) % [0 1]
power2bernstein([0 1 0]) % [0 0.5 1]
power2bernstein([0 0 1 0]) % [0 0.3333 0.6667 1]

%se obratno prid more to kr je prej bil vhod
bernstein2power(1)
bernstein2power([1 1])
bernstein2power([1 1 1])
bernstein2power([0 1])
bernstein2power([0 1/2 1])
bernstein2power([0 1/3 2/3 1])

plotbazneBernstein(5)