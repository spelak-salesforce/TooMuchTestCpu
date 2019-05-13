# Purpose

As little as one year ago, I ran into an issue when testing a large number of states an Apex Class could be in by looping over all possible states variable could be in.  My tests were passing but I wasn't getting 100% code coverage though every line should have been covered.  I was concerned I ran out of CPU Time, so I added a `if (true) { throw TestException(); }` before the `Test.stopTest()`, and the test never saw the Exception thrown.

But it appears this gap is closed.  In `Example_TEST` I started looping over 3^20 combinations, but I was correctly getting a `System.LimitException: Apex CPU time limit exceeded`.  So, I iteratively reduced the number of combinations to get it close to the boundary where there is enough CPU Time to complete processing.  Each time, the test correctly reported the CPU Time Limit Exception, and I got the expected result after crossing the threshold to enough CPU Time where `Example_TEST.testManualAndWithoutException` **passes** but `Example_TEST.testManualAndWithException` **fails** throwing a `Example_TEST.TestException`.