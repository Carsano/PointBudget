class JoinTableGasSimulationContract < ApplicationRecord
  belongs_to :gas_simulation
  belongs_to :gas_contract
end
