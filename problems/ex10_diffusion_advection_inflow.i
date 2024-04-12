[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 60
  ny = 10
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
  [left_uu_injection]
    type = InflowBC
    boundary = left
    variable = uu
    velocity = '2 0 0'
    inlet_conc = 1
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
  num_steps = 50
  dt = 1
[]

[Outputs]
  exodus = true
  csv = true
[]
