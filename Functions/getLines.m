function [ output_args ] = getLines( img )
%GETLINES input is a 2D array or 2D gpuArray
%   Detailed explanation goes here
    edges = edge(img, 'canny');
    [H,theta,rho] = hough(edges);
    P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
    
    x = theta(P(:,2));
    y = rho(P(:,1));
    lines = houghlines(edges,theta,rho,P,'FillGap',10,'MinLength',4);
    lines
    imshow(edges), hold on
    max_len = 0;
    for k = 1:length(lines)
       xy = [lines(k).point1; lines(k).point2];
       plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

       % Plot beginnings and ends of lines
       plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
       plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

       % Determine the endpoints of the longest line segment
       len = norm(lines(k).point1 - lines(k).point2);
       if ( len > max_len)
          max_len = len;
          xy_long = xy;
       end
    end
    % highlight the longest line segment
    plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');
    
end

