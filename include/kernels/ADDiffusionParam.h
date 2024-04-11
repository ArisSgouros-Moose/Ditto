#pragma once

#include "ADKernelGrad.h"

class ADDiffusionParam : public ADKernelGrad
{
public:
  static InputParameters validParams();

  ADDiffusionParam(const InputParameters & parameters);

protected:
  virtual ADRealVectorValue precomputeQpResidual() override;

  const Real _diffusivity;
};
