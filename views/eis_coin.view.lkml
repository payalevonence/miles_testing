view: eis_coin {
  sql_table_name: `natrion-operational-data.Data.eis_coin` ;;

  dimension: cell_id {
    type: string
    sql: ${TABLE}.Cell_Id ;;
  }
  dimension: configuration_identifier {
    type: string
    sql: ${TABLE}.Configuration_Identifier ;;
  }
  dimension_group: date_mapping {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date_Mapping ;;
  }
  dimension: electrolyte_identifier {
    type: string
    sql: ${TABLE}.Electrolyte_Identifier ;;
  }
  dimension: filename {
    type: string
    sql: ${TABLE}.Filename ;;
  }
  dimension: frequency_hz {
    type: number
    sql: ${TABLE}.Frequency_Hz ;;
  }
  dimension: lisic_identifier {
    type: string
    sql: ${TABLE}.LISIC_Identifier ;;
  }
  dimension: number {
    type: number
    sql: ${TABLE}.Number ;;
  }
  dimension: project_identifier {
    type: string
    sql: ${TABLE}.Project_Identifier ;;
  }
  dimension: specific_identifier {
    type: string
    sql: ${TABLE}.Specific_Identifier ;;
  }
  dimension: zim_ohms {
    type: number
    sql: ${TABLE}.Zim_ohms ;;
  }
  dimension: zre_ohms {
    type: number
    sql: ${TABLE}.Zre_ohms ;;
  }
  measure: count {
    type: count
    drill_fields: [filename]
  }
}
