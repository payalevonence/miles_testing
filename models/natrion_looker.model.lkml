connection: "natrion-cex-data"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: natrion_looker_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: natrion_looker_default_datagroup

explore: pouch {}

explore: coin {}

explore: step_table_sample {
  join: cell_test {
    type: left_outer
    sql_on: ${step_table_sample.cell_id} = ${cell_test.cell_id} ;;
    relationship: many_to_one
  }

  join: cycle_table_sample {
    type: left_outer
    sql_on: ${cycle_table_sample.cell_id} = ${step_table_sample.cell_id} ;;
    relationship: many_to_one
  }

}

explore: cycle_table_sample {
  join: cell_test {
    type: inner
    sql_on: ${cycle_table_sample.cell_id} = ${cell_test.cell_id} ;;
    relationship: one_to_one
  }

  join: step_table_sample {
    type: left_outer
    sql_on: ${cycle_table_sample.cell_id} = ${step_table_sample.cell_id} ;;
    relationship: many_to_one
  }
}


explore: pouchsample {}

explore: cell_build {
  join: electrode_mfg_coin {
    type: inner
    sql_on: ${cell_build.cathode_id} = ${electrode_mfg_coin.electrode_id} ;;
    relationship: one_to_one
  }

  join: cycle_table_sample {
    type: inner
    sql_on: ${cell_build.cell_id} = ${cycle_table_sample.cell_id} ;;
    relationship: one_to_one
  }

  join: casts {
    type: inner
     sql_on: ${cell_build.cathode_id} = ${casts.cast_id}} ;;
    relationship: one_to_one

  }

  join: pre_build_pouch {
    type: left_outer
    sql_on: ${cell_build.cell_id} = ${pre_build_pouch.cell_id} ;;
    relationship: many_to_one
  }
}

explore: electrode_mfg_coin {
  join: casts {
    type: inner
    sql_on: ${electrode_mfg_coin.cast_id} = ${casts.cast_id} ;;
    relationship: many_to_many

  }

  join: cell_build {
    type: inner
    sql_on: ${cell_build.cathode_id} = ${electrode_mfg_coin.electrode_id} ;;
    relationship: one_to_one
  }
}

explore: casts {
  join: electrode_mfg_coin {
    type: inner
    sql_on: ${electrode_mfg_coin.cast_id} = ${casts.cast_id} ;;
    relationship: many_to_many
  }
}

explore: pre_build_pouch {
  join: electrode_mfg_pouch {
    type: left_outer
    sql_on: ${pre_build_pouch.cathode_id} = ${electrode_mfg_pouch.electrode_id} ;;
    relationship: many_to_one
  }

  join: cell_build {
    type: left_outer
    sql_on: ${cell_build.cell_id} = ${pre_build_pouch.cell_id}  ;;
    relationship: many_to_one
  }
}

explore: cell_test {}

explore: electrode_mfg_pouch {
  join: casts {
    type: inner
    sql_on: ${casts.cast_id} = ${electrode_mfg_pouch.cast_id} ;;
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

explore: electrical_cycle_coin {}

explore: electrical_cycle_pouch {}

explore: electrical_step_coin {}

explore: electrical_step_pouch {}
