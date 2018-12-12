function Y = nchoose3(X)
% NCHOOSE3 - all combinations of three elements
%   Y = NCHOOSE3(X) returns all combinations of three elements of the array X.
%   It is the fast, vectorized version of NCHOOSEK(X,3).  X can be any type
%   of array. When X is a scalar integer > 1, it returns X*(X-1)*(X-2)/6.
%
%   Example:
%    nchoose3([10 20 30 40 50])
%   % ->    10    20    30
%   %       10    20    40
%   %       10    20    50
%   %       10    30    40
%   %       10    30    50
%   %       10    40    50
%   %       20    30    40
%   %       20    30    50
%   %       20    40    50
%   %       30    40    50
%
%    nchoose3({'a','b','c','d','e'})
%   % ->  {'a'}    {'b'}    {'c'}
%   %     {'a'}    {'b'}    {'d'}
%   %     {'a'}    {'b'}    {'e'}
%   %     {'a'}    {'c'}    {'d'}
%   %     {'a'}    {'c'}    {'e'}
%   %     {'a'}    {'d'}    {'e'}
%   %     {'b'}    {'c'}    {'d'}
%   %     {'b'}    {'c'}    {'e'}
%   %     {'b'}    {'d'}    {'e'}
%   %     {'c'}    {'d'}    {'e'}
%
%   See also NCHOOSEK, PERMS, NEXTPERM
%            NCHOOSE2, PERMN, NCHOOSE, ALLCOMB (on the File Exchange)

% version 1.0 (Wednesday, 12. December 2018)
% (c) Sebastian J. Schlecht
% https://www.sebastianjiroschlecht.com/
%
% Heavily inspired by NCHOOSE2 by
% (c) Jos van der Geest
% email: samelinoa@gmail.com
% http://www.mathworks.nl/matlabcentral/fileexchange/authors/10584


N = numel(X) ;
if N==1
    if isnumeric(X) && X>1 && X==fix(X)
        Y = X*(X-1)*(X-2)/6 ;
    else
        error('For scalar input, N should be an integer > 1.') ;
    end  
elseif N==2
    error('At least three elements are necessary');
elseif N==3
    Y = X(:).' ; % output is a row vector
else
    
    % create indices
    V  = N-1:-1:3;
    ri1 = cumsum(V .* (V-1) / 2);         
    
    V2 = N-2:-1:3;
    ri2 = cumsum([1 V2]);
    
    ind3(ri2) = V-1;
    ind3 = ind3-1;
    V3 = cumsum(ind3)+1;
    ri3 = cumsum(V3);
    
    % setup arrays
    ind(ri1,1) = 1 ;                 
    
    ind(ri3,2) = 1;
    ind(ri1,2) = ind(ri1,2) - V.' + 2;
    ind(end,2) = 0;

    ind(ri3,3) = -V3 + 1;
    ind(:,3) = ind(:,3) + 1;
    ind(ri1,3) = ind(ri1,3) - V.' + 2;
    
    ind = cumsum([1 2 3; ind],1);
    
     % index into X
    Y = X(ind) ;                   
end