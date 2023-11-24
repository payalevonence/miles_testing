
view: trial1 {
  derived_table: {
    sql: SELECT
          electrode_mfg_coin.electrode_footprint as electrode_footprint,
          casts.actual_mass_loading AS actual_mass_loading,
          electrode_mfg_coin.electrode_footprint * casts.actual_mass_loading AS total_mass,
          Cycle_Table_Sample.Cell_id AS Cell_id,
          Cycle_Table_Sample.CapacityC AS CapacityC,
          Cycle_Table_Sample.CapacityC *1000 / (electrode_mfg_coin.electrode_footprint * casts.actual_mass_loading) as capc,
          Cycle_Table_Sample.CapacityD *1000 / (electrode_mfg_coin.electrode_footprint * casts.actual_mass_loading) as capd,
          Cycle_Table_Sample.CapacityD AS CapacityD,
          Cycle_Table_Sample.Cycle AS Cycle,
          cell_build.cell_id  AS cell_build_cell_id
      FROM `natrion-operational-data.operational_data.electrode_mfg_coin`  AS electrode_mfg_coin
      INNER JOIN `natrion-operational-data.operational_data.casts`  AS casts ON electrode_mfg_coin.cast_id = casts.cast_id
      INNER JOIN `natrion-operational-data.operational_data.cell_build`  AS cell_build ON electrode_mfg_coin.electrode_id = cell_build.cathode_id
      INNER JOIN `natrion-operational-data.Data.Cycle_Table_Sample` AS Cycle_Table_Sample ON cell_build.cell_id = Cycle_Table_Sample.Cell_id
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
          10
      ORDER BY
          1
      LIMIT 500 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: capacityc1 {
    type: number
    sql: ${capacity_c} *1000/${total_mass} ;;
    value_format_name: decimal_2
  }


  dimension: electrode_footprint {
    type: number
    sql: ${TABLE}.electrode_footprint ;;
  }

  dimension: actual_mass_loading {
    type: number
    sql: ${TABLE}.actual_mass_loading ;;
  }

  dimension: total_mass {
    type: number
    sql: ${TABLE}.total_mass ;;
  }

  dimension: cell_id {
    type: string
    sql: ${TABLE}.Cell_id ;;
  }

  dimension: capacity_c {
    type: number
    sql: ${TABLE}.CapacityC ;;
  }

  dimension: capc {
    type: number
    sql: ${TABLE}.capc ;;
  }

  dimension: capd {
    type: number
    sql: ${TABLE}.capd ;;
  }

  dimension: capacity_d {
    type: number
    sql: ${TABLE}.CapacityD ;;
  }

  dimension: cycle {
    type: number
    sql: ${TABLE}.Cycle ;;
  }

  dimension: cell_build_cell_id {
    type: string
    sql: ${TABLE}.cell_build_cell_id ;;
  }

  set: detail {
    fields: [
        electrode_footprint,
  actual_mass_loading,
  total_mass,
  cell_id,
  capacity_c,
  capc,
  capd,
  capacity_d,
  cycle,
  cell_build_cell_id
    ]
  }
}
