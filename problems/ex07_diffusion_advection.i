[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 120
  ny = 20
  ymin = -5.0
  ymax = 5.0
  xmin = -5.0
  xmax = 55.0
  elem_type = QUAD4
[]

[Variables]
  [uu]
    order = FIRST
    family = LAGRANGE
  []
[]

[ICs]
  [init_cond]
    type = BoundingBoxIC
    variable = uu
    x1 = -0.5
    y1 = -0.5
    x2 = 0.5
    y2 = 0.5
    inside = 50.0
    outside = 0.0
  []
[]

[Kernels]
  [diff]
    type = ADDiffusionParam
    variable = uu
    diffusivity = 0.01
  []
  [time_derv]
    type = ADTimeDerivative
    variable = uu
  []
  [advection]
    type = ConservativeAdvection
    variable = uu
    velocity = '2 0 0'
    upwinding_type = full
  []
[]

[BCs]
  [Periodic]
    [all]
      variable = uu
      auto_direction = 'x y'
    []
  []
[]

[Executioner]
  type = Transient
  solve_type = 'PJFNK'
  num_steps = 50
  dt = 1
[]

[Outputs]
  exodus = true
[]
