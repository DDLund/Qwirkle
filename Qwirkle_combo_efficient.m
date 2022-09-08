% Efficient method of counting qwirkle tiles using combinatorics

% Create a tile matrix X. Each row represents a different tile.
A = repmat(1:6,6,1);
B = repmat(1:6,1,6);
X = [A(:),B(:)];

% combo(n) gives the number of ways a set of n tiles can be drawn
combo(1) = 0;
combo(2) = 1;
combo(3) = 3^3 + 3^2 * 6;
combo(4) = 3^4 * 6 + 3^3 * 4;
combo(5) = 3^5 * 5;
combo(6) = 3^6;

% counts possible scores,from 1-6
count = zeros(1,6);

% a counting matrix for each hand
hand_counter = zeros(6,6);

% main loop. For each loop, it adds a tile to the hand, then if there are
% 2+ tiles in the hand, it scores the hand and adds the number of ways the
% hand be made to the score vetor

for i=1:36
    hand_counter(X(i,1),X(i,2)) = 1;
    
    for j=(i+1):36
        hand_counter(X(j,1),X(j,2)) = 1;
        t = score(hand_counter);
        count(t) = count(t) + combo(2);
        
        for k=(j+1):36
            hand_counter(X(k,1),X(k,2)) = 1;
            t = score(hand_counter);
            count(t) = count(t) + combo(3);
            
            for l=(k+1):36
                hand_counter(X(l,1),X(l,2)) = 1;
                t = score(hand_counter);
                count(t) = count(t) + combo(4);
                
                for m=(l+1):36
                    hand_counter(X(m,1),X(m,2)) = 1;
                    t = score(hand_counter);
                    count(t) = count(t) + combo(5);
                    
                    for n=(m+1):36
                        hand_counter(X(n,1),X(n,2)) = 1;
                        t = score(hand_counter);
                        count(t) = count(t) + combo(6);
                        hand_counter(X(n,1),X(n,2)) = 0;
                    end
                    hand_counter(X(m,1),X(m,2)) = 0;   
                end
                hand_counter(X(l,1),X(l,2)) = 0;
            end
            hand_counter(X(k,1),X(k,2)) = 0;
        end
        hand_counter(X(j,1),X(j,2)) = 0;
    end
    hand_counter(X(i,1),X(i,2)) = 0;
end

count
count/sum(count)



% input: the hand matrix
% output: the score of the hand

function out = score(hand_counter)
    out = max(norm(hand_counter,1), norm(hand_counter,Inf));
end