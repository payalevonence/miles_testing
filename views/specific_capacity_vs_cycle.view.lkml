
view: specific_capacity_vs_cycle {
  derived_table: {
    sql: SELECT
          casts.actual_mass_loading  AS casts_actual_mass_loading,
          electrode_mfg_coin.electrode_footprint  AS electrode_mfg_coin_electrode_footprint,
          cell_build.cell_id  AS cell_build_cell_id
      FROM `natrion-operational-data.operational_data.electrode_mfg_coin`  AS electrode_mfg_coin
      INNER JOIN `natrion-operational-data.operational_data.casts`  AS casts ON electrode_mfg_coin.cast_id = casts.cast_id
      INNER JOIN `natrion-operational-data.operational_data.cell_build`  AS cell_build ON electrode_mfg_coin.electrode_id = cell_build.cathode_id
      GROUP BY
          1,
          2,
          3
      ORDER BY
          1 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: casts_actual_mass_loading {
    type: number
    sql: ${TABLE}.casts_actual_mass_loading ;;
  }

  dimension: electrode_mfg_coin_electrode_footprint {
    type: number
    sql: ${TABLE}.electrode_mfg_coin_electrode_footprint ;;
  }

  dimension: cell_build_cell_id {
    type: string
    sql: ${TABLE}.cell_build_cell_id ;;
  }

  measure: capc {
    type: number
    sql: ${cycle_table_sample.capacity_c} * 1000/${total_mass} ;;
  }

  measure: total_mass {
    type: number
    sql: ${specific_capacity_vs_cycle.casts_actual_mass_loading} * ${specific_capacity_vs_cycle.electrode_mfg_coin_electrode_footprint} ;;
  }

  #measure: CapC {
    #  type:number
    #  sql: ${cycle_table_sample.capacity_c} * 1000/${specific_capacity_vs_cycle.total_mass}
    #}

  set: detail {
    fields: [
        casts_actual_mass_loading,
  electrode_mfg_coin_electrode_footprint,
  cell_build_cell_id
    ]
  }
}
