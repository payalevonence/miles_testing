view: experiments {
  sql_table_name: `natrion-operational-data.operational_data.experiments` ;;
  drill_fields: [experiment_id]

  dimension: experiment_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.experiment_id ;;
  }
  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: parent_id {
    type: number
    sql: ${TABLE}.parent_id ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [experiment_id]
  }
}
