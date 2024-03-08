#include <stdio.h>

float h2c(float);

/* print Fahrenheit-Celsius table
   for fahr = 0, 20, ..., 300, floating-point version */
int main()
{
  float fahr, celsius;
  float lower, upper, step;

  lower = 0;			/* lower limit of temperature scale */
  upper = 300;			/* upper limit */
  step = 20;			/* step size */

  fahr = lower;

  printf("%3s\t%6s\n","F","C");	/* table header */

  while (fahr <= upper) {
    celsius = h2c(fahr);
    printf("%3.0f\t%6.1f\n", fahr, celsius);
    fahr = fahr + step;
  }
}
  
float h2c(float fahr)
{
  return (5.0/9.0) * (fahr-32.0);
}