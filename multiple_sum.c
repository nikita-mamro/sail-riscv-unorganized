void main()
{
    const int ELEMENTS_NUMBER = 10;
    volatile int acc = 0;
    int i;

    for (i = 0; i < ELEMENTS_NUMBER; i++)
    {
        acc += 42;
    }
}

