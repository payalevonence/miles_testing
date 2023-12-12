
view: final_capacity_coin {
  derived_table: {
    sql: SELECT
          electrical_cycle_coin.CapacityC  AS electrical_cycle_coin_capacity_c,
          electrical_cycle_coin.CapacityD  AS electrical_cycle_coin_capacity_d,
          electrical_cycle_coin.Cell_Id  AS electrical_cycle_coin_cell_id,
          electrical_cycle_coin.Cycle  AS electrical_cycle_coin_cycle,
          electrode_mfg_coin.electrode_footprint  AS electrode_mfg_coin_electrode_footprint,
          casts.actual_mass_loading  AS casts_actual_mass_loading,
          electrode_mfg_coin.electrode_footprint * casts.actual_mass_loading as total_mass,
          cell_build.cell_id  AS cell_build_cell_id,
          electrical_cycle_coin.CapacityC * 1000 / (electrode_mfg_coin.electrode_footprint * casts.actual_mass_loading) as specific_capacityC,
          electrical_cycle_coin.CapacityD * 1000 / (electrode_mfg_coin.electrode_footprint * casts.actual_mass_loading) as specific_capacityD
      FROM `natrion-operational-data.data.electrical_cycle_coin`  AS electrical_cycle_coin
      INNER JOIN `natrion-operational-data.operational_data.cell_build`  AS cell_build ON electrical_cycle_coin.Cell_Id = cell_build.cell_id
      INNER JOIN `natrion-operational-data.operational_data.electrode_mfg_coin`  AS electrode_mfg_coin ON electrode_mfg_coin.electrode_id = cell_build.cathode_id 
      INNER JOIN `natrion-operational-data.operational_data.casts`  AS casts ON electrode_mfg_coin.cast_id = casts.cast_id
      GROUP BY
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8
      ORDER BY
          1 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: electrical_cycle_coin_capacity_c {
    type: number
    sql: ${TABLE}.electrical_cycle_coin_capacity_c ;;
  }

  dimension: electrical_cycle_coin_capacity_d {
    type: number
    sql: ${TABLE}.electrical_cycle_coin_capacity_d ;;
  }

  dimension: electrical_cycle_coin_cell_id {
    type: string
    sql: ${TABLE}.electrical_cycle_coin_cell_id ;;
  }

  dimension: electrical_cycle_coin_cycle {
    type: number
    sql: ${TABLE}.electrical_cycle_coin_cycle ;;
  }

  dimension: electrode_mfg_coin_electrode_footprint {
    type: number
    sql: ${TABLE}.electrode_mfg_coin_electrode_footprint ;;
  }

  dimension: casts_actual_mass_loading {
    type: number
    sql: ${TABLE}.casts_actual_mass_loading ;;
  }

  dimension: total_mass {
    type: number
    sql: ${TABLE}.total_mass ;;
  }

  dimension: cell_build_cell_id {
    type: string
    sql: ${TABLE}.cell_build_cell_id ;;
  }

  dimension: specific_capacity_c {
    type: number
    sql: ${TABLE}.specific_capacityC ;;
  }

  dimension: specific_capacity_d {
    type: number
    sql: ${TABLE}.specific_capacityD ;;
  }

  set: detail {
    fields: [
        electrical_cycle_coin_capacity_c,
	electrical_cycle_coin_capacity_d,
	electrical_cycle_coin_cell_id,
	electrical_cycle_coin_cycle,
	electrode_mfg_coin_electrode_footprint,
	casts_actual_mass_loading,
	total_mass,
	cell_build_cell_id,
	specific_capacity_c,
	specific_capacity_d
    ]
  }
}
