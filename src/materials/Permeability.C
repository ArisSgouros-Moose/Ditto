#include "Permeability.h"
#include "Function.h"

registerMooseObject("DittoApp", Permeability);

InputParameters
Permeability::validParams()
{
  InputParameters params = Material::validParams();
  params.addParam<FunctionName>("fdiff", "1.0", "Default diffusivity");
  return params;
}

Permeability::Permeability(const InputParameters & parameters)
  : Material(parameters),
    _fdiff(getFunction("fdiff")),
    _diffusivity(declareADProperty<Real>("diffusivity"))
{
}

void
Permeability::computeQpProperties() {
  _diffusivity[_qp] = _fdiff.value(_t, _q_point[_qp]);
}
