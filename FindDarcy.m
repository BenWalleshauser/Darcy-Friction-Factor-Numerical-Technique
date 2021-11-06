function f = FindDarcy(k,Re)
%Finds Darcy friction factor for turbulent flow using Newtons Method

%k = Relative roughness
%Re = Reynolds number
%f = Darcy friction factor

%Number of iterations to run for (100 is more than enough)
its = 100;

%Initial guess (using the Haaland equation as an estimation)
f = 1/(-1.8*log10((k/3.7)^1.11+6.9/Re))^2; 

%Performing Newton's Method to try and find the value of 'f' that minimizes
%the residual 'R'
for i = 1:its
    f = f - residual(f,k,Re)/dRdf(f,k,Re); 
        
end
    
    function R = residual(f,k,Re)
        R = 1/sqrt(f) +2*log10(k/3.7 + 2.51/(Re*sqrt(f)));
    end

    function derR = dRdf(f,k,Re)
        derR = -0.5*f^(-3/2)+2*(1/log(10))*(1/(k/3.7 + 2.51/(Re*sqrt(f))))*(2.51/Re)*(-0.5)*f^(-3/2);
    end
end

        