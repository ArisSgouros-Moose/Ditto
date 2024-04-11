#include "ADDiffusionMaterial.h"

registerMooseObject("DittoApp", ADDiffusionMaterial);

InputParameters
ADDiffusionMaterial::validParams()
{
  auto params = ADKernelGrad::validParams();
  params.addClassDescription("Same as `Diffusion` in terms of physics/residual, but the Jacobian "
                             "is computed using forward automatic differentiation");
  return params;
}

ADDiffusionMaterial::ADDiffusionMaterial(const InputParameters & parameters) : ADKernelGrad(parameters),
    _diffusivity(getADMaterialProperty<Real>("diffusivity"))
{
}

ADRealVectorValue
ADDiffusionMaterial::precomputeQpResidual()
{
  return _diffusivity[_qp] * _grad_u[_qp];
}
