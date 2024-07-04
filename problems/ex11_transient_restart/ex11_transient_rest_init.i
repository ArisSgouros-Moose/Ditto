[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 40
  ny = 40
  ymin = -10.0
  ymax = 10.0
  xmin = -10.0
  xmax = 10.0
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

[Executioner]
  type = Transient
  solve_type = 'PJFNK'
  #num_steps = 3
  end_time = 0.0
  dt = 0.00001
[]

[Outputs]
  exodus = true
[]
