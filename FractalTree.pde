private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = 0.8;  
boolean flip = true;
boolean flip2 = true;
int i = 1;
double pointrot = 0;
public void setup() 
{   
	size(640,480);
	frameRate(15);
	//noLoop(); 
} 
public void draw() 
{   
	background(0);   
	//stroke((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));   
	line(320,380,320,160);   
	line(160,240,320+160,240);
	drawBranches(320,160,i, pointrot);  
	drawBranches(320,380,i, -pointrot);
	drawBranches(160,240,i, pointrot);
	drawBranches(320+160,240,i, -pointrot);  


	if(i<0)
		flip=true;

	if(i>100)
		flip=false;

	if(flip)
		i++;
	if(!flip)
		i--;

	if(pointrot<0)
		flip2=true;

	if(pointrot>2*PI)
		flip2=false;

	if(flip2)
		pointrot+=0.1;
	if(!flip2)
		pointrot+=0.1;

	branchAngle +=0.01;
	//println(i);
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;

	int endX1 = (int)(x+branchLength*Math.cos(angle1));
	int endY1 = (int)(y+branchLength*Math.sin(angle1));

	int endX2 = (int)(x+branchLength*Math.cos(angle2) );
	int endY2 = (int)(y+branchLength*Math.sin(angle2) );

	stroke((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);

	if(branchLength > smallestBranch)
	{
		drawBranches(endX1,endY1,branchLength*fractionLength,angle1);
		drawBranches(endX2,endY2,branchLength*fractionLength,angle2);
	}
} 
