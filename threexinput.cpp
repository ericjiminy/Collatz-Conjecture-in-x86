// Eric Chun - jc2ppp - 10/30/20 - threexinput.cpp

#include <iostream>
#include "timer.h"
using namespace std;

extern "C" int threexplusone(int);

int main() {
  int x;
  int n;
  int result;
  timer t;
  double totalTime;
  double averageTime;
  
  cout << "Enter a number: ";
  cin >> x;
  cout << "Enter iterations of subroutine: ";
  cin >> n;
  result = threexplusone(x);
  cout << "Iterations: " << result << endl;
  
  for (int i = 0; i < n; i++) {
    threexplusone(x);
  }

  return 0;
}
