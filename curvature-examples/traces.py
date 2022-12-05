#!/usr/bin/env python3

import itertools
import sys

INDICES = list("jklm")


class Trace:
    def __init__(self, symbol, conj=False):
        self.symbol = symbol
        self.conj = conj

    def partial_trace(self):
        return self

    def __str__(self):
        if self.conj:
            return "\ov{{tr {s}}}".format(s=self.symbol)
        return "tr {s}".format(s=self.symbol)


class PartialTrace:
    def __init__(self, a, b, j, k, conj=False):
        self.first = a
        self.second = b
        self.j = j
        self.k = k
        self.conj = conj

    def __str__(self):
        if self.conj:
            return "\ov{{(tr_{{{f}{s}}} f)_{{{j}{k}}}}}".format(
                f=self.first, s=self.second, j=self.j, k=self.k
            )
        return "(tr_{{{f}{s}}} f)_{{{j}{k}}}".format(
            f=self.first, s=self.second, j=self.j, k=self.k
        )

    def partial_trace(self):
        if self.j == self.k:
            return Trace(
                "tr_{{{f}{s}}} f".format(f=self.first, s=self.second), self.conj
            )

        return self


class End2:
    def __init__(self, p, q, j, k):
        self.indices = (p, q, j, k)
        self.conj = False

    def conjugate(self):
        p, q, j, k = self.indices
        self.indices = (j, k, p, q)
        self.conj = True

    def partial_trace(self):
        p, q, j, k = self.indices
        if p == j:
            return PartialTrace(1, 3, q, k, self.conj)
        elif p == k:
            return PartialTrace(1, 4, q, j, self.conj)
        elif q == j:
            return PartialTrace(2, 3, p, k, self.conj)
        elif q == k:
            return PartialTrace(2, 4, p, j, self.conj)
        else:
            return self

    def __str__(self):
        p, q, j, k = self.indices
        if self.conj:
            return "\ov{{f_{{{p}{q},{j}{k}}}}}".format(p=p, q=q, j=j, k=k)
        return "f_{{{p}{q},{j}{k}}}".format(p=p, q=q, j=j, k=k)


class End4:
    def __init__(self, perm):
        self.first = End2(perm[0], perm[1], INDICES[0], INDICES[1])
        self.second = End2(perm[2], perm[3], INDICES[2], INDICES[3])

    def conjugate(self):
        self.first.conjugate()

    def partial_trace(self):
        self.first = self.first.partial_trace()
        self.second = self.second.partial_trace()

    def __str__(self):
        return "{f} {s}".format(f=self.first, s=self.second)


if __name__ == "__main__":
    for p in itertools.permutations(INDICES, len(INDICES)):
        end = End4(p)
        end.conjugate()
        end.partial_trace()
        end.partial_trace()
        j, k, l, m = p
        print(
            # "\\tr(f \circ W_{{({t})}}) = f_{{{j}{k},jk}} f_{{{l}{m},lm}} &= {e}\n\\\\".format(
            "\\tr(f \circ W_{{({t})}})".format(t="".join(p), j=j, k=k, l=l, m=m, e=end)
        )
