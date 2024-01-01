
view: testing_specific {
  derived_table: {
    sql: SELECT
                casts.actual_mass_loading  AS actual_mass_loading,
                electrode_mfg_pouch.electrode_footprint  AS electrode_footprint,
                pre_build_pouch.number_of_layers  AS number_of_layers,
                electrical_cycle_pouch.CapacityC  AS capacity_c,
                electrical_cycle_pouch.CapacityD  AS capacity_d,
                electrical_cycle_pouch.Cycle  AS cycle,
                electrical_cycle_pouch.Cell_Id  AS cell_id,
                electrical_cycle_pouch.CapacityC * 1000 / ((electrode_mfg_pouch.electrode_footprint * pre_build_pouch.number_of_layers) * casts.actual_mass_loading) as specific_capacityC,
                electrical_cycle_pouch.CapacityD * 1000 / ((electrode_mfg_pouch.electrode_footprint * pre_build_pouch.number_of_layers) * casts.actual_mass_loading) as specific_capacityD
            FROM `natrion-operational-data.data.electrical_cycle_pouch` AS electrical_cycle_pouch
            INNER JOIN `natrion-operational-data.operational_data.cell_build` AS cell_build ON cell_build.cell_id = electrical_cycle_pouch.Cell_Id
            INNER JOIN `natrion-operational-data.operational_data.pre_build_pouch`  AS pre_build_pouch ON cell_build.cell_id = pre_build_pouch.cell_id
            INNER JOIN `natrion-operational-data.operational_data.electrode_mfg_pouch`  AS electrode_mfg_pouch ON electrode_mfg_pouch.electrode_id = pre_build_pouch.cathode_id
            INNER JOIN `natrion-operational-data.operational_data.casts`  AS casts ON electrode_mfg_pouch.cast_id = casts.cast_id
            GROUP BY
                1,
                2,
                3,
                4,
                5,
                6,
                7,
                8,
                9
            HAVING specific_capacityC IS NOT NULL

      ORDER BY
      1 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: specific_capacity_c1 {
    type: average
    label: "capacity_c"
    sql: ${TABLE}.specific_capacityC ;;
  }

  measure: specific_capacity_d1 {
    type: average
    label: "capacity_d"
    sql: ${TABLE}.specific_capacityD ;;
  }

  measure: cycle1 {
    type: average
    sql: ${cycle} * 1 ;;
  }

  dimension: actual_mass_loading {
    type: number
    sql: ${TABLE}.actual_mass_loading ;;
  }

  dimension: electrode_footprint {
    type: number
    sql: ${TABLE}.electrode_footprint ;;
  }

  dimension: number_of_layers {
    type: number
    sql: ${TABLE}.number_of_layers ;;
  }

  dimension: capacity_c {
    type: number
    sql: ${TABLE}.capacity_c ;;
  }

  dimension: capacity_d {
    type: number
    sql: ${TABLE}.capacity_d ;;
  }

  dimension: cycle {
    type: number
    sql: ${TABLE}.cycle ;;
  }

  dimension: cell_id {
    type: string
    sql: ${TABLE}.cell_id ;;
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
      actual_mass_loading,
      electrode_footprint,
      number_of_layers,
      capacity_c,
      capacity_d,
      cycle,
      cell_id,
      specific_capacity_c,
      specific_capacity_d
    ]
  }
}
