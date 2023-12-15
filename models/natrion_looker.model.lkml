connection: "natrion_operational_data"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: natrion_looker_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: natrion_looker_default_datagroup

explore: pouch {}

explore: coin {}


explore: electrical_cycle_pouch {


  join: electrical_step_pouch {
    type: inner
    sql_on: ${electrical_cycle_pouch.cell_id} = ${electrical_step_pouch.cell_id} ;;
    relationship: many_to_one
  }


  join: cell_test {
    type: inner
    sql_on: ${electrical_cycle_pouch.cell_id} = ${cell_test.cell_id} ;;
    relationship: many_to_one
  }
}

explore: electrical_step_pouch {


  join: electrical_cycle_pouch {
    type: inner
    sql_on: ${electrical_step_pouch.cell_id} = ${electrical_cycle_pouch.cell_id} ;;
    relationship: many_to_one
  }

  join: cell_test {
    type: inner
    sql_on: ${electrical_step_pouch.cell_id} = ${cell_test.cell_id} ;;
    relationship: many_to_many
  }

}


explore: eis_coin {
  join: electrical_cycle_coin {
    type: inner
    sql_on: ${eis_coin.cell_id} = ${electrical_cycle_coin.cell_id} ;;
    relationship: one_to_one
  }

  join: electrical_step_coin {
    type: inner
    sql_on: ${eis_coin.cell_id} = ${electrical_step_coin.cell_id} ;;
    relationship: one_to_one
  }
}

explore: eis_pouch {}

explore: electrical_cycle_coin {
  join: electrical_step_coin {
    type: inner
    sql_on: ${electrical_cycle_coin.cell_id} = ${electrical_step_coin.cell_id} ;;
    relationship: many_to_one
  }

  join: cell_test {
    type: left_outer
    sql_on: ${electrical_cycle_coin.cell_id} = ${cell_test.cell_id} ;;
    relationship: many_to_one
  }
}


explore: electrical_step_coin {
  join: cell_test {
    type: inner
    sql_on: ${electrical_step_coin.cell_id} = ${cell_test.cell_id} ;;
    relationship: many_to_one
  }
}


explore: electrode_mfg_coin {
  join: casts {
    type: inner
    sql_on: ${electrode_mfg_coin.cast_id} = ${casts.cast_id} ;;
    relationship: many_to_one

  }

  join: cell_build {
    type: inner
    sql_on: ${electrode_mfg_coin.electrode_id} = ${cell_build.cathode_id} ;;
    relationship: one_to_one
  }
}

explore: cell_build {

  join: pre_build_pouch {
    type: inner
    sql_on: ${cell_build.cell_id} = ${pre_build_pouch.cell_id} ;;
    relationship: one_to_one
  }


  join: electrode_mfg_coin {
    type: inner
    sql_on: ${cell_build.cathode_id} = ${electrode_mfg_coin.electrode_id} ;;
    relationship: one_to_one
  }



  join: cell_test {
    type: inner
    sql_on: ${cell_build.cell_id} = ${cell_test.cell_id} ;;
    relationship: one_to_many
  }

  join: lisic_separators {
    type: inner
    sql_on: ${cell_build.electolyte_id} = ${lisic_separators.membrane_id} ;;
    relationship: many_to_one
  }

  join: users {
    type: inner
    sql_on: ${cell_build.user_id} = ${users.user_id} ;;
    relationship: one_to_many
  }

  join: slurries {
    type: inner
    sql_on: ${cell_build.user_id} = ${slurries.user_id} ;;
    relationship: one_to_many
  }

  join: experiments {
    type: inner
    sql_on: ${cell_build.experiment_id} = ${experiments.experiment_id} ;;
    relationship: many_to_one
  }



}

explore: composites {
  join: pre_build_pouch {
    type: inner
    sql_on: ${composites.component_id} = ${pre_build_pouch.seperator_id} ;;
    relationship: many_to_one
  }
}

explore: casts {

  join: electrode_mfg_pouch {
    type: inner
    sql_on: ${casts.cast_id} = ${electrode_mfg_pouch.cast_id} ;;
    relationship: one_to_many
  }

  join: electrode_mfg_coin {
    type: inner
    sql_on: ${electrode_mfg_coin.cast_id} = ${casts.cast_id} ;;
    relationship: many_to_many
  }

  join: pre_build_pouch {
    type: inner
    sql_on: ${casts.cast_id} = ${pre_build_pouch.cathode_id} ;;
    relationship: one_to_many
  }

  join: experiments {
    type: inner
    sql_on: ${casts.experiment_id} = ${experiments.experiment_id} ;;
    relationship: many_to_one
  }

  join: users {
    type: inner
    sql_on: ${casts.user_id} = ${users.user_id} ;;
    relationship: many_to_one
  }
}

explore: electrode_mfg_pouch {

  join: pre_build_pouch {
    type: inner
    sql_on: ${electrode_mfg_pouch.electrode_id} = ${pre_build_pouch.cathode_id} ;;
    relationship: one_to_many
  }

  join: casts {
    type: inner
    sql_on: ${electrode_mfg_pouch.cast_id} = ${casts.cast_id}  ;;
    relationship: many_to_one
  }
}

explore: pre_build_pouch {
  join: electrode_mfg_pouch {
    type: inner
    sql_on: ${pre_build_pouch.cathode_id} = ${electrode_mfg_pouch.electrode_id} ;;
    relationship: one_to_one
  }

  join: composites {
    type: inner
    sql_on: ${pre_build_pouch.seperator_id} = ${composites.component_id} ;;
    relationship: one_to_many
  }

  join: cell_build {
    type: inner
    sql_on: ${cell_build.cell_id} = ${pre_build_pouch.cell_id}  ;;
    relationship: one_to_one
  }

  join: casts {
    type: inner
    sql_on: ${pre_build_pouch.cathode_id} = ${casts.cast_id} ;;
    relationship: many_to_one
  }

  join: experiments {
    type: inner
    sql_on: ${pre_build_pouch.experiment_id} = ${experiments.experiment_id} ;;
    relationship: many_to_one
  }

  join: step_table_sample {
    type: inner
    sql_on: ${step_table_sample.cell_id} = ${pre_build_pouch.cell_id} ;;
    relationship: many_to_one
  }

  join: eis_pouch {
    type: inner
    sql_on: ${pre_build_pouch.cell_id} = ${eis_pouch.cell_id} ;;
    relationship: many_to_one
  }

}

explore: cell_test {
  join: cell_build {
    type: inner
    sql_on: ${cell_test.cell_id} = ${cell_build.cell_id} ;;
    relationship: many_to_one
  }

  join: protocols {
    type: inner
    sql_on: ${cell_test.protocol_id} = ${protocols.protocol_id} ;;
    relationship: many_to_many
  }

  join: users {
    type: inner
    sql_on: ${cell_test.user_id} = ${users.user_id} ;;
    relationship: many_to_one
  }
}

explore: protocols {
  join: cell_test {
    type: inner
    sql_on: ${protocols.protocol_id} = ${cell_test.protocol_id} ;;
    relationship: many_to_many
  }
}

explore: experiments {
  join: casts {
    type: inner
    sql_on: ${experiments.experiment_id} = ${casts.experiment_id} ;;
    relationship: one_to_many
  }

  join: pre_build_pouch {
    type: inner
    sql_on: ${experiments.experiment_id} = ${pre_build_pouch.experiment_id} ;;
    relationship: one_to_many
  }

  join: campaigns {
    type: inner
    sql_on: ${experiments.campaign_id} = ${campaigns.campaign_id} ;;
    relationship: many_to_one
  }

  join: slurries {
    type: inner
    sql_on: ${experiments.experiment_id} = ${slurries.experiment_id} ;;
    relationship: one_to_many
  }

  join: cell_build {
    type: inner
    sql_on: ${experiments.experiment_id} = ${cell_build.experiment_id} ;;
    relationship: one_to_many

  }
}

explore: campaigns {
  join: experiments {
    type: inner
    sql_on: ${campaigns.campaign_id} = ${experiments.campaign_id} ;;
    relationship: one_to_many
  }
}

explore: users {
  join: cell_build {
  type: inner
  sql_on: ${users.user_id} = ${cell_build.user_id} ;;
  relationship: many_to_one
  }

  join: cell_test {
    type: inner
    sql_on: ${users.user_id} = ${cell_test.user_id} ;;
    relationship: one_to_many
  }

  join: casts {
    type: inner
    sql_on: ${users.user_id} = ${casts.user_id} ;;
    relationship: one_to_many
  }

  join: electrolyte_mfg {
    type: inner
    sql_on: ${users.user_id} = ${electrolyte_mfg.user_id} ;;
    relationship: one_to_many
  }
}

explore: recipes {
  join: slurries {
    type: inner
    sql_on: ${recipes.recipe_id} = ${slurries.recipe_id} ;;
    relationship: one_to_many
  }

  join: casts {
    type: inner
    sql_on: ${recipes.recipe_id} = ${casts.recipe_id} ;;
    relationship: one_to_many
  }

  join: lisic_separators {
    type: inner
    sql_on: ${recipes.recipe_id} = ${lisic_separators.recipe_id} ;;
    relationship: one_to_many
  }

  join: stock_solutions {
    type: inner
    sql_on: ${recipes.recipe_id} = ${stock_solutions.recipe_id} ;;
    relationship: one_to_many
  }

  join: electrolyte_mfg {
    type: inner
    sql_on: ${recipes.recipe_id} = ${electrolyte_mfg.recipe_id} ;;
    relationship: one_to_many
  }

  join: lisic_slurries{
    type: inner
    sql_on: ${recipes.recipe_id} = ${lisic_separators.recipe_id} ;;
    relationship: one_to_many
  }
}

explore: lisic_separators {
  join: cell_build {
    type: inner
    sql_on: ${lisic_separators.membrane_id} = ${cell_build.seperator_id} ;;
    relationship: one_to_many
  }

  join: sop {
    type: inner
    sql_on: ${lisic_separators.sop_id} = ${sop.sop_id} ;;
    relationship: many_to_one
  }

  join: supplies {
    type: inner
    sql_on: ${lisic_separators.supply_id} = ${supplies.supply_id} ;;
    relationship: many_to_one
  }

  join: recipes {
    type: inner
    sql_on: ${lisic_separators.recipe_id} = ${recipes.recipe_id} ;;
    relationship: many_to_one
  }

  join: lisic_slurries {
    type: inner
    sql_on: ${lisic_separators.lisic_slurry_id} = ${lisic_slurries.lisic_slurry_id} ;;
    relationship: many_to_one
  }

  join: experiments {
    type: inner
    sql_on: ${lisic_separators.experiment_id} = ${experiments.experiment_id} ;;
    relationship: many_to_one
  }

}

explore: stock_solutions {
  join: lisic_slurries {
    type: inner
    sql_on: ${stock_solutions.stock_solution_id} = ${lisic_slurries.salt_stock_solution_id} ;;
    relationship: one_to_many
  }

  join: slurries {
    type: inner
    sql_on: ${lisic_slurries.salt_stock_solution_id} = ${slurries.stock_solution_id} ;;
    relationship: one_to_many
  }

  join: recipes {
    type: inner
    sql_on: ${stock_solutions.recipe_id} =  ${recipes.recipe_id};;
    relationship: many_to_one
  }
}

explore: sop {
  join: lisic_slurries {
    type: inner
    sql_on: ${sop.sop_id} = ${lisic_slurries.sop_id} ;;
    relationship: one_to_many
  }

  join: lisic_separators {
    type: inner
    sql_on: ${sop.sop_id} = ${lisic_separators.sop_id} ;;
    relationship: one_to_many
  }
}

explore: electrolyte_mfg {
  join: recipes {
    type: inner
    sql_on: ${electrolyte_mfg.recipe_id} = ${recipes.recipe_id} ;;
    relationship: many_to_one
  }

  join: pre_build_pouch {
    type: inner
    sql_on: ${electrolyte_mfg.electolyte_id} = ${pre_build_pouch.electolyte_id} ;;
    relationship: one_to_many
  }

  join: users {
    type: inner
    sql_on: ${electrolyte_mfg.user_id} = ${users.user_id} ;;
    relationship: many_to_one
  }

  join: supplies {
    type: inner
    sql_on: ${electrolyte_mfg.cots_electrolyte_id_} = ${supplies.supply_id} ;;
    relationship: one_to_one
  }
}

explore: slurries {
  join: casts {
    type: inner
    sql_on: ${slurries.slurry_id} = ${casts.slurry_id} ;;
    relationship: one_to_many
  }

  join: recipes {
    type: inner
    sql_on: ${slurries.recipe_id} = ${recipes.recipe_id} ;;
    relationship: many_to_one
  }

  join: stock_solutions {
    type: inner
    sql_on: ${slurries.stock_solution_id} = ${stock_solutions.stock_solution_id} ;;
    relationship: many_to_one
  }

  join: cell_build {
    type: inner
    sql_on: ${slurries.user_id} = ${cell_build.user_id} ;;
    relationship: many_to_one
  }

  join: experiments {
    type: inner
    sql_on: ${slurries.experiment_id} = ${experiments.experiment_id} ;;
    relationship: many_to_one
  }

  join: supplies {
    type: inner
    sql_on: ${slurries.active_material_id} = ${supplies.supply_id} AND
    ${slurries.conductive_material_id} = ${supplies.supply_id} AND
    ${slurries.solvent_id} = ${supplies.supply_id} ;;
    relationship: many_to_one
  }
}

explore: supplies {
  join: lisic_separators {
    type: inner
    sql_on: ${supplies.supply_id} = ${lisic_separators.supply_id} ;;
    relationship: one_to_many
  }

  join: casts {
    type: inner
    sql_on: ${supplies.supply_id} = ${casts.supply_id} ;;
    relationship: one_to_many
  }

  join: electrolyte_mfg {
    type: inner
    sql_on: ${supplies.supply_id} = ${electrolyte_mfg.cots_electrolyte_id_} AND
    ${supplies.supply_id} = ${electrolyte_mfg.solvent_id} AND
    ${supplies.supply_id} = ${electrolyte_mfg.cosolvent_id} AND
    ${supplies.supply_id} = ${electrolyte_mfg.diluent_id} AND
    ${supplies.supply_id} = ${electrolyte_mfg.salts_id} AND
    ${supplies.supply_id} = ${electrolyte_mfg.additive1_id} AND
    ${supplies.supply_id} = ${electrolyte_mfg.additive2_id} AND
    ${supplies.supply_id} = ${electrolyte_mfg.additive3_id} AND
    ${supplies.supply_id} = ${electrolyte_mfg.additive4_id};;
    relationship: one_to_many
  }

  join: lisic_slurries {
    type: inner
    sql_on: ${supplies.supply_id} = ${lisic_slurries.salt_id} AND
    ${supplies.supply_id} = ${lisic_slurries.polymer_id}_id} AND
    ${supplies.supply_id} = ${lisic_slurries.solvent_id} AND
    ${supplies.supply_id} = ${lisic_slurries.alumino_silicate_id};;
    relationship: one_to_many
  }
}

explore: lisic_slurries {
  join: lisic_separators {
    type: inner
    sql_on: ${lisic_slurries.lisic_slurry_id} = ${lisic_separators.lisic_slurry_id} ;;
    relationship: one_to_many
  }

  join: sop {
    type: inner
    sql_on: ${lisic_separators.sop_id} = ${sop.sop_id} ;;
    relationship: many_to_one
  }

  join: recipes {
    type: inner
    sql_on: ${lisic_separators.recipe_id} = ${recipes.recipe_id} ;;
    relationship: many_to_one
  }

  join: stock_solutions {
    type: inner
    sql_on: ${lisic_slurries.polymer_stock_solution_id} = ${stock_solutions.stock_solution_id} AND
    ${lisic_slurries.salt_stock_solution_id} = ${stock_solutions.stock_solution_id};;
    relationship: many_to_one
  }

  join: experiments {
    type: inner
    sql_on: ${lisic_slurries.experiment_id} = ${experiments.experiment_id} ;;
    relationship: many_to_one
  }
}


explore: median_asr_coin {}

explore: specific {
  join: cell_test {
    type: left_outer
    sql: ${specific.cell_id} = ${cell_test.cell_id} ;;
    relationship: many_to_one
  }
}
explore: final_median_asr {}
explore: specific_eis_pouch {}
explore: specific_coin {}
explore: specific_eis_coin {}


explore: median_asr {
  join: cell_test {
    type: left_outer
    sql_on: ${median_asr.cell_id} = ${cell_test.cell_id} ;;
    relationship: many_to_one
  }
}
