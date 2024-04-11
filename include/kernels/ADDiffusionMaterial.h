#pragma once

#include "ADKernelGrad.h"

class ADDiffusionMaterial : public ADKernelGrad
{
public:
  static InputParameters validParams();

  ADDiffusionMaterial(const InputParameters & parameters);

protected:
  virtual ADRealVectorValue precomputeQpResidual() override;

  const ADMaterialProperty<Real> & _diffusivity;
};
