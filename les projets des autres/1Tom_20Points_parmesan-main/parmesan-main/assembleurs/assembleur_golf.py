#!/usr/bin/env python3
import os, re, sys
regexes = {re.compile(k): v for k, v in [
    (r"(?:\{(R\w+)\})", r"(?P<F\1>r(?P<\1>\\d))"),
    (r"(?:\{(imm\d)\})", r"(?P<F\1>#(?P<\1>&?\\d+))"),
    (r"\{cond\}", r"(?P<cond>(?:[a-z]{2}))"),
    (r"\{label(\d+)\}", r"(?P<label\1>[\.\\w]+)")
]}
conds = ["eq", "ne", "cs", "cc", "mi", "pl", "vs", "vc", "hi", "ls", "ge", "lt", "gt", "le", "al", "nv"]
ins = {}
for k, v in {
    "lsls {Rd}, {Rm}, {imm5}": (0b000_00, "imm5", "Rm", "Rd"),
    "lsrs {Rd}, {Rm}, {imm5}": (0b000_01, "imm5", "Rm", "Rd"),
    "asrs {Rd}, {Rm}, {imm5}": (0b000_10, "imm5", "Rm", "Rd"),
    "adds {Rd}, {Rn}, {Rm}": (0b000_11_00, "Rm", "Rn", "Rd"),
    "subs {Rd}, {Rn}, {Rm}": (0b000_11_01, "Rm", "Rn", "Rd"),
    "adds {Rd}, {Rn}, {imm3}": (0b000_11_10, "imm3", "Rn", "Rd"),
    "subs {Rd}, {Rn}, {imm3}": (0b000_11_11, "imm3", "Rn", "Rd"),
    "movs {Rd}, {imm8}": (0b001_00, "Rd", "imm8"),
    "ands {Rdn}, ({Rdn_}, )?{Rm}": (0b010000_0000, "Rm", "Rdn"),
    "eors {Rdn}, ({Rdn_}, )?{Rm}": (0b010000_0001, "Rm", "Rdn"),
    "lsls {Rdn}, ({Rdn_}, )?{Rm}": (0b010000_0010, "Rm", "Rdn"),
    "lsrs {Rdn}, ({Rdn_}, )?{Rm}": (0b010000_0011, "Rm", "Rdn"),
    "asrs {Rdn}, ({Rdn_}, )?{Rm}": (0b010000_0100, "Rm", "Rdn"),
    "adcs {Rdn}, ({Rdn_}, )?{Rm}": (0b010000_0101, "Rm", "Rdn"),
    "sbcs {Rdn}, ({Rdn_}, )?{Rm}": (0b010000_0110, "Rm", "Rdn"),
    "rors {Rdn}, ({Rdn_}, )?{Rm}": (0b010000_0111, "Rm", "Rdn"),
    "tst {Rn}, {Rm}": (0b010000_1000, "Rm", "Rn"),
    "rsbs {Rd}, {Rn}, #0": (0b010000_1001, "Rn", "Rd"),
    "cmp {Rn}, {Rm}": (0b010000_1010, "Rm", "Rn"),
    "cmn {Rn}, {Rm}": (0b010000_1011, "Rm", "Rn"),
    "orrs {Rdn}, ({Rdn_}, )?{Rm}": (0b010000_1100, "Rm", "Rdn"),
    "muls {Rdm}, {Rn}, {Rdm_}": (0b010000_1101, "Rn", "Rdm"),
    "bics {Rdn}, ({Rdn_}, )?{Rm}": (0b010000_1110, "Rm", "Rdn"),
    "mvns {Rd}, {Rm}": (0b010000_1111, "Rm", "Rd"),
    "str {Rt}, [sp(?:, {imm8})?]": (0b1001_0, "Rt", "imm8"),
    "ldr {Rt}, [sp(?:, {imm8})?]": (0b1001_1, "Rt", "imm8"),
    "add (sp, )?sp, {imm7}": (0b1011_0000_0, "imm7"),
    "sub (sp, )?sp, {imm7}": (0b1011_0000_1, "imm7"),
    "b({cond})? {label8}": (0b1101, "cond", "label8"),
}.items():
    k = k.replace("[", "\\[").replace("]", "\\]")
    for rg, sub in regexes.items():
        k = rg.sub(sub, k)
    ins[re.compile(f"^{k}$")] = v
def assemble(line, labels, pc):
    instr, args = line.split(None, 1)
    line = instr + " " + ", ".join(map(str.strip, filter(bool, args.split(","))))
    for i, output in ins.items():
        if m := i.match(line):
            break
    else:
        raise Exception(f"Invalid instruction: {line}")
    dic = m.groupdict()
    for k, v in dic.items():
        if k.startswith("imm"):
            dic[k] = (0 if v is None else int(v), int(k[3:]))
        elif k[0] == "R":
            dic[k] = (int(v), 3)
        elif k == "cond":
            dic[k] = (conds.index(v or "al"), 4)
        elif k.startswith("label"):
            try:
                dic[k] = (labels[v] - pc - 3, int(k[5:]))
            except KeyError:
                raise Exception(f"Invalid label: {v} (available: {', '.join(labels.keys())})")
    res = 0
    for nval in output:
        width = 0
        val = nval
        if type(val) == str:
            val, width = dic[val]
        res <<= width
        if width != 0:
            val &= 2 ** width - 1
        res += val
    return res
fn = sys.argv[-1]
fp, fo = open(fn, "r"), open(os.path.splitext(fn)[0] + ".bin", "w")
rlbl = re.compile(r"^([.\w]+)\s*:")
labels = {}
instrs = []
for i, line in enumerate(map(str.lower, fp.readlines())):
    if "@" in line:
        line = line[:line.index("@")]
    while line := line.strip():
        if m := rlbl.match(line):
            labels[m.group(1)] = len(instrs)
            line = line[line.index(":") + 1:]
            continue
        else:
            if line[0] != ".":
                instrs.append(line)
            break
fo.write("v2.0 raw\n" + " ".join("%04x" % assemble(line, labels, pc) for pc, line in enumerate(instrs)) + "\n")
