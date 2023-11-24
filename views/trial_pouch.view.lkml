
view: trial_pouch {
  derived_table: {
    sql: SELECT
          electrode_mfg_pouch.electrode_footprint  AS electrode_mfg_pouch_electrode_footprint,
          pre_build_pouch.cell_id  AS pre_build_pouch_cell_id,
          pre_build_pouch.number_of_layers  AS pre_build_pouch_number_of_layers,
          electrode_mfg_pouch.electrode_footprint * pre_build_pouch.number_of_layers * casts.actual_mass_loading AS total_mass,
          Cycle_Table_Sample.Cell_id AS Cell_id,
          Cycle_Table_Sample.CapacityC AS CapaC,
          Cycle_Table_Sample.CapacityD AS CapaD,
          Cycle_Table_Sample.CapacityC *1000 / (electrode_mfg_pouch.electrode_footprint * pre_build_pouch.number_of_layers * casts.actual_mass_loading) as capacity_C,
          Cycle_Table_Sample.CapacityD *1000 / (electrode_mfg_pouch.electrode_footprint * pre_build_pouch.number_of_layers * casts.actual_mass_loading) as capacity_D,
          Cycle_Table_Sample.Cycle AS Cycle,
          casts.actual_mass_loading  AS casts_actual_mass_loading
      FROM `natrion-operational-data.operational_data.electrode_mfg_pouch`  AS electrode_mfg_pouch
      INNER JOIN `natrion-operational-data.operational_data.pre_build_pouch`  AS pre_build_pouch ON electrode_mfg_pouch.electrode_id = pre_build_pouch.cathode_id
      INNER JOIN `natrion-operational-data.operational_data.casts`  AS casts ON electrode_mfg_pouch.cast_id = casts.cast_id
      INNER JOIN `natrion-operational-data.Data.Cycle_Table_Sample` AS Cycle_Table_Sample ON pre_build_pouch.cell_id = Cycle_Table_Sample.Cell_id
      GROUP BY
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8,
          9,
          10,
          11
      ORDER BY
          1 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: cycle1 {
    type: number
    sql: ${cycle} * 1 ;;
  }

  dimension: electrode_mfg_pouch_electrode_footprint {
    type: number
    sql: ${TABLE}.electrode_mfg_pouch_electrode_footprint ;;
  }

  dimension: pre_build_pouch_cell_id {
    type: string
    sql: ${TABLE}.pre_build_pouch_cell_id ;;
  }

  dimension: pre_build_pouch_number_of_layers {
    type: number
    sql: ${TABLE}.pre_build_pouch_number_of_layers ;;
  }

  dimension: total_mass {
    type: number
    sql: ${TABLE}.total_mass ;;
  }

  dimension: cell_id {
    type: string
    sql: ${TABLE}.Cell_id ;;
  }

  dimension: capa_c {
    type: number
    sql: ${TABLE}.CapaC ;;
  }

  dimension: capa_d {
    type: number
    sql: ${TABLE}.CapaD ;;
  }

  dimension: capacity_c {
    type: number
    sql: ${TABLE}.capacity_C ;;
  }

  dimension: capacity_d {
    type: number
    sql: ${TABLE}.capacity_D ;;
  }

  dimension: cycle {
    type: number
    sql: ${TABLE}.Cycle ;;
  }

  dimension: casts_actual_mass_loading {
    type: number
    sql: ${TABLE}.casts_actual_mass_loading ;;
  }

  set: detail {
    fields: [
        electrode_mfg_pouch_electrode_footprint,
  pre_build_pouch_cell_id,
  pre_build_pouch_number_of_layers,
  total_mass,
  cell_id,
  capa_c,
  capa_d,
  capacity_c,
  capacity_d,
  cycle,
  casts_actual_mass_loading
    ]
  }
}
