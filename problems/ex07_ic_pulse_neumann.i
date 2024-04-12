[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 10
  ny = 10
  ymin = -5.0
  ymax = 5.0
  xmin = -5.0
  xmax = 5.0
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
    value = 0
  []
  [right_uu]
    type = NeumannBC
    variable = uu
    boundary = 'right'
    value = 0
  []
  [top_uu]
    type = NeumannBC
    variable = uu
    boundary = 'top'
    value = 0
  []
  [bottom_uu]
    type = NeumannBC
    variable = uu
    boundary = 'bottom'
    value = 0
  []
[]

[Postprocessors]
  [step_size]             # Size of the time step
    type = TimestepSize
  []
  [iterations]            # Number of iterations needed to converge timestep
    type = NumNonlinearIterations
  []
  [nodes]                 # Number of nodes in mesh
    type = NumNodes
  []
  [evaluations]           # Cumulative residual calculations for simulation
    type = NumResidualEvaluations
  []
  [total_uu]
    type = ElementIntegralVariablePostprocessor
    variable = uu
  []
[]

[Executioner]
  type = Transient
  solve_type = 'PJFNK'
  num_steps = 20
  dt = 1
[]

[Outputs]
  exodus = true
  csv = true
[]
