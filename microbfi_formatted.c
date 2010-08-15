char *S[99],
      P[999],
      T[999],
    **s = S,
     *p = P,
     *t = T,
      d;

main(c)
{
    for (read(0, p, 999); c = *p; ++p)
        c ^ 93
            ? d
                ?
                : c ^ 91
                    ? c ^ 62
                        ? c ^ 60
                            ? c ^ 46
                                ? c ^ 45
                                    ? c ^ 44
                                        ? c ^ 43
                                            ?
                                            : ++*t
                                        : (*t = getchar())
                                    : --*t
                                : putchar(*t)
                            : --t
                        : ++t
                    : *t
                        ? *(s++) = p
                        : ++d
            : d
                ? --d
                : *t
                    ? p = *(s - 1)
                    : --s
        ;
}
