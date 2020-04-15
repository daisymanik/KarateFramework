Feature: calling javascript program

  
  Scenario: jc
  Given def adder = function(a, b){ return a + b }
  Then assert adder(1, 2) == 3
