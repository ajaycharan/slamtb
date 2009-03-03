% INITIMAGE Initialize global Image variable

Image{1} = oneShot([imgdir imgname{1}],fmin,equalizeIm);
Image{2} = oneShot([imgdir imgname{2}],fmin,equalizeIm);

% Initialize image regions for landmark detections
subImage = uniformRegions(...
   Cam(1).imSize(2),Cam(1).imSize(1),...
   regions,regions,...
   1,1,...
   ones(1,(regions-2)^2));

% Initialize image regions for objects detections
R = zeros(objRegions);
% R([3:objRegions-2],[objRegions-1]) = 1;
R([3:objRegions-2],[objRegions-1]) = 1;
V = reshape(R',1,[]);
subObjImage = uniformRegions(...
   Cam(1).imSize(2),Cam(1).imSize(1),...
   objRegions,objRegions,...
   0,0,...
   V);