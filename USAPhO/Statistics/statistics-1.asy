if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
settings.inlinetex=true;
deletepreamble();
defaultfilename="statistics-1";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

import graph;
size(200, 10000);


real meanX = 53.0;
real stdvX = 29.0;

real mean = log( (meanX^2) / (sqrt(meanX^2 + stdvX^2)) );
real stdv = sqrt(log( 1 + (stdvX/meanX)^2 ));

real invErf = 0.47693627;

real f(real x)
{
return (500/(stdv*x)) * exp(-((log(x) - mean)^2)/(2*stdv^2));
}

draw((meanX, 0) -- (meanX, f(meanX)));
draw((exp(mean), 0) -- (exp(mean), f(exp(mean))));

draw(graph(f, 0.1, 163, operator..), red+linewidth(1.5));

draw((0, 0) -- (163, 0), arrow = Arrow(TeXHead));
draw((0, 0) -- (0, 70), arrow = Arrow(TeXHead));

label("$x$", (163, 0), E);

dot((meanX, 0));
dot((meanX, f(meanX)));
dot((exp(mean), 0));
dot((exp(mean), f(exp(mean))));



label("$\mu_x$", (meanX, f(meanX)), NE);

label("$P(x)$", (0, 70), align = N);

dot((0, 0));
