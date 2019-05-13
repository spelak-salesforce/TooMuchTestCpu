@IsTest
public with sharing class Example_TEST {
    
    public with sharing class TestException extends Exception {}

    private static void testManualAnd(Boolean throwException) {
        final List<Boolean> booleans = new List<Boolean> {
            null,
            false,
            true
        };

        final List<Boolean> booleansWithoutNull = new List<Boolean> {
            false,
            true
        };

        Test.startTest();

        final Integer cpuStart = Limits.getCpuTime();

        for (Boolean param00 : booleans) {
            for (Boolean param01 : booleans) {
                for (Boolean param02 : booleans) {
                    for (Boolean param03 : booleans) {
                        for (Boolean param04 : booleans) {
                           for (Boolean param05 : booleans) {
                                for (Boolean param06 : booleans) {
                                    for (Boolean param07 : booleans) {
                                        for (Boolean param08 : booleans) {
                                            for (Boolean param09 : booleans) {
                                                for (Boolean param10 : booleansWithoutNull) {
                                                    for (Boolean param11 : booleansWithoutNull) {
                                                        for (Boolean param12 : booleansWithoutNull) {

                                                            final Boolean expected = 
                                                                param00 == true
                                                                && param01 == true
                                                                && param02 == true
                                                                && param03 == true
                                                                && param04 == true
                                                                && param05 == true
                                                                && param06 == true
                                                                && param07 == true
                                                                && param08 == true
                                                                && param09 == true
                                                                && param10 == true
                                                                && param11 == true
                                                                && param12 == true;

                                                            final Boolean actual = Example.manualAnd(
                                                                param00,
                                                                param01,
                                                                param02,
                                                                param03,
                                                                param04,
                                                                param05,
                                                                param06,
                                                                param07,
                                                                param08,
                                                                param09,
                                                                param10,
                                                                param11,
                                                                param12
                                                            );

                                                            System.assertEquals(
                                                                actual,
                                                                expected,
                                                                'Boolean Example.manualAdd(...)'
                                                            );
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        if (throwException == true) {
            final Integer cpuTime = Limits.getCpuTime() - cpuStart;
            throw new TestException(String.format(
                'CPU Time: {0} ({1}%)',
                new List<String> {
                    String.valueOf(cpuTime),
                    (Decimal.valueOf(cpuTime) / Decimal.valueOf(Limits.getLimitCpuTime()) * 100).setScale(2).format()
                }
            ));
        }

        Test.stopTest();

    }

    @IsTest
    private static void testManualAndWithException() {
        testManualAnd(true);
    }

    @IsTest
    private static void testManualAndWithoutException() {
        testManualAnd(false);
    }

}
