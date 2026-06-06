export type VARIABLE_TYPE = "Bearer Token" | "Basic Auth" | "API Key" | "Custom Var"

export type VARIABLE_DETAILS = {
    label: VARIABLE_TYPE,
    detail: string,
    suggestedName: string,
    prefix: string

}