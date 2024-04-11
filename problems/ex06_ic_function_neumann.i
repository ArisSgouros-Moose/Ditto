[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 40
  ny = 40
  ymin = 0.0
  ymax = 200.0
  xmin = 0.0
  xmax = 200.0
  elem_type = QUAD4
[]

[Variables]
  [uu]
    order = FIRST
    family = LAGRANGE
  []
[]

[ICs]
  [func]
    type = FunctionIC
    function = '0.5 + 0.01*(cos(0.105*x)*cos(0.11*y) + (cos(0.13*x)*cos(0.087*y))^2 + cos(0.025*x-0.15*y)*cos(0.07*x-0.02*y))'
    variable = uu
  [../]
[]

[Kernels]
  [diff]
    type = ADDiffusion
    variable = uu
  []
  [time_derv]
    type = ADTimeDerivative
    variable = uu
  []
[]

[BCs]
  [left_uu]
    type = NeumannBC
    variable = uu
    boundary = 'left'
    value = 0.0
  []
  [right_uu]
    type = NeumannBC
    variable = uu
    boundary = 'right'
    value = 0.0
  []
  [top_uu]
    type = NeumannBC
    variable = uu
    boundary = 'top'
    value = 0.0
  []
  [bottom_uu]
    type = NeumannBC
    variable = uu
    boundary = 'bottom'
    value = 0.0
  []
[]

[Executioner]
  type = Transient
  solve_type = 'PJFNK'
  num_steps = 100
  dt = 1
[]

[Outputs]
  exodus = true
[]
