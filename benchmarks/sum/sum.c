int main( int argc, char* argv[] )
{
  volatile int res = 0;
  for (int i = 0; i < 100000; ++i) {
    volatile int add = 10;
    res += add;
  }
  return 0;
}