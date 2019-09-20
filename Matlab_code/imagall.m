% imagall
% Purpose: imagesc on 3D structure
% Usage
%       imagall(a,ll,[nr nc])
% where a  is the 3D data array
%       n  is the index (optional) ie. if 1:8 then a(:,:,1:8) is imaged
%       [nr nc] is the number of rows and columns of image display (optional)
%         if prod(nr,nc)> size(aa,3) then zeros are padded to fill array
%       z  is a matrix for padding that must be greater than the basic image size
%
   function y = imagall(a,ll,rc,z)

   sz = size(a);
   if nargin>=3, 
    if (prod(rc))>sz(3),
     for k=(sz(3)+1):prod(rc), a(:,:,k) = zeros(sz(1),sz(2)); end; 
     ll = [ll (sz(3)+1):prod(rc)];
     sz = size(a);
    end;
   end;

   if length(sz)==4,
       a = reshape(a,sz(1),sz(2),sz(3)*sz(4));
   end;
   if nargin==4,
     sz=size(a); if length(sz)<3, sz(3)=1; end;
     szz = size(z);
     pc = ceil((szz(1)-sz(1))/2); pr = ceil((szz(2)-sz(2))/2); 
     for k=1:sz(3), aa(:,:,k)=place_mat(squeeze(a(:,:,k)),z,[pc,pr]); end;
     a = aa; clear aa;
   end;
   sz = size(a);
   if length(sz)<3, sz(3)=1; end;
   if nargin==1, ll=1:sz(3);
   else
     if isempty(ll), ll=1:sz(3); end;
   end;
   sz = size(a(:,:,ll)); if length(sz)<3, sz(3)=1; end;
   if nargin<3,
    v = factor(sz(3));
    if length(v)==1, v(2)=v(1); v(1)=1; end;
    while length(v)>2, v=sort([v(1)*v(2) v(3:length(v))]); end
    nr = v(1); nc = v(2);
   else
    nr = rc(1); nc = rc(2);
   end;

   aa = reshape(a(:,:,ll(1:nc)),sz(1),sz(2)*nc);
   for ir=1:nr-1,
     ind1 = ir*nc + 1; ind2 = (ir+1)*nc;
     aa = [aa; reshape(a(:,:,ll(ind1:ind2)),sz(1),sz(2)*nc)];
   end;
   if nargout==1, y=aa;
   else imagesc(aa);
   end;

%	keyboard;

