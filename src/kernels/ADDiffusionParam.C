#include "ADDiffusionParam.h"

registerMooseObject("DittoApp", ADDiffusionParam);

InputParameters
ADDiffusionParam::validParams()
{
  auto params = ADKernelGrad::validParams();
  params.addClassDescription("Same as `Diffusion` in terms of physics/residual, but the Jacobian "
                             "is computed using forward automatic differentiation");
  params.addParam<Real>("diffusivity", 1.0, "Diffusivity Coefficient");
  return params;
}

ADDiffusionParam::ADDiffusionParam(const InputParameters & parameters) : ADKernelGrad(parameters),
    _diffusivity(getParam<Real>("diffusivity"))
{
}

ADRealVectorValue
ADDiffusionParam::precomputeQpResidual()
{
  return _diffusivity * _grad_u[_qp];
}
