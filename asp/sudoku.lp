% Please insert the names and email addresses of the group members:
% Theo Tappe theo.tappe@uni-potsdam.de / tappetheo@gmail.com

subgrid_size(3).

% Hints:
% - For subgrid_size(s), subgrids can be identified by labels 0..s*s-1
% - A cell (x,y) can be mapped to the subgrid labeled (((x-1)/s)*s + (y-1)/s)

% Your implementation please...

% add base facts
pos(1..9).
num(1..9).
subgrid_size(3).

% creates all possible board combinations (and picks 1 each time)
{ sudoku(ROW,COLUMN,NUMBER) : num(NUMBER) } = 1
% make sure ROW and COLUMN are positions
:- pos(ROW), pos(COLUMN).
% make same numbers in same row but diffrent column impossible
:- sudoku(ROW, COLUMN, NUMBER), sudoku(ROW, O_COLUMN, NUMBER), pos(O_COLUMN), O_COLUMN != COLUMN.
% make same number in diffrent row but same column impossible
:- sudoku(ROW, COLUMN, NUMBER), sudoku(O_ROW, COLUMN, NUMBER), pos(O_ROW), O_ROW != ROW.
% make values unequal of the initial values impossible
:- sudoku(ROW, COLUMN, O_NUMBER), initial(ROW, COLUMN, O_INIT_NUMBER), O_NUMBER != O_INIT_NUMBER.
% make sure the 3x3 rule is applied
:- sudoku(R1, C1, N), sudoku(R2, C2, N), (R1, C1) != (R2, C2), subgrid_size(S), ((R1-1)/S)*S + (C1-1)/S == ((R2-1)/S)*S + (C2-1)/S.

% old tries:
% grid1C(1..3).
% grid1R(1..3).
% :- grid1R(R1), grid1C(C1), grid1R(R2), grid1C(C2), num(N1), num(N2), sudoku(R1, C1, N1), sudoku(R2, C2, N2), N1 == N2, R2 != R1, C1 != C2. 

#show sudoku/3.
