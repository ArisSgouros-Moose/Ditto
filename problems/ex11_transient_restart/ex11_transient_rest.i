[Mesh]
  file = ${mesh_file}
[]

[Variables]
  [uu]
    order = FIRST
    family = LAGRANGE
    initial_from_file_var = uu
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
  start_time = ${stime}
  end_time = ${etime}
  dt = 1
[]

[Outputs]
  exodus = true
[]
