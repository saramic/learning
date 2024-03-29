import sys; sys.dont_write_bytecode = True; from mcpower_utils import *

def do_case(inp: str, sample=False):
    # READ THE PROBLEM FROM TOP TO BOTTOM OK
    def sprint(*a, **k): sample and print(*a, **k)
    lines: typing.List[str] = inp.splitlines()
    paras: typing.List[typing.List[str]] = lmap(str.splitlines, inp.split("\n\n"))
    out = 0

    scanners = []
    for para in paras:
        points = lmap(ints, para[1:])
        scanners.append(points)
        # print(len(points))
    
    # assume scanner 0 is good

    FACINGS = [x for i in [-1, 1] for x in [[i, 0, 0], [0, i, 0], [0, 0, i]]]

    def cross(a, b):
        c = [a[1]*b[2] - a[2]*b[1],
            a[2]*b[0] - a[0]*b[2],
            a[0]*b[1] - a[1]*b[0]]

        return c
    
    def common(a, b):
        aset = set(map(tuple, a))
        # return b's points, but now relative to a
        for facing in FACINGS:
            for up in [f for f in FACINGS if all(abs(x) != abs(y) for x, y in zip(f, facing) if x or y)]:
                
                # facing's
                right = cross(facing, up)

                matrix = [facing, up, right]
                new_b = [matvec(matrix, vec) for vec in b]

                for a_point in a:
                    for b_point in new_b:
                        # assume they're the same
                        # add a-b to all b
                        delta = padd(a_point, pneg(b_point))
                        new_new_b = [padd(delta, b) for b in new_b]
                        if len(aset.intersection(map(tuple, new_new_b))) >= 12:
                            return new_new_b
        return None
    
    # if sample:
    #     print(common(scanners[0], scanners[1]))
    #     quit()
    good_scanners = [None] * len(scanners)
    good_scanners[0] = scanners[0]
    done_scanners = [False] * len(scanners)
    while True:
        for i in range(len(scanners)):
            if good_scanners[i] and not done_scanners[i]:
                for j in range(len(scanners)):
                    if i != j and good_scanners[j] is None:
                        test = common(good_scanners[i], scanners[j])
                        # sprint(test)
                        if test is not None:
                            good_scanners[j] = test
                done_scanners[i] = True
        print(done_scanners, lmap(bool, good_scanners))
        if all(done_scanners):
            break
    
    out = set(tuple(point) for points in good_scanners for point in points)
    out = len(out)

    
    if out:
        print("out:    ", out)
    return  # RETURNED VALUE DOESN'T DO ANYTHING, PRINT THINGS INSTEAD



run_samples_and_actual([
r"""
--- scanner 0 ---
404,-588,-901
528,-643,409
-838,591,734
390,-675,-793
-537,-823,-458
-485,-357,347
-345,-311,381
-661,-816,-575
-876,649,763
-618,-824,-621
553,345,-567
474,580,667
-447,-329,318
-584,868,-557
544,-627,-890
564,392,-477
455,729,728
-892,524,684
-689,845,-530
423,-701,434
7,-33,-71
630,319,-379
443,580,662
-789,900,-551
459,-707,401

--- scanner 1 ---
686,422,578
605,423,415
515,917,-361
-336,658,858
95,138,22
-476,619,847
-340,-569,-846
567,-361,727
-460,603,-452
669,-402,600
729,430,532
-500,-761,534
-322,571,750
-466,-666,-811
-429,-592,574
-355,545,-477
703,-491,-529
-328,-685,520
413,935,-424
-391,539,-444
586,-435,557
-364,-763,-893
807,-499,-711
755,-354,-619
553,889,-390

--- scanner 2 ---
649,640,665
682,-795,504
-784,533,-524
-644,584,-595
-588,-843,648
-30,6,44
-674,560,763
500,723,-460
609,671,-379
-555,-800,653
-675,-892,-343
697,-426,-610
578,704,681
493,664,-388
-671,-858,530
-667,343,800
571,-461,-707
-138,-166,112
-889,563,-600
646,-828,498
640,759,510
-630,509,768
-681,-892,-333
673,-379,-804
-742,-814,-386
577,-820,562

--- scanner 3 ---
-589,542,597
605,-692,669
-500,565,-823
-660,373,557
-458,-679,-417
-488,449,543
-626,468,-788
338,-750,-386
528,-832,-391
562,-778,733
-938,-730,414
543,643,-506
-524,371,-870
407,773,750
-104,29,83
378,-903,-323
-778,-728,485
426,699,580
-438,-605,-362
-469,-447,-387
509,732,623
647,635,-688
-868,-804,481
614,-800,639
595,780,-596

--- scanner 4 ---
727,592,562
-293,-554,779
441,611,-461
-714,465,-776
-743,427,-804
-660,-479,-426
832,-632,460
927,-485,-438
408,393,-506
466,436,-512
110,16,151
-258,-428,682
-393,719,612
-211,-452,876
808,-476,-593
-575,615,604
-485,667,467
-680,325,-822
-627,-443,-432
872,-547,-609
833,512,582
807,604,487
839,-516,451
891,-625,532
-652,-548,-490
30,-46,-14

""",r"""

""",r"""

""",r"""

""",r"""

""",r"""

""",r"""

"""], do_case)
