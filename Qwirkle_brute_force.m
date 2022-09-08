% Brute force method of counting qwirkle tiles

% Create a tile matrix X. Each row represents a different tile.
A = repmat(1:6,18,1);
B = repmat(1:6,3,6);
X = [A(:),B(:)];
% counts possible scores,from 1-6
count = zeros(1,6);

% a counting matrix for each hand
hand_counter = zeros(6,6);

% main brute force loop
for i=1:108
    i
    for j=(i+1):108
        for k=(j+1):108
            for l=(k+1):108
                for m=(l+1):108
                    for n=(m+1):108
                        t = score(hand_counter,X,i,j,k,l,m,n);
                        count(t) = count(t) + 1;
                    end
                end
            end
        end
    end
end

count
count/sum(count)



% input: the count matrix, the hand matrix, and the postion of 6 tiles
% populates the hand matrix with tiles, counts the greatest set, then
% resets the hand matrix and passes the back the score.

function out = score(hand_counter,X,i,j,k,l,m,n)
    hand_counter(X(i,1),X(i,2)) = 1;
    hand_counter(X(j,1),X(j,2)) = 1;
    hand_counter(X(k,1),X(k,2)) = 1;
    hand_counter(X(l,1),X(l,2)) = 1;
    hand_counter(X(m,1),X(m,2)) = 1;
    hand_counter(X(n,1),X(n,2)) = 1;
    out = max( norm(hand_counter,1), norm(hand_counter,Inf));
    hand_counter(X(i,1),X(i,2)) = 0;
    hand_counter(X(j,1),X(j,2)) = 0;
    hand_counter(X(k,1),X(k,2)) = 0;
    hand_counter(X(l,1),X(l,2)) = 0;
    hand_counter(X(m,1),X(m,2)) = 0;
    hand_counter(X(n,1),X(n,2)) = 0;
end



                        