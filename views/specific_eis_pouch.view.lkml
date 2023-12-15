
view: specific_eis_pouch {
  derived_table: {
    sql: SELECT
          eis_pouch.Zim  AS eis_pouch_zim,
          eis_pouch.Zre  AS eis_pouch_zre,
          eis_pouch.cell_id  AS eis_pouch_cell_id,
          eis_pouch.Frequency  AS eis_pouch_frequency,
          pre_build_pouch.number_of_layers  AS pre_build_pouch_number_of_layers,
      electrode_mfg_pouch.electrode_footprint  AS electrode_mfg_pouch_electrode_footprint,
      electrode_mfg_pouch.electrode_footprint * pre_build_pouch.number_of_layers AS area_pouch,
      electrode_mfg_pouch.electrode_footprint * pre_build_pouch.number_of_layers * eis_pouch.Zim as specific_zim,
      electrode_mfg_pouch.electrode_footprint * pre_build_pouch.number_of_layers * eis_pouch.Zre as specific_zre
      FROM `natrion-operational-data.data.eis_pouch`  AS eis_pouch
      INNER JOIN `natrion-operational-data.operational_data.pre_build_pouch`  AS pre_build_pouch ON eis_pouch.cell_id = pre_build_pouch.cell_id
      INNER JOIN `natrion-operational-data.operational_data.electrode_mfg_pouch`  AS electrode_mfg_pouch ON pre_build_pouch.cathode_id = electrode_mfg_pouch.electrode_id
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
      ORDER BY
          1
      LIMIT 500 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: eis_zim {
    type: average
    sql: abs(${TABLE}.specific_zim) ;;
  }

  measure: eis_zre {
    type: average
    sql: ${TABLE}.specific_zre * 1 ;;
  }



  dimension: eis_pouch_zim {
    type: number
    sql: ${TABLE}.eis_pouch_zim ;;
  }

  dimension: eis_pouch_zre {
    type: number
    sql: ${TABLE}.eis_pouch_zre ;;
  }

  dimension: eis_pouch_cell_id {
    type: string
    sql: ${TABLE}.eis_pouch_cell_id ;;
  }

  dimension: eis_pouch_frequency {
    type: number
    sql: ${TABLE}.eis_pouch_frequency ;;
  }

  dimension: pre_build_pouch_number_of_layers {
    type: number
    sql: ${TABLE}.pre_build_pouch_number_of_layers ;;
  }

  dimension: electrode_mfg_pouch_electrode_footprint {
    type: number
    sql: ${TABLE}.electrode_mfg_pouch_electrode_footprint ;;
  }

  dimension: area_pouch {
    type: number
    sql: ${TABLE}.area_pouch ;;
  }

  dimension: specific_zim {
    type: number
    sql: ${TABLE}.specific_zim ;;
  }

  dimension: specific_zre {
    type: number
    sql: ${TABLE}.specific_zre ;;
  }


  set: detail {
    fields: [
        eis_pouch_zim,
  eis_pouch_zre,
  eis_pouch_cell_id,
  eis_pouch_frequency,
  pre_build_pouch_number_of_layers,
  electrode_mfg_pouch_electrode_footprint,
  area_pouch,
  specific_zim,
  specific_zre
    ]
  }
}
