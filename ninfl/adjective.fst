%
% FSTs for adjective inflections
%

#include "../symbols.fst"

%%%%%%%%%%%% adjective Inflections %%%%%%%%%%%%%%

ALPHABET = [#Letters##POS##BM##TMP##Lsym##Numbers##compounds#] <del> <pl> <infl_marker>

#inflboundary# = #POS##BM##TMP##Numbers#

$adj-anuswara-delete$ = {[#Anuswara#]}:{} ^-> ([#Letters#]+ __ [#inflboundary#]+ <adj> )

#=EC# = #Consonants#
$EC$ = {[#=EC#]}:{[#=EC#][ാ]}
$adj-a-vowel-elongation$ = $EC$ ^-> (__ <sanskrit> [#inflboundary#]+ <adj> )

$adj-i-vowel-elongation$ =( {ി}:{ീ} ) ^-> ([#Consonants#] __ <sanskrit> [#inflboundary#]+ <adj> )

% The order is important since the word without anuswara may get changed in other rules. Hence it is
% given at the end.
$adj$ = $adj-a-vowel-elongation$ || $adj-i-vowel-elongation$ || $adj-anuswara-delete$

$tests$ = ആശ<sanskrit><RB><adj> | യുവതി<sanskrit><RB><adj> | യുവതി<sanskrit><RB><adj>പ്രവേശനം<n><adj><RB> | \
    നതം<sanskrit><RB><adj>അംഗി<sanskrit><RB><adj>

$tests$ || $adj$ >> "adjective.test.a"

$adj$