self: super: {

  # Leave this commented out by default to get better Hydra cache efficiency
  # python = super.python.override {
  #   packageOverrides = python-self: python-super: {
  #     numpy = python-super.numpy.override {
  #       blas = super.pkgs.mkl;
  #     };
  #   };
  # };

  # python3 = super.python3.override {
  #   packageOverrides = python-self: python-super: {
  #     numpy = python-super.numpy.override {
  #       blas = super.pkgs.mkl;
  #     };
  #   };
  # };
}
