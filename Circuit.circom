pragma circom 2.0.0;

/*This circuit template checks that result is the multiplication of inputs num1 and num2.*/  

template ProductChecker () {  

   //input signals
   signal input num1;
   signal input num2;

   //Gate signals
   signal intermediateX;
   signal intermediateY;

   //Output signals
   signal output result;

   //Component gates
   component andGate = AND();
   component notGate = NOT();
   component orGate = OR();

   //Logic of circuits
   andGate.a <== num1;
   andGate.b <== num2;
   intermediateX <== andGate.out;

   notGate.in <== num2;
   intermediateY <== notGate.out;

   orGate.a <== intermediateX;
   orGate.b <== intermediateY;
   result <== orGate.out;

}

template OR(){
   signal input a;
   signal input b;
   signal output out;
   out <== a+b-a*b;
}

template NOT(){
   signal input in;
   signal output out;
   out <== 1+in-2*in;
}

template AND(){
   signal input a;
   signal input b;
   signal output out;
   out <== a*b;
}

component main = ProductChecker();
