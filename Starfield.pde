NormalParticle cat;
Particle[] particles;
PImage taylor, meredith, olivia, music;
void setup()
{
	size(500, 500);
	background(170, 255, 255);
	particles = new Particle[200];

	for (int i=0; i<particles.length; i++)
	{
		particles[i] = new NormalParticle();
	}

	particles[2] = new OddballParticle();
	particles[3] = new JumboParticleA();
	particles[4] = new JumboParticleB();
	taylor = loadImage("taylor.png");
	meredith = loadImage("meredith.png");
	olivia = loadImage("olivia.png");
	music = loadImage("music.png");
}

void draw()
{
	background(170, 255, 255);
	for(int i = 0; i<particles.length; i++)
	{
		particles[i].show();
		particles[i].move();
	}
}
void mouseClicked()
{
	for (int i=0; i<particles.length; i++)
	{
		particles[i] = new NormalParticle();
	}
	particles[2] = new OddballParticle();
	particles[3] = new JumboParticleA();
	particles[4] = new JumboParticleB();
}

class NormalParticle implements Particle
{
	double x, y, angle, speed, size;
	NormalParticle()
	{
		speed = Math.random()*15;
		x = 400;
		y = 400;
		size = 3;
		angle = Math.random()*2*Math.PI;
	}
	public void move()
	{
		x = x + Math.cos(angle)*speed;
		y = y + Math.sin(angle)*speed;
		size = size + (Math.random()*4)/15;
	}
	public void show()
	{
		image(music, (int)x, (int)y, 20, 30);
	}
}

interface Particle
{
	public void show();
	public void move();
}

class OddballParticle implements Particle//uses an interface
{
	int x, y, angle, speed;
	OddballParticle()
	{
		x = (int)(Math.random()*500);
		y = (int)(Math.random()*500);
	}
	public void move()
	{
		x = x + (int)(Math.random()*4)-1;
		y = y + (int)(Math.random()*4)-1;
	}
	public void show()
	{
		image(taylor, (int)x, (int)y, 100, 100);		
	}
}

class JumboParticleA extends NormalParticle//uses inheritance
{
	JumboParticleA()
	{

	}
	void show()
	{
		image(meredith, (int)x, (int)y, 200, 200);
	}
}

class JumboParticleB extends NormalParticle
{
	JumboParticleB()
	{

	}
	void show()
	{
		image(olivia, (int)x, (int)y, 200, 200);
	}
}

