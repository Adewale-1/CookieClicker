%%COOKIE CLICKER

%Spots creats the array that represents the board
spots = ones(10)

%CookiSpot is a random spot in the array above where the cookie will appear
cookiespot =randi([1 100])
%Resets the points to 0
point = 0;

%Used to display the empty board
cookie_clicker_BackDrop = simpleGameEngine('Cookies.png',86,101,5);

%Changes the arrat spots at cookieSpot to either 2 or 3 (which represents the different
%cookies) so the cookie will appear when the scene is drawn
spots(cookiespot) = randi([2 3])
drawScene(cookie_clicker_BackDrop,[spots])

%Gets the mouse input to later check if they clicked on the cookie
[x,y] = getMouseInput(cookie_clicker_BackDrop)

%Starts the timer
tic;

%The while loop check if the time passed is less then 15 if so it runs
%through the game
while toc < 15
    %If the spot selected is not 1 (Which means it's the spot where the
    %cookie is) it will add a point to your score
    if spots(x,y) ~= 1
        point = point + 1
    end
    %Resests the cookie spot back to 1
    spots(x,y) = 1
    %Chosses a new random spot and reruns through the code above
    cookiespot =randi([1 100])
    spots(cookiespot) = randi([2 3])
    drawScene(cookie_clicker_BackDrop,[spots])
    [x,y] = getMouseInput(cookie_clicker_BackDrop)
end

%Prints the end message
end_message = sprintf('Congratulations You Got %i COOKIES!!!' , point)
main = figure('Position',[200 300 700 300],'MenuBar','none','NumberTitle','off')
Text = uicontrol('Style','text','Units','normalized','Position',[.125,.50,.75,.125],'String',end_message,'FontSize',20,'ForegroundColor','k','FontWeight','bold');

