% Section: Define elementary number words and their corresponding integer values.
unit_word(zero, 0).
unit_word(one, 1).
unit_word(two, 2).
unit_word(three, 3).
unit_word(four, 4).
unit_word(five, 5).
unit_word(six, 6).
unit_word(seven, 7).
unit_word(eight, 8).
unit_word(nine, 9).

teen_word(ten, 10).
teen_word(eleven, 11).
teen_word(twelve, 12).
teen_word(thirteen, 13).
teen_word(fourteen, 14).
teen_word(fifteen, 15).
teen_word(sixteen, 16).
teen_word(seventeen, 17).
teen_word(eighteen, 18).
teen_word(nineteen, 19).

tens_word(twenty, 20).
tens_word(thirty, 30).
tens_word(forty, 40).
tens_word(fifty, 50).
tens_word(sixty, 60).
tens_word(seventy, 70).
tens_word(eighty, 80).
tens_word(ninety, 90).

% Section: Main predicate to_num/2; converts input string to a list of words and calls the parser.
to_num(WordString, Number) :-
    downcase_atom(WordString, LowerCaseAtom),
    atomic_list_concat(WordAtomList, ' ', LowerCaseAtom),
    parse_number_from_list(WordAtomList, Number).

% Section: Core parsing rules for converting a list of word atoms to a number; rule order is crucial (longest patterns first).
parse_number_from_list([one, thousand], 1000). % Handles "one thousand".
parse_number_from_list([H_word, hundred, and, TY_word, U_word], Number) :- % e.g., "three hundred and ninety four"
    unit_word(H_word, H_val), H_val > 0,
    tens_word(TY_word, TY_val),
    unit_word(U_word, U_val), U_val > 0,
    Number is H_val * 100 + TY_val + U_val.
parse_number_from_list([H_word, hundred, and, TY_word], Number) :- % e.g., "one hundred and twenty"
    unit_word(H_word, H_val), H_val > 0,
    tens_word(TY_word, TY_val),
    Number is H_val * 100 + TY_val.
parse_number_from_list([H_word, hundred, and, TN_word], Number) :- % e.g., "one hundred and twelve"
    unit_word(H_word, H_val), H_val > 0,
    teen_word(TN_word, TN_val),
    Number is H_val * 100 + TN_val.
parse_number_from_list([H_word, hundred, and, U_word], Number) :- % e.g., "one hundred and one"
    unit_word(H_word, H_val), H_val > 0,
    unit_word(U_word, U_val),
    Number is H_val * 100 + U_val.
parse_number_from_list([H_word, hundred], Number) :- % e.g., "three hundred"
    unit_word(H_word, H_val), H_val > 0,
    Number is H_val * 100.
parse_number_from_list([TY_word, U_word], Number) :- % e.g., "ninety nine"
    tens_word(TY_word, TY_val),
    unit_word(U_word, U_val), U_val > 0,
    Number is TY_val + U_val.
parse_number_from_list([TY_word], Number) :- % e.g., "twenty"
    tens_word(TY_word, Number).
parse_number_from_list([TN_word], Number) :- % e.g., "fifteen"
    teen_word(TN_word, Number).
parse_number_from_list([U_word], Number) :- % e.g., "seven" or "zero"
    unit_word(U_word, Number).