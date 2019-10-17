with import <nixpkgs> { };
mkShell {
  name = "fpga-challenges";
  buildInputs = [
    gcc
    icestorm
    libconfuse
    libftdi
    python
    tinyprog
    usbutils
    verilator
    verilog
  ];
}
