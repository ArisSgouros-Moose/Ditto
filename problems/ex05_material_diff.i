[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 80
  ny = 40
  ymin = -10.0
  ymax = 10.0
  xmin = 0.0
  xmax = 40.0
  elem_type = QUAD4
[]

[Variables]
  [uu]
    order = FIRST
    family = LAGRANGE
  []
[]

[Kernels]
  [diff]
    type = ADDiffusionMaterial
    variable = uu
  []
  [time_derv]
    type = ADTimeDerivative
    variable = uu
  []
[]

[BCs]
  [left_uu]
    type = DirichletBC
    variable = uu
    boundary = 'left'
    value = 1
  []
  [right_uu]
    type = DirichletBC
    variable = uu
    boundary = 'right'
    value = 0
  []
[]

[Materials]
  [var_diff]
    type = Permeability
    fdiff = 'if(y>0,1.0,20.0*t/200)'
    outputs = exodus
  []
[]

[Executioner]
  type = Transient
  solve_type = 'PJFNK'
  num_steps = 200
  dt = 1
[]

[Outputs]
  exodus = true
[]
