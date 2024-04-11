#pragma once

#include "Material.h"

/**
 * Material objects inherit from Material and override computeQpProperties.
 *
 * Their job is to declare properties for use by other objects in the
 * calculation such as Kernels and BoundaryConditions.
 */
class Permeability : public Material
{
public:
  static InputParameters validParams();

  Permeability(const InputParameters & parameters);

protected:
  /// Necessary override. This is where the values of the properties are computed.
  virtual void computeQpProperties() override;

  /// The radius of the spheres in the column
  const Function & _fdiff;

  /// The diffusivity (K) computed based on the radius (mm)
  ADMaterialProperty<Real> & _diffusivity;
};
