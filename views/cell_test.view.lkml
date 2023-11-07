view: cell_test {
  sql_table_name: `natrion-operational-data.operational_data.cell_test` ;;

  dimension: assembly_ocp {
    type: number
    sql: ${TABLE}.assembly_ocp ;;
  }
  dimension: cell_id {
    type: string
    sql: ${TABLE}.cell_id ;;
  }
  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }
  dimension: compression_amount {
    type: number
    sql: ${TABLE}.compression_amount ;;
  }
  dimension: compression_method {
    type: string
    sql: ${TABLE}.compression_method ;;
  }
  dimension: cycler {
    type: string
    sql: ${TABLE}.cycler ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: post_rest_ocp {
    type: number
    sql: ${TABLE}.post_rest_ocp ;;
  }
  dimension: protocol_id {
    type: string
    sql: ${TABLE}.protocol_id ;;
  }
  dimension_group: test {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.test_date ;;
  }
  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
  }
}
